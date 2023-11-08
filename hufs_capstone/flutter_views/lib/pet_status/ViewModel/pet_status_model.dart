import 'dart:io';

class PetStatusModel {
  final File file;

  const PetStatusModel({
    required this.file,
  }) : super();

  Map<String, dynamic> toJson() => {
        'file': file,
      };
}
