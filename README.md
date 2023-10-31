# HUFSCapstone

- 카라멜소프트와 협력하여 반려견의 행동을 분석하고 시각화 하는 프로젝트<br/><br/>

# Folder 구조

- 📁 tf_model

  - 머신러닝 모델 .py 파일이 위치한 폴더
  - .csv 파일 포함
    
<br/>

- 📁 server
  
  - Node.js와 모듈이 위치한 폴더
  - entry로 app.js를 사용
  - 설치된 모듈
    : express, mysql, path, cors, body-parser, nodemon  <br/>
  
  ⚙️ MVC 설계패턴 사용
  - model, controller, rotes는 동 폴더 내에 위치
  - view는 Flutter를 통해 개발하므로, 하기한 flutter_views폴더가 view이다.<br/>

  ##### MVC 패턴 흐름도
    ![mvc_pattern](https://github.com/GyuhaWang/HUFSCapstone/assets/112686847/8cad197e-8808-4824-a480-be888b348dcc)

<br/>

- 📁 flutter_views

  - Flutter project가 위치한 폴더
  - lib/ 안에 view 역할을 하는 .dart 파일들이 위치한다.
  - dependency는 pubspec.yaml에 기술되어 있다.

<br/><br/>

# 개발진행상황 Update [23.10.31]

- ERD

  ![스크린샷 2023-10-31 오후 3 30 08](https://github.com/GyuhaWang/HUFSCapstone/assets/112686847/50d571b7-f48e-4386-ba0d-bf2b656b3ab5)

- ⚙️ http://localhost:8000/api/pet

  - POST request
  - 'pet_info_input_page.dart'에서 입력받을 PetInfo를 DB에 저장할 때 호출

- ⚙️ http://localhost:8000/api/upload

  - POST request
  - 'main_page.dart'에서 .csv 파일을 DB에 저장할 때 호출

```
GestureDetector(
                onTap: () async {
                  // Create a Map with the CSV data
                  Map<String, dynamic> accelerationData = {
                    // datas
                  };

                  // POST request
                  final response = await http.post(
                    Uri.parse(
                        'http://localhost:8000/api/upload'), // server URL로 바꿀 것
                    body: jsonEncode(accelerationData),
                    headers: {'Content-Type': 'application/json'},
                  );

                  if (response.statusCode == 201) {
                    // 저장 성공 시 반응
                  } else {
                    // 에러 처리
                  }
```

- 현재 flutter와의 연동에 있어서 오류가 있기에 이를 해결중에 있다.
