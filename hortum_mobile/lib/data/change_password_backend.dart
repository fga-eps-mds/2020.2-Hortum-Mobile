import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:hortum_mobile/globals.dart';

class ChangePasswordAPI {
  Dio dio;

  ChangePasswordAPI([Dio client]) {
    if (client == null) {
      this.dio = Dio();
    } else {
      this.dio = client;
    }
  }

  Future changePassword(String actualPassword, String newPassword) async {
    //Trocar o IPLOCAL pelo ip de sua máquina
    var url = 'http://$ip:8000/users/change-password/';
    // String userAccessToken = await actualUser.readSecureData('token_access');
    var header = {
      "Content-Type": "application/json",
      "Authorization": "Bearer " + actualUser.tokenAccess,
    };

    Map params = {
      "old_password": actualPassword,
      "new_password": newPassword,
    };

    String _body = json.encode(params);
    Response response = await dio.patch(url,
        data: _body,
        options: Options(
          headers: header,
          validateStatus: (status) {
            return status <= 500;
          },
        ));
    return response.statusCode;
  }
}

// Response response = await dio
//         .put(url,
//             data: _body,
//             options: Options(
//               headers: header,
//               validateStatus: (status) {
//                 return status <= 500;
//               },
//             ))
//         .then((value) {
//       return value;
//     });
