import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hufs_capstone/pet_info/ViewModel/controller.dart';
import 'package:hufs_capstone/pet_info/ViewModel/pet_info_model.dart';
import 'package:hufs_capstone/pet_status/View/pet_status_view.dart';

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
        title: Text("반려견 정보를 입력해주세요"),
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
                        Flexible(
                          child: Padding(
                            padding: const EdgeInsets.only(right: 12),
                            child: SizedBox(
                              child: Text('이름'),
                            ),
                          ),
                          flex: 1,
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
                        Flexible(
                          child: Padding(
                            padding: const EdgeInsets.only(right: 12),
                            child: SizedBox(
                              child: Text('몸무게'),
                            ),
                          ),
                          flex: 1,
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
                        Flexible(
                          child: Padding(
                            padding: const EdgeInsets.only(right: 12),
                            child: SizedBox(
                              child: Text('나이'),
                            ),
                          ),
                          flex: 1,
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
                        Flexible(
                          child: Padding(
                            padding: const EdgeInsets.only(right: 12),
                            child: SizedBox(
                              child: Text('견종'),
                            ),
                          ),
                          flex: 1,
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
                    await PetInfoController.to.createPetInfo(PetInfoModel(
                        pet_id: 1,
                        birth: age.text,
                        weight: int.parse(weight.text),
                        name: name.text,
                        type: type.text));
                    Get.to(() => PetStatus(
                          petInfos: PetInfoController.to.petInfo,
                        ));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(12)),
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
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
