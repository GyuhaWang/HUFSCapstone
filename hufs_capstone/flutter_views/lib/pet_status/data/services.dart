import 'package:http/http.dart' as http;
import 'package:flutter_views/pet_status/ViewModel/pet_status_model.dart';

class PetInfoService {
  // static Future<String> getPetStatus() async {

  // }

  static Future<String> uploadFile(PetStatusModel petStatusModel) async {
    // http 통신

    try {
      var request = http.MultipartRequest(
          'POST', Uri.parse('http://localhost:8000/api/upload'));
      request.files.add(
          await http.MultipartFile.fromPath('file', petStatusModel.file.path));

      var response = await request.send();
      if (response.statusCode == 200) {
        print('File uploaded');
        return "success";
      } else {
        print('File upload failed with status code: ${response.statusCode}');
        return 'fail';
      }
    } catch (e) {
      print('File upload error: $e');
      return 'fail';
    }
  }
}
