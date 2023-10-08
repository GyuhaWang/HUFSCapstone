# HUFSCapstone

## 사용법

1. 'conda create --name hufs_cap python=3.9 -y'를 통해 새로운 conda 환경을 생성합니다.

2. 'pip install -r requirements.txt' 를 통해 test.py를 실행시키기 위한 패키지를 설치합니다.

3. 'test0.npy', 'test1.npy', 'test2.npy'는 각각 군집 0, 1, 2로 된 120개 길이의 시계열 데이터 하나입니다.

4. 'python test.py test0.npy'를 통해 test.py에게 test0.npy을 인자로 전달해 추론을 할 수 있습니다. 이 결과는 0으로 나옵니다.