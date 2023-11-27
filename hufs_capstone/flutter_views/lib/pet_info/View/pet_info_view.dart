import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_views/pet_info/ViewModel/controller.dart';
import 'package:flutter_views/pet_info/ViewModel/pet_info_model.dart';
import 'package:flutter_views/pet_status/View/pet_status_view.dart';

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
                    await PetInfoController.to.uploadPetInfo(PetInfoModel(
                        pet_id: 1,
                        name: name.text,
                        birth: age.text,
                        weight: int.parse(weight.text),
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
