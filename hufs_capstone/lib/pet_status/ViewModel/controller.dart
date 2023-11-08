import 'package:dartz/dartz.dart';
import 'package:get/get.dart';

import 'package:hufs_capstone/pet_info/ViewModel/pet_info_model.dart';

import 'package:hufs_capstone/pet_info/data/services.dart';

class PetInfoController extends GetxController {
  static PetInfoController get to => Get.find();
  final Rx<PetInfoModel> _petInfo = PetInfoModel(pet_id: -1).obs;
  get petInfo => _petInfo.value;
  Future<void> getStatus(int userId) async {}

  Future<void> createPetStatus(PetInfoModel petInfo) async {}
}
