import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_views/lib/main.dart';

class PetInfoInputPage extends StatefulWidget {
  const PetInfoInputPage({super.key});

  @override
  State<PetInfoInputPage> createState() => _PetInfoInputPageState();
}

class _PetInfoInputPageState extends State<PetInfoInputPage> {
  late PetInfo petInfo;
  TextEditingController name = TextEditingController();
  TextEditingController weight = TextEditingController();
  TextEditingController birth = TextEditingController();
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
                              child: Text('생일'),
                            ),
                          ),
                        ),
                        Flexible(
                            flex: 1,
                            child: Container(
                              child: TextField(
                                controller: birth,
                                keyboardType: TextInputType.datetime,
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
                    petInfo = editPetInfo(
                        name.text, weight.text, birth.text, type.text);
                    Get.to(() => MainPage(
                          petInfos: petInfo,
                        ));
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

PetInfo editPetInfo(String name, String weight, String birth, String type) {
  return PetInfo(name: name, birth: birth, weight: weight, type: type);
}

class PetInfo {
  String name;
  String weight;
  String birth;
  String type;
  PetInfo(
      {required this.name,
      required this.birth,
      required this.weight,
      required this.type});
}
