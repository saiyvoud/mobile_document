import 'package:http/http.dart' as http;
import 'package:mobile_document/api/apiPath.dart';
import 'package:mobile_document/components/apiResponse.dart';
import 'package:mobile_document/components/hiveDatabase.dart';

class AuthApi {
  Future<bool> Login({required String email, required String password}) async {
    try {
      final url = Uri.parse(ApiPath.login);
      final header = {"Accept": "application/json"};
      final body = {"email": email, "password": password};
      final response = await http.post(url, body: body, headers: header);
      // final data = apiResponseFromJson(response.toString());
      if (response.statusCode == 200) {
        // await HiveDatabase.saveToken(
        //   token: data.data['token'],
        //   refresh: data.data['refreshToken'],
        // );
        // await HiveDatabase.saveProfile(profile: data.data.toString());
        return true;
      }
      return false;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> Forgot({required String email, required String password}) async {
    try {
      final url = Uri.parse(ApiPath.forgot);
      final header = {"Accept": "application/json"};
      final body = {"email": email, "password": password};
      final response = await http.put(url, body: body, headers: header);

      if (response.statusCode == 200) {
        return true;
      }
      return false;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> Register({
    required String usernamme,
    required String email,
    required String phoneNumber,
    required String password,
  }) async {
    try {
      final url = Uri.parse(ApiPath.register);
      final header = {"Accept": "application/json"};
      final body = {
        "username": usernamme,
        "email": email,
        "phoneNumber": phoneNumber,
        "password": password,
        "faculty_id": "null",
        "office_id": "null",
      };
      final response = await http.post(url, body: body, headers: header);
        print(response.body);
      if (response.statusCode == 201) {
        return true;
      }
      return false;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
