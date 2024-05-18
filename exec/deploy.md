# local 포팅 매뉴얼

## docker & docker-compose 설치
- GUI가 있는 환경에서는 docker desktop 설치

<Details>
<summary>서버에서 docker CLI 설치</summary>

### 1. 시스템 업데이트
```shell
sudo apt update
```

### 2. 필요한 의존성 패키지 설치
```shell
sudo apt install -y apt-transport-https ca-certificates curl software-properties-common
```

### 3. Docker 공식 GPG 키 추가:
```shell
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
```

### 4. Docker repository 추가:
```shell
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
```

### 5. Docker 설치:
```shell
sudo apt update
sudo apt install docker-ce
```

### 6. Docker 서비스 시작:
```shell
sudo systemctl start docker
```

### 7. 부팅 시 자동 시작 설정:
```shell
sudo systemctl enable docker
```

### 8. Docker 그룹에 현재 사용자 추가 (sudo 권한 없이 Docker 명령을 사용하기 위함, 로그아웃 후 다시 로그인):
```shell
sudo usermod -aG docker $USER
```
- 사용자를 Docker 그룹에 추가한 후에는 로그아웃하고 다시 로그인해야 변경 사항이 적용

### 9. Docker 설치 확인:
```shell
docker --version
```
- Docker가 정상적으로 설치되었다면 버전을 확인할 수 있다.

</Details>

<Details>
<summary>서버에서 docker-compose 설치</summary>

```shell
sudo curl -L "https://github.com/docker/compose/releases/download/1.27.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
```
- curl 명령어를 통해 docker-compose를 설치합니다.

```shell
sudo chmod +x /usr/local/bin/docker-compose
```
- 다운로드한 도커 컴포즈 파일을 실행 가능하도록 다운로드한 경로에 권한을 부여합니다.

```shell
  sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
```
- 심볼릭 링크 설정으로 path 경로를 아래와 같이 설정해줍니다.

```shell
docker-compose -v
```
- 정상적으로 설치되었는지 확인합니다.

</Details>


## 로컬에서 실행해 보기
### 이동
```shell
cd /S10P31A207/data/
```

### connector shadow jar빌드
```shell
chmod +x ./gradlew
./gradlew clean :source:shadowJar :sink:shadowJar --rerun-tasks --info
ls -la source/build/libs/
ls -la sink/build/libs/
mkdir -p ./plugins
cp source/build/libs/source-0.0.1-SNAPSHOT.jar ./plugins/
cp sink/build/libs/sink-0.0.1-SNAPSHOT.jar ./plugins/
```

### docker image빌드
```shell
chmod +x ./gradlew
./gradlew clean :source:shadowJar :sink:shadowJar --rerun-tasks --info
ls -la source/build/libs/
ls -la sink/build/libs/
mkdir -p ./plugins
cp source/build/libs/source-0.0.1-SNAPSHOT.jar ./plugins/
cp sink/build/libs/sink-0.0.1-SNAPSHOT.jar ./plugins/
```


### 이동
```shell
cd /S10P31A207/exec/docker/
```
- 프로젝트의 `exec/docker` 폴더로 이동

### docker-compose-kafka 실행
```shell
docker-compose -f docker-compose-kafka.yml up -d
```
- docker-compose-kafka 실행
- docker ps -a 로 kafka-init-topic컨테이너가 exit된것을 확인하고 다음진행
### docker-compose 실행
```shell
docker-compose up
```
- docker-compose 실행

### data 넣기
```shell
sudo docker cp ./S10P22A707/exec/docker/tfeo-back/tfeo_data.sql tfeo-mysql:/
sudo docker exec -it mysql bash
mysql -u root -p tfeo < tfeo_data.sql
```
- password를 `tfeo123`으로 입력 하고, `exit`

### kafka connector 등록
```shell
curl -X POST -H "Content-Type: application/json" --data '{
    "name": "source",
    "config": {
        "connector.class": "com.sourceconnector.TrafficLightSourceConnector",
        "tasks.max": "1",
        "key.converter": "org.apache.kafka.connect.storage.StringConverter",
        "value.converter": "org.apache.kafka.connect.json.JsonConverter",
        "value.converter.schemas.enable": "false",
        "topics": "trafficlight-data",
        "poll.interval.ms": 1000,
        "intersection.id": 2217,
        "apiKey": "bd30bf3b-df36-4c38-9e4e-8dd8b5e94ddc",
        "errors.log.enable": "true",
        "errors.log.include.messages": "true",
        "max.poll.records": 1,
        "queue.buffering.max.messages": 10,
        "queue.buffering.max.kbytes": 1
    }
}' http://localhost:8083/connectors
```
- source connector 등록

```shell
curl -X POST -H "Content-Type: application/json" --data '{
    "name": "sink",
    "config": {
        "connector.class": "com.sinkconnector.TrafficLightSinkConnector",
        "tasks.max": "1",
        "key.converter": "org.apache.kafka.connect.storage.StringConverter",
        "value.converter": "org.apache.kafka.connect.json.JsonConverter",
        "key.converter.schemas.enable": "false",
        "value.converter.schemas.enable": "false",
        "errors.log.enable": "true",
        "errors.log.include.messages": "true",
        "topics": "trafficlight-data",
        "firebase.url": "https://becarefulcrosswalk-default-rtdb.firebaseio.com",
        "firebase.config": "{\"type\":\"service_account\",\"project_id\":\"becarefulcrosswalk\",\"private_key_id\":\"d9d7f52d68a2b57459d8f562bbfa785cbc7d1a38\",\"private_key\":\"-----BEGIN PRIVATE KEY-----\\nMIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQDFC6V4o3jT9NI9\\n0aTYyEHNCMTqdujKQ4Aebo0xtc/w5lMsgjar635vT/wDoibBbKp2pMk4B2fPrwGy\\nW3bRakP22TStqqEGVQbpR/ezC7VjmPV0pR/fNf1xa6l84BMHSf0wdd/G2iGJ/ABD\\nSSJcbC5AFxskNEWN8JApB7r0uFMca9VW/vuIyrBlJHQ0nR5+ZCAmX7EA6v+zZn57\\n3/x1Ta/NHIxf9v1+hXkkVtmHpGkokxiKBKxv0UfZc1TdHJ/mmv+25EuVml2kyQFF\\nQh8ouemzwO1POvXln4rBlQz858ZhPXP0vYOtYwwgHhOn7Olcfc8TieUnHJzcvopu\\nu6oIPZJtAgMBAAECggEACXFtMOqepgO/1pwXKxdvxdhzfWwM7HKPL4YrSJRWvov/\\nNO0ZmyQaR1HdOTxaYJ8pTS3JAeEi+bpAmdBV0aPm1Wvj4SXB+Uh2YBQlnARF4VvJ\\neZlXPW58MqUO9o/TgaArXNjtTD2UaWU1CwR0e9roXYRt9c52fd6nPfwjmspBm2U+\\n9MPe7Ph+sGYia6dQhKKw4fttwVu2kpHV3gFJLanhGcpqspei9MEyOwC3K6Hqcq7r\\nIq/Zn3eRkWe3gfoUvaWfYL2kxA1xoO4+WLWMD1TN+fQ4EZqUikVNmyEsfGrLdSiC\\nYR0pOeDTZ9F8PTJYCx4Jf7c2RvhKgQ7Fm/7J9hgeYQKBgQD051l7287ykG1KN5K3\\nAkb+39i7vURVo5ONk/31fonQgjuWMnk51QfAgOzi/APHTvZlzxivtviQpC16CGSP\\ndozvgHVDnM8/XDL+x14l3FsTZOGgOsUMDxgdzh/B7AAVg48IoeeFsk6tTGtjIf6u\\nu5+/3GK/FhtRfYwB0FIQg9KtYQKBgQDN+S/di+Wo7rX/MWlZNFPxhHLjL8PuhuAr\\nye+qQFfE/e7CDUSU57DJt/qgtU/46gbWgQ0tS8rBHRUJtAwFdMXyMAiS08AzoPkF\\nU/urywGLkD9BhSKJxWzDAoO7Nxwm+gIqt64LlvD46IhSCgej68nGSOzUVrCaOVWR\\nqjggi/iUjQKBgFuz9VHnsMorQoEz5gAZHjR55VIHQPtAURQGgmXWiAxHd8B6DeKV\\n3l066XjlHRUYgDMHJRtGzDR9BXpYgi8mGQfldgNnSENVZtL4HEzZAlF0yPeSig5F\\n6KXgdQvMLwvfQ0PcPDFX3xYNM3jfVdpf7yWMhH1A7eHJvQ9AzjnY4p6BAoGBAMZ1\\ndQM4il5NMxrh1ynWW5N4FOKF4Xlwh4pplf0q5eau7WAYPJ5k51hVZq12RcoGY/RG\\ngBXG02NizCR/UJ3pN9j1Iy2lzalxTr8tfm62uZRptilBSFgK25LCV38JyJxdg7z5\\nIj+Ufja2hrLVayssQ0xEc7zckmjnGWWy50Wk2Cz5AoGBAOq6CJgcmAGTsZI4odb4\\ntdWoYLKcR6coZlKP203ztO+bSekTt7JPv87llbniD2KQX0GYzulnPdwkEA0+rnYa\\nVAyGyqFLXoeNJrdRqaCd2G2pOvjEP1Zdto5UsdLmxd4s4Z3SDLfAN9KraWUZtCE7\\nt/vvOV9LCJfZeojb4DbaHyMY\\n-----END PRIVATE KEY-----\\n\",\"client_email\":\"firebase-adminsdk-nsizp@becarefulcrosswalk.iam.gserviceaccount.com\",\"client_id\":\"114320216553449047438\",\"auth_uri\":\"https://accounts.google.com/o/oauth2/auth\",\"token_uri\":\"https://oauth2.googleapis.com/token\",\"auth_provider_x509_cert_url\":\"https://www.googleapis.com/oauth2/v1/certs\",\"client_x509_cert_url\":\"https://www.googleapis.com/robot/v1/metadata/x509/firebase-adminsdk-nsizp%40becarefulcrosswalk.iam.gserviceaccount.com\",\"universe_domain\":\"googleapis.com\"}"
    }
}' http://localhost:8083/connectors
```
- sink connector 등록


### apk 실행
- 경로의 apk로 어플리케이션설치 후 실행


## 실행 시 주의 할 점
1. docker를 반드시 설치해주세요.
2. 처음 실행 시 docker-image를 다운로드 하고, docker안에서 빌드가 이루어 지기 때문에 5 ~ 10분이 소요될 수 있습니다.
3.  사용하고 있는 포트 충돌으로 실행 되지 않을 수 있습니다. 아래 포트들 중 사용중인 포트를 확인해 주세요.
    - `80`, `443`,`3306`,`8080`,`8081`,`8082`, `8083`,`8085`,`9092`,`9093`,`9997`,`9998`,`18085`,`29092`,`29093`
4. 서울시api의 요청횟수제한으로인해 1000초간 데이터파이프라인이 작동합니다. 오래사용하려면 source connector의 poll.interval.ms 수치를 높여 테스트할 수 있습니다.