import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:hufs_capstone/pet_info/ViewModel/pet_info_model.dart';
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
}
