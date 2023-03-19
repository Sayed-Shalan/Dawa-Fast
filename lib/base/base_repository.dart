import 'dart:async';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../helper/auth_helper.dart';
import '../helper/callback.dart';
import '../models/api/error_model.dart';
import '../models/api/resource.dart';
import 'dio/dio_client.dart';

abstract class BaseRepository {
  /// Use [fetch,update,create,delete] ex fetchUserData(), updatePhoneNumber(), deletePost() || action name in unique cases .. and so on.

  //Dio getter
  DioClient get dioClient => Get.find();
  late Dio dio;

  BaseRepository() {
    dio = dioClient.dio;
  }

  //Controllers needs to disabled
  final List<StreamSubscription> _disposableList = [];

  //Paging
  final pageLimit = 10;

  //error rx
  var errorObservable = ErrorModel().obs;

  setError(ErrorModel? errorData) {
    errorObservable.value = errorData!;
  }

  //Error Handler
  Resource handleError(e) {
    if (e is SocketException) {
      return Resource.error(
          errorData: ErrorModel(message: 'no_internet_connection'.tr));
    }

      if(e is DioErrorType){
      DioErrorType errorType= e;
      debugPrint('handleError DioErrorType------ ${errorType.name}');
      return Resource.error(errorData: ErrorModel(message: errorType.name));
    }

        if(e is DioError){
          DioError error = e;
          DioErrorType errorType = e.type;
          debugPrint('handleError DioError------ ${error.error}');
          if(errorType == DioErrorType.other){
            return Resource.error(
                errorData: ErrorModel(
                    message:
                    error.error is SocketException ? 'no_internet_connection'.tr
                   : error.error is HttpException ? 'no_internet_connection'.tr
                        : 'something_went_wrong'.tr));
          }else {
            return Resource.error(errorData: ErrorModel(message:error.error ??  'unauthenticated'.tr));
          }
    }
    return Resource.error(errorData: ErrorModel(message: e.toString()));

  }

  Resource baseHandleError(e) {
    return Resource.error(errorData: ErrorModel(message: e.toString()));
  }

  /// Request methods *******************************************

  //Generic request methods
  Future<Resource> request(
      {bool pushError = true, required RequestCallback callback}) async {
    try {
      Resource resource = await callback.call();
      if (resource.isSuccess()) debugPrint("DATA = ${resource.data}");
      if (resource.isError() && pushError && resource.errorData != null) {
        setError(resource.errorData);
      }
      return resource;
    } catch (e, stackTrace) {
      debugPrint("Error = $stackTrace");
      debugPrint("Error = $e");
      Resource resource;
      if(e is DioError) {
        resource = handleError(e);
      }else{
        resource = baseHandleError(e);
      }
      if (resource.isError() && pushError && resource.errorData != null) {
        if(resource.data == null){
          await Get.find<AuthHelper>().logout();
          // Get.offAllNamed(Routes.login);
          setError(ErrorModel(message: 'unauthenticated'.tr));
        }else{
          setError(resource.errorData);
        }
      }
      return resource;
    }
  }

  //Generic request real-time methods
  Stream<Resource> realTimeRequest(
      {bool pushError = true, required ListenerCallback callback}) async* {
    try {
      yield* callback.call();
    } catch (e, stackTrace) {
      debugPrint("Error $stackTrace"); // log error
      Resource resource = handleError(e);
      if (resource.isError() && pushError && resource.errorData != null) {
        setError(resource.errorData);
      }
      yield resource;
    }
  }



  ///close controllers
  void dispose() {
    errorObservable.close();
    for (StreamSubscription? controller in _disposableList) {
      if (controller != null) controller.cancel();
    }
  }

  ///Helper methods ****
  addDisposable(StreamSubscription subscription) =>
      _disposableList.add(subscription);


}
