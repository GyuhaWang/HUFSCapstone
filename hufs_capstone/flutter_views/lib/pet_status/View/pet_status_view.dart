import 'dart:convert';
import 'dart:io';

import 'package:csv/csv.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter_views/pet_info/ViewModel/pet_info_model.dart';
import 'package:flutter_views/pet_status/ViewModel/pet_status_model.dart';

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

  Widget ImageWidget(String assetUrl) {
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
              Text(
                '선택된 데이터 번호: ${selected_csv_index + 1}',
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Column(
                children: [
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
                  // await Get.dialog(Container(
                  //   width: 300,
                  //   height: 300,
                  //   child: Center(
                  //     child: Text("입력 완료"),
                  //   ),
                  // ));
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
