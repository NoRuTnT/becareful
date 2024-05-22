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
        "apiKey": "{서울시 빅데이터 api키}",
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
        "firebase.config": "{\"type\":\"service_account\",\"project_id\":\"becarefulcrosswalk\",\"private_key_id\":\"{private_key_id}\",\"private_key\":\"-----BEGIN PRIVATE KEY-----\\{private_key}\\n-----END PRIVATE KEY-----\\n\",\"client_email\":\"firebase-adminsdk-nsizp@becarefulcrosswalk.iam.gserviceaccount.com\",\"client_id\":\"114320216553449047438\",\"auth_uri\":\"https://accounts.google.com/o/oauth2/auth\",\"token_uri\":\"https://oauth2.googleapis.com/token\",\"auth_provider_x509_cert_url\":\"https://www.googleapis.com/oauth2/v1/certs\",\"client_x509_cert_url\":\"https://www.googleapis.com/robot/v1/metadata/x509/firebase-adminsdk-nsizp%40becarefulcrosswalk.iam.gserviceaccount.com\",\"universe_domain\":\"googleapis.com\"}"
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
