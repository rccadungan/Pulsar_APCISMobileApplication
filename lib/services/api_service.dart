import 'package:http/http.dart' as http;
import 'package:pulsar/model/clearance_model.dart';
import 'package:pulsar/model/login_model.dart';
import 'package:pulsar/services/shared_service.dart';

class APIServices {
  static var client = http.Client();
  static String apiURL =
      "http://ec2-user@ec2-13-229-235-45.ap-southeast-1.compute.amazonaws.com:8080/api/login";

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

//Clearance Module API Service
class ClearanceServices {
  static const String url =
      'http://ec2-user@ec2-13-229-235-45.ap-southeast-1.compute.amazonaws.com:8080/api/clearances';

  static Future<List<StudentClearance>> getClearance() async {
    try {
      final response = await http.get(url);
      if (200 == response.statusCode) {
        final List<StudentClearance> clearance =
            clearancesFromJson(response.body) as List<StudentClearance>;
        return clearance;
      } else {
        return List<StudentClearance>();
      }
    } catch (e) {
      return List<StudentClearance>();
    }
  }
}
