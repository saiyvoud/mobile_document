import 'dart:convert';
import 'dart:io';

import 'package:hive_ce/hive.dart';
import 'package:path_provider/path_provider.dart';

class HiveDatabase {
  static BoxCollection? box;

  Future<BoxCollection?> hiveDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    box = await BoxCollection.open(
      'mobile_document', // Name of your database
      {'auth'}, // Names of your boxes
      path: directory.path,
    );
    return box;
  }

  static Future<dynamic> getToken() async {
    final userBox = await box!.openBox<Map>('auth');
    final data = await userBox.getAll(['tokens']);
    return data[0];
  }

  static Future<bool> deleteToken() async {
    final userBox = await box!.openBox<Map>('auth');
    await userBox.deleteAll(['tokens']);

    return true;
  }

  static Future<dynamic> getProfile() async {
    final userBox = await box!.openBox<Map>('auth');
    final data = await userBox.getAll(['profile']);
    final respone = jsonDecode(data[0]!['data']);

    return respone;
  }

  static Future<bool> saveProfile({required String profile}) async {
    final userBox = await box!.openBox<Map>('auth');
    await userBox.put("profile", {"data": profile});
    return true;
  }

  static Future<bool> saveToken({
    required String token,
    required String refresh,
  }) async {
    final userBox = await box!.openBox<Map>('auth');

    await userBox.put("tokens", {
      "accessToken": token,
      "refreshToken": refresh,
    });
    return true;
  }
}
