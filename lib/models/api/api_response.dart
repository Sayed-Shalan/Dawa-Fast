class ApiResponse {
  Response? response;
  Map? data;

  ApiResponse({this.response, this.data});

  Map<String, dynamic> toMap() {
    return {
      'response': response,
      'data': data,
    };
  }

  factory ApiResponse.fromMap(Map<String, dynamic> map) {
    return ApiResponse(
      response: map['response'] != null ? Response.fromMap(map['response']) : null,
      data: map['data'],
    );
  }
}

class Response {
  bool? success;
  String? type;
  int? code;
  String? reason;
  String? message;

  Response({this.success, this.type, this.code, this.reason, this.message});

  Map<String, dynamic> toMap() {
    return {
      'success': success,
      'type': type,
      'code': code,
      'reason': reason,
      'message': message,
    };
  }

  factory Response.fromMap(Map<String, dynamic> map) {
    return Response(
      success: map['success'],
      type: map['type'],
      code: map['code'],
      reason: map['reason'],
      message: map['message'],
    );
  }
}


class CreatedByUser{
  String? uuid;
  String? name;

  CreatedByUser({
    this.uuid,
    this.name,
  });

  Map<String, dynamic> toMap() {
    return {
      'uuid': uuid,
      'name': name,
    };
  }

  factory CreatedByUser.fromMap(Map<String, dynamic> map) {
    return CreatedByUser(
      uuid: map['uuid'] ,
      name: map['name'] ,
    );
  }
}
