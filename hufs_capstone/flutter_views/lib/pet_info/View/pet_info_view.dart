import 'package:flutter/material.dart';
<<<<<<<< HEAD:hufs_capstone/flutter_views/lib/pages/pet_info_input_page.dart
import 'package:http/http.dart' as http;
import 'dart:convert';
========
import 'package:get/get.dart';
import 'package:hufs_capstone/pet_info/ViewModel/controller.dart';
import 'package:hufs_capstone/pet_info/ViewModel/pet_info_model.dart';
import 'package:hufs_capstone/pet_status/View/pet_status_view.dart';
>>>>>>>> 8b395e2609e68aacaac81a534974a9d119a91c3b:hufs_capstone/lib/pet_info/View/pet_info_view.dart

class PetInfoInputPage extends StatefulWidget {
  const PetInfoInputPage({super.key});

  @override
  State<PetInfoInputPage> createState() => _PetInfoInputPageState();
}

class _PetInfoInputPageState extends State<PetInfoInputPage> {
  @override
  void initState() {
    Get.put(PetInfoController());
    super.initState();
  }

  TextEditingController age = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController weight = TextEditingController();

  TextEditingController type = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("반려견 정보를 입력해주세요"),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Form(
                    child: Column(
                  children: [
                    Row(
                      children: [
                        const Flexible(
                          flex: 1,
                          child: Padding(
                            padding: EdgeInsets.only(right: 12),
                            child: SizedBox(
                              child: Text('이름'),
                            ),
                          ),
                        ),
                        Flexible(
                            flex: 1,
                            child: Container(
                              child: TextField(
                                controller: name,
                                keyboardType: TextInputType.text,
                              ),
                            ))
                      ],
                    ),
                    Row(
                      children: [
                        const Flexible(
                          flex: 1,
                          child: Padding(
                            padding: EdgeInsets.only(right: 12),
                            child: SizedBox(
                              child: Text('몸무게'),
                            ),
                          ),
                        ),
                        Flexible(
                            flex: 1,
                            child: Container(
                              child: TextField(
                                controller: weight,
                                keyboardType: TextInputType.number,
                              ),
                            ))
                      ],
                    ),
                    Row(
                      children: [
                        const Flexible(
                          flex: 1,
                          child: Padding(
                            padding: EdgeInsets.only(right: 12),
                            child: SizedBox(
                              child: Text('나이'),
                            ),
                          ),
                        ),
                        Flexible(
                            flex: 1,
                            child: Container(
                              child: TextField(
                                controller: age,
                                keyboardType: TextInputType.number,
                              ),
                            ))
                      ],
                    ),
                    Row(
                      children: [
                        const Flexible(
                          flex: 1,
                          child: Padding(
                            padding: EdgeInsets.only(right: 12),
                            child: SizedBox(
                              child: Text('견종'),
                            ),
                          ),
                        ),
                        Flexible(
                            flex: 1,
                            child: Container(
                              child: TextField(
                                controller: type,
                                keyboardType: TextInputType.text,
                              ),
                            ))
                      ],
                    ),
                  ],
                )),
                GestureDetector(
                  onTap: () async {
<<<<<<<< HEAD:hufs_capstone/flutter_views/lib/pages/pet_info_input_page.dart
                    // Create a Map with the pet info data
                    Map<String, String> petInfoData = {
                      "name": name.text,
                      "weight": weight.text,
                      "birth": birth.text,
                      "type": type.text,
                    };

                    // POST request
                    final response = await http.post(
                      Uri.parse(
                          'http://localhost:8000/api/pet'), // server URL로 차후에 바꿀것
                      body: jsonEncode(petInfoData),
                      headers: {'Content-Type': 'application/json'},
                    );

                    if (response.statusCode == 201) {
                      // 저장 성공시 반응
                    } else {
                      // 에러 처리
                    }
========
                    await PetInfoController.to.createPetInfo(PetInfoModel(
                        pet_id: 1,
                        birth: age.text,
                        weight: int.parse(weight.text),
                        name: name.text,
                        type: type.text));
                    Get.to(() => PetStatus(
                          petInfos: PetInfoController.to.petInfo,
                        ));
>>>>>>>> 8b395e2609e68aacaac81a534974a9d119a91c3b:hufs_capstone/lib/pet_info/View/pet_info_view.dart
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(12)),
                    width: double.infinity,
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Center(
                        child: Text(
                          "입력 완료",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                )
              ]),
        ),
      ),
    );
  }
}
