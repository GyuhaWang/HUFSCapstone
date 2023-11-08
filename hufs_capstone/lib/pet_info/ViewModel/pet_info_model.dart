import 'package:dartz/dartz.dart';
import 'package:hufs_capstone/pet_info/data/services.dart';

class PetInfoModel {
  int pet_id;
  String birth;
  int weight;
  String name;
  String type;

  PetInfoModel(
      {required this.pet_id,
      this.birth = "",
      this.weight = 0,
      this.name = "",
      this.type = ""})
      : super();

  PetInfoModel.fromJson(Map<String, dynamic> json)
      : pet_id = json['pet_id'],
        birth = json['birth'],
        weight = json['weight'],
        name = json['name'],
        type = json['type'];

  Map<String, dynamic> toJson() => {
        'pet_id': pet_id,
        'birth': birth,
        'weight': weight,
        'name': name,
        'type': type
      };
  bool isEmpty() {
    return pet_id == '-1';
  }
}
