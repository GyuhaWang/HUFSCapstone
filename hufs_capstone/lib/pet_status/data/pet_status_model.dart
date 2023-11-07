class PetStatusModel {
  final int userId;
  final int age;
  final int weight;
  final String name;
  final String type;

  const PetStatusModel(
      {required this.userId,
      this.age = 0,
      this.weight = 0,
      this.name = "",
      this.type = ""})
      : super();

  PetStatusModel.fromJson(Map<String, dynamic> json)
      : userId = json['UserId'],
        age = json['age'],
        weight = json['weight'],
        name = json['name'],
        type = json['type'];

  Map<String, dynamic> toJson() => {
        'UserId': userId,
        'age': age,
        'weight': weight,
        'name': name,
        'type': type
      };
  bool isEmpty() {
    return userId == '-1';
  }
}
