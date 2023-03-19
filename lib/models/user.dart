import 'package:get/get.dart';
import 'helper_models/title_model.dart';

class User extends TitleModel {
  String? uuid;
  String? name;
  String? email;
  String? phone;
  String? avtar;
  String? signature;
  String? jop;
  String? createdByUser;
  String? updatedByUser;
  String? deletedByUser;
  DateTime? createdAt;
  DateTime? updatedAt;
  DateTime? deletedAt;

  User({
    this.uuid,
    this.name,
    this.email,
    this.phone,
    this.avtar,
    this.signature,
    this.jop,
    this.createdByUser,
    this.updatedByUser,
    this.deletedByUser,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  @override
  String get title => name ?? 'not_specified'.tr;

  Map<String, dynamic> toMap() {
    return {
      'uuid': uuid,
      'name': name,
      'email': email,
      'phone': phone,
      'avtar': avtar,
      'signature': signature,
      'jop': jop,
      'created_by_user': createdByUser,
      'updated_by_user': updatedByUser,
      'deleted_by_user': deletedByUser,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'deleted_at': deletedAt,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      uuid: map['uuid'],
      name: map['name'],
      email: map['email'],
      phone: map['phone'],
      avtar: map['avtar'],
      signature: map['signature'],
      jop: map['jop'],
      createdByUser: map['created_by_user'],
      updatedByUser: map['updated_by_user'],
      deletedByUser: map['deleted_by_user'],
      // createdAt: map['created_at'] ,
      // updatedAt: map['updated_at'] ,
      // deletedAt: map['deleted_at'] ,
    );
  }
}
