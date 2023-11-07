import 'package:dartz/dartz.dart';
import 'package:get/get.dart';

import 'package:hufs_capstone/pet_info/data/pet_info_model.dart';

import 'package:hufs_capstone/pet_info/data/services.dart';

class PetInfoController extends GetxController {
  static PetInfoController get to => Get.find();
  final Rx<PetInfoModel> _petInfo = PetInfoModel(userId: -1).obs;
  get petInfo => _petInfo.value;
  Future<void> getPetInfo(int userId) async {
    Either<bool, PetInfoModel> petInfoFromService =
        await PetInfoService.getPetInfo(userId);
    if (petInfoFromService.isRight()) {
      _petInfo(petInfoFromService.getOrElse(() => const PetInfoModel(
            userId: -1,
          )));
    } else {
      _petInfo(const PetInfoModel(
        userId: -1,
      ));
    }
  }

  Future<void> createPetInfo(PetInfoModel petInfo) async {
    Either<bool, PetInfoModel> createPetInfoModel =
        await PetInfoService.createPerInfo(petInfo);
    if (createPetInfoModel.isRight()) {
      _petInfo(createPetInfoModel.getOrElse(() => const PetInfoModel(
            userId: -1,
          )));
    } else {
      _petInfo(const PetInfoModel(
        userId: -1,
      ));
    }
  }
}
