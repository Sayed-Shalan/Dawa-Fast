import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

import '../models/user.dart';

///Storage Keys
enum PreferenceKeys {
  keyAppLocal,
  keyClient,
  keyUserToken,
}

class AppPreferences {
  //Data
  late GetStorage _storage;

  //init
  init() async {
    await GetStorage.init();
    _storage = GetStorage();
  }

  ///App Locale ****************************************************************
  String? currentLocal() {
    return _storage.read(PreferenceKeys.keyAppLocal.toString()); // Language
  }

  setCurrentLocale(String? language) {
    _storage.write(PreferenceKeys.keyAppLocal.toString(), language);
  }

  ///Client data *************************************************
  set user(User? client) {
    debugPrint(client!.toMap().toString());
    String user = jsonEncode(client.toMap());
    _storage.write(PreferenceKeys.keyClient.toString(), user);
  }

  User? get user {
    String clientStr = _storage.read(PreferenceKeys.keyClient.toString()) ?? "";
    if (clientStr.isEmpty) return null;
    return User.fromMap(json.decode(clientStr));
  }

  ///Token *************************************************
  set userToken(String? userToken) => _storage.write(PreferenceKeys.keyUserToken.toString(), userToken);

  String? get userToken=> _storage.read(PreferenceKeys.keyUserToken.toString());

  ///Clear *********************************************************************
  clear() async {
    String? local = currentLocal();

    await _storage.erase();

    setCurrentLocale(local);
  }
}
