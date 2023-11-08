<<<<<<<< HEAD:hufs_capstone/flutter_views/lib/main.dart
import 'package:flutter/material.dart';
import 'package:flutter_views/pages/pet_info_input_page.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
========
import 'dart:convert';
import 'dart:io';
>>>>>>>> 8b395e2609e68aacaac81a534974a9d119a91c3b:hufs_capstone/lib/pet_status/View/pet_status_view.dart

import 'package:csv/csv.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hufs_capstone/pet_info/ViewModel/pet_info_model.dart';
import 'package:hufs_capstone/pet_status/ViewModel/pet_status_model.dart';

class PetStatus extends StatelessWidget {
  PetInfoModel petInfos;
  PetStatus({super.key, required this.petInfos});
  double pageHorizontalPadding = 20;
  List<File> csv_data = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("HUFS CAPSTONE")),
      body: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: pageHorizontalPadding),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "코코의 현재 활동 상태는",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 24),
                        ),
                        Row(
                          children: [
                            Text(
                              "12km/h",
                              style: TextStyle(
                                  color: Colors.red[400],
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24),
                            ),
                            const Text(
                              "로 달리고 있어요",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 24),
                    child: petInfo(data: petInfos),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 24),
                    child: SelectSampleData(),
                  )
                ],
              ),
            ),
          )),
    );
  }

  Widget imageWidget(String assetUrl) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              color: Colors.grey,
              blurRadius: 5.0,
              offset: Offset(5.0, 5.0),
              spreadRadius: 5.0)
        ],
      ),
      child: AspectRatio(
        aspectRatio: 100 / 101,
        child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              assetUrl,
              fit: BoxFit.fill,
              width: double.infinity,
            )),
      ),
    );
  }

  Widget petInfo({required PetInfoModel data}) {
    return Container(
        width: double.infinity,
        decoration: BoxDecoration(
            color: const Color.fromRGBO(174, 222, 252, 0.5),
            borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(999),
                child: Container(
                  width: 50,
                  height: 50,
                  color: Colors.white,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12),
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data.name,
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '몸무게 : ${data.weight}',
                        style: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '생일 : ${data.birth}',
                        style: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '견종 : ${data.type}',
                        style: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}

class SelectSampleData extends StatefulWidget {
  const SelectSampleData({super.key});

  @override
  State<SelectSampleData> createState() => _SelectSampleDataState();
}

class _SelectSampleDataState extends State<SelectSampleData> {
  List<File> csv_data = [];
  int selected_csv_index = 0;
  @override
  void initState() {
    // TODO: implement initState
    for (int i = 1; i < 11; i++) {
      csv_data.add(File('assets/csv/sample_data_$i.csv'));
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return status(fileList: csv_data);
  }

  Widget statusRow(
      {required PetStatusModel data,
      required bool isChecked,
      required Function onClick}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Checkbox(
            value: isChecked,
            onChanged: (bool) {
              onClick();
            }),
        Text(data.file.path),
        GestureDetector(
          onTap: () async {
            String csv = await loadingCsvData(data.file.path);
            Get.dialog(Container(
                width: double.infinity,
                color: Colors.black,
                height: 400,
                child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Text(
                      csv,
                      style: const TextStyle(fontSize: 12, color: Colors.white),
                    ))));
          },
          child: const Text(
            '자세히 보기',
            style: TextStyle(fontSize: 12),
          ),
        )
      ],
    );
  }

  Widget status({required List<File> fileList}) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          color: const Color.fromRGBO(255, 223, 223, 0.5),
          borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
<<<<<<<< HEAD:hufs_capstone/flutter_views/lib/main.dart
              const Text(
                'x,y,z 축 입력하기',
========
              Text(
                '선택된 데이터 번호: ${selected_csv_index + 1}',
>>>>>>>> 8b395e2609e68aacaac81a534974a9d119a91c3b:hufs_capstone/lib/pet_status/View/pet_status_view.dart
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Column(
                children: [
<<<<<<<< HEAD:hufs_capstone/flutter_views/lib/main.dart
                  Row(
                    children: [
                      const Flexible(
                        flex: 1,
                        child: Padding(
                          padding: EdgeInsets.only(right: 12),
                          child: SizedBox(
                            child: Text('X'),
                          ),
                        ),
                      ),
                      Flexible(
                          flex: 1,
                          child: Container(
                            child: const TextField(
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
                            child: Text('Y'),
                          ),
                        ),
                      ),
                      Flexible(
                          flex: 1,
                          child: Container(
                            child: const TextField(
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
                            child: Text('Z'),
                          ),
                        ),
                      ),
                      Flexible(
                          flex: 1,
                          child: Container(
                            child: const TextField(
                              keyboardType: TextInputType.number,
                            ),
                          ))
                    ],
                  ),
========
                  for (int i = 0; i < fileList.length; i++)
                    statusRow(
                      data: PetStatusModel(file: fileList[i]),
                      isChecked: i == selected_csv_index,
                      onClick: () {
                        setState(() {
                          selected_csv_index = i;
                        });
                      },
                    )
>>>>>>>> 8b395e2609e68aacaac81a534974a9d119a91c3b:hufs_capstone/lib/pet_status/View/pet_status_view.dart
                ],
              ),
              // Form(
              //     child: Column(
              //   children: [
              //     Row(
              //       children: [
              //         Flexible(
              //           child: Padding(
              //             padding: const EdgeInsets.only(right: 12),
              //             child: SizedBox(
              //               child: Text('X'),
              //             ),
              //           ),
              //           flex: 1,
              //         ),
              //         Flexible(
              //             flex: 1,
              //             child: Container(
              //               child: TextField(
              //                 keyboardType: TextInputType.number,
              //               ),
              //             ))
              //       ],
              //     ),
              //     Row(
              //       children: [
              //         Flexible(
              //           child: Padding(
              //             padding: const EdgeInsets.only(right: 12),
              //             child: SizedBox(
              //               child: Text('Y'),
              //             ),
              //           ),
              //           flex: 1,
              //         ),
              //         Flexible(
              //             flex: 1,
              //             child: Container(
              //               child: TextField(
              //                 keyboardType: TextInputType.number,
              //               ),
              //             ))
              //       ],
              //     ),
              //     Row(
              //       children: [
              //         Flexible(
              //           child: Padding(
              //             padding: const EdgeInsets.only(right: 12),
              //             child: SizedBox(
              //               child: Text('Z'),
              //             ),
              //           ),
              //           flex: 1,
              //         ),
              //         Flexible(
              //             flex: 1,
              //             child: Container(
              //               child: TextField(
              //                 keyboardType: TextInputType.number,
              //               ),
              //             ))
              //       ],
              //     ),
              //   ],
              // )
              // ),
              GestureDetector(
                onTap: () async {
                  // Create a Map with the CSV data
                  Map<String, dynamic> accelerationData = {
                    // "x": xValue, // Replace with your data
                    // "y": yValue, // Replace with your data
                    // "z": zValue, // Replace with your data
                    // "create_date": createDate, // Replace with your data
                    // "device_id": deviceId, // Replace with your data
                    // "pet_id": petId, // Replace with your data
                    // "user_id": userId, // Replace with your data
                  };

                  // POST request
                  final response = await http.post(
                    Uri.parse(
                        'http://localhost:8000/api/upload'), // server URL로 차후에 바꿀 것
                    body: jsonEncode(accelerationData),
                    headers: {'Content-Type': 'application/json'},
                  );

                  if (response.statusCode == 201) {
                    // 저장 성공 시 반응
                  } else {
                    // 에러 처리
                  }
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
                        "데이터 전송하기",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

Future<String> loadingCsvData(String path) async {
  final csvFile = await rootBundle.loadString(path);

  // return await csvFile
  //     .transform(utf8.decoder)
  //     .transform(
  //       CsvToListConverter(),
  //     )
  //     .toList();
  return csvFile;
}
