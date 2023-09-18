import 'package:tech_leaning_app/common/entities/user.dart';

import '../utils/http_utils.dart';

class UserApi {
  static login({LoginRequestEntity? params}) async {
    var response =
        await HttpUtil().post('api/login', queryParameters: params?.toJson());

    print(response.toString());

    return UserLoginResponseEntity.fromJson(response);
  }
}
