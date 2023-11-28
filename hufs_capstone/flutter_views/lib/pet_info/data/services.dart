import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:dartz/dartz.dart';
import 'package:flutter_views/pet_info/ViewModel/pet_info_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PetInfoService {
  static Future<PetInfoModel> getPetInfo(int userId) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? value = prefs.getString(id.toString());
    if (value != null) {
      return PetInfoModel.fromJson(json.decode(value));
    } else {
      return PetInfoModel(pet_id: -1);
    }
  }

  static Future<PetInfoModel> createPerInfo(PetInfoModel petinfo) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final bool value =
        await prefs.setString(petinfo.pet_id.toString(), json.encode(petinfo));
    if (value) {
      return petinfo;
    } else {
      return PetInfoModel(pet_id: -1);
    }
  }

  static Future<String> uploadFile(PetInfoModel petStatusModel) async {
    // http 통신

    try {
      var response = await http.post(Uri.parse('http://localhost:8000/api/pet'),
          body: jsonEncode(petStatusModel.toJson()));

      print(jsonEncode(petStatusModel.toJson()));

      if (response.statusCode == 200) {
        print('File uploaded');
        return "success";
      } else {
        print('File upload failed with status code: ${response.statusCode}');
        return 'fail';
      }
    } catch (e) {
      print('File upload error: $e');
      return 'fail';
    }
  }
}
