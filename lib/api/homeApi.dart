import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mobile_document/api/apiPath.dart';

class HomeApi {
  Future<List<dynamic>?> DocumentIn() async {
    try {
      final url = Uri.parse(ApiPath.getDocumentIn);
      final header = {"Accept": "application/json"};

      final response = await http.get(url, headers: header);
      final data = jsonDecode(response.body);

      if (data['success'] == true) {
        return data['data'];
      }
      return null;
    } catch (e) {
      print("Exception: $e");
      return null;
    }
  }

  Future<List<dynamic>> DocumentOut() async {
    try {
      final url = Uri.parse(ApiPath.getDocumentOut);
      final header = {"Accept": "application/json"};

      final response = await http.get(url, headers: header);
      final data = jsonDecode(response.body);

      if (data['success'] == true) {
        return data['data'];
      }
      return data['message'];
    } catch (e) {
      print("Exception: $e");
      rethrow;
    }
  }

  Future<List<dynamic>> SearchOut({required String search}) async {
    try {
      final url = Uri.parse(ApiPath.searchOut + search);
      final header = {"Accept": "application/json"};

      final response = await http.get(url, headers: header);
      final data = jsonDecode(response.body);

      if (data['success'] == true) {
        print("===>${data['data']}");
        return data['data'];
      }
      return data['message'];
    } catch (e) {
      print("Exception: $e");
      rethrow;
    }
  }

  Future<List<dynamic>> SearchIn({required String search}) async {
    try {
      final url = Uri.parse(ApiPath.searchIn + search);
      final header = {"Accept": "application/json"};

      final response = await http.get(url, headers: header);
      final data = jsonDecode(response.body);

      if (data['success'] == true) {
        return data['data'];
      }
      return data['message'];
    } catch (e) {
      print("Exception: $e");
      rethrow;
    }
  }
}
