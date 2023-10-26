import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainPage extends StatelessWidget {
  MainPage({super.key});
  double pageHorizontalPadding = 20;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("HUFS CAPSTONE")),
      body: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: pageHorizontalPadding),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
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
                            Text(
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
                    child: petInfo(),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 24),
                    child: status(),
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

  Widget petInfo() {
    return Container(
        width: double.infinity,
        decoration: BoxDecoration(
            color: Color.fromRGBO(174, 222, 252, 0.5),
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
                        '코코',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '몸무게 : 20kg',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '생일 : 2020/08/19',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '견종 : 푸들',
                        style: TextStyle(
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

  Widget status() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          color: Color.fromRGBO(255, 223, 223, 0.5),
          borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'x,y,z 축 입력하기',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Form(
                  child: Column(
                children: [
                  Row(
                    children: [
                      Flexible(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 12),
                          child: SizedBox(
                            child: Text('X'),
                          ),
                        ),
                        flex: 1,
                      ),
                      Flexible(
                          flex: 1,
                          child: Container(
                            child: TextField(
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
                            child: Text('Y'),
                          ),
                        ),
                        flex: 1,
                      ),
                      Flexible(
                          flex: 1,
                          child: Container(
                            child: TextField(
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
                            child: Text('Z'),
                          ),
                        ),
                        flex: 1,
                      ),
                      Flexible(
                          flex: 1,
                          child: Container(
                            child: TextField(
                              keyboardType: TextInputType.number,
                            ),
                          ))
                    ],
                  ),
                ],
              )),
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
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
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
