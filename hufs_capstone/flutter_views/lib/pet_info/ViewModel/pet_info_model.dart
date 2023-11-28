class PetInfoModel {
  int pet_id;
  String name;
  int weight;
  String birth;
  String type;

  PetInfoModel(
      {required this.pet_id,
      this.name = "",
      this.weight = 0,
      this.birth = "",
      this.type = ""})
      : super();

  PetInfoModel.fromJson(Map<String, dynamic> json)
      : pet_id = json['pet_id'],
        name = json['name'],
        weight = json['weight'],
        birth = json['birth'],
        type = json['type'];

  Map<String, dynamic> toJson() {
    return {'name': name, 'weight': weight, 'birth': birth, 'type': type};
  }

  bool isEmpty() {
    return pet_id == '-1';
  }
}
