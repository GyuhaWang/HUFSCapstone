import 'package:dartz/dartz.dart';
import 'package:get/get.dart';

import 'package:hufs_capstone/pet_info/ViewModel/pet_info_model.dart';

import 'package:hufs_capstone/pet_info/data/services.dart';

class PetInfoController extends GetxController {
  static PetInfoController get to => Get.find();
  final Rx<PetInfoModel> _petInfo = PetInfoModel(pet_id: -1).obs;
  get petInfo => _petInfo.value;

  Future<void> getPetInfo(int userId) async {
    PetInfoModel petInfoFromService = await PetInfoService.getPetInfo(userId);

    _petInfo(petInfoFromService);
  }

  Future<bool> createPetInfo(PetInfoModel petInfo) async {
    PetInfoModel createPetInfoModel =
        await PetInfoService.createPerInfo(petInfo);
    _petInfo(createPetInfoModel);
    return !petInfo.isEmpty();
  }
}
