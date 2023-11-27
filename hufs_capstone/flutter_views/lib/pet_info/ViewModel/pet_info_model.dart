class PetInfoModel {
  int pet_id;
  String name;
  int weight;
  String birth;
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

  Map<String, dynamic> toJson() {
    return {'birth': birth, 'weight': weight, 'name': name, 'type': type};
  }

  bool isEmpty() {
    return pet_id == '-1';
  }
}
