import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:hufs_capstone/pet_info/data/pet_info_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PetInfoService {
  static Future<Either<bool, PetInfoModel>> getPetInfo(int userId) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? value = prefs.getString(id.toString());
    if (value != null) {
      return Right(PetInfoModel.fromJson(json.decode(value)));
    } else {
      return const Left(false);
    }
  }

  static Future<Either<bool, PetInfoModel>> createPerInfo(
      PetInfoModel petinfo) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final bool value =
        await prefs.setString(petinfo.userId.toString(), json.encode(petinfo));
    if (value) {
      return Right(petinfo);
    } else {
      return Left(false);
    }
  }
}
