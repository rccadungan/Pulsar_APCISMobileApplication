import 'package:http/http.dart' as http;
import 'package:pulsar/model/login_model.dart';
import 'package:pulsar/services/shared_service.dart';

class APIServices {
  static var client = http.Client();
  static String apiURL =
      "http://ec2-user@ec2-13-229-235-45.ap-southeast-1.compute.amazonaws.com:8080/api/getStudent";

  static Future<bool> loginCustomer(String username, String password) async {
    Map<String, String> requestHeaders = {
      'Content-type': 'application/x-www-form-urlencoded'
    };

    var response = await client.post('$apiURL', headers: requestHeaders, body: {
      "username": username,
      "password": password,
    });

    if (response.statusCode == 201) {
      var jsonString = response.body;
      LoginResponseModel responseModel = loginResponseFromJson(jsonString);

      if (responseModel.statusCode == 201) {
        SharedService.setLoginDetails(responseModel);
      }

      return responseModel.statusCode == 201 ? true : false;
    }

    return false;
  }
}
