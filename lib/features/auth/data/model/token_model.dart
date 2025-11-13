import 'package:connectly_flutter/features/auth/domain/entities/token_entity.dart';

class TokenModel extends TokenEntity {
  TokenModel({required super.token});
  factory TokenModel.fromJson(Map<String, dynamic> json) {
    return TokenModel(token: json['token']);
  }
  Map<String, String> toJoson() {
    return {"token": token};
  }
}
