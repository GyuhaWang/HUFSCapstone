class PetInfoModel {
  int pet_id;
  String name;
  String birth;
  int weight;
  String type;

  PetInfoModel(
      {required this.pet_id,
      this.name = "",
      this.birth = "",
      this.weight = 0,
      this.type = ""})
      : super();

  PetInfoModel.fromJson(Map<String, dynamic> json)
      : pet_id = json['pet_id'],
        name = json['name'],
        birth = json['birth'],
        weight = json['weight'],
        type = json['type'];

  Map<String, dynamic> toJson() {
    return {'name': name, 'birth': birth, 'weight': weight, 'type': type};
  }

  bool isEmpty() {
    return pet_id == '-1';
  }
}
