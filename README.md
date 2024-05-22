# :clapper: 조심횡
![image](https://github.com/NoRuTnT/Dotori/assets/114069644/49d7dd5e-222f-4d20-8362-dabcb11223cc)


## 📚 목차
- [💬 서비스 소개](#intro)
- [🎯 기획 배경](#plans)
- [🙇 팀원 소개](#members)
- [🏠 프로젝트 진행](#project)
- [💡 주요 기능](#features)
- [🔑 기술 소개](#technology)
- [🔨 개발 환경](#skills)
- [🚀 포팅 메뉴얼](#installation)
- [📂 폴더 구조](#folder)

<a name="intro"></a>
## 💬 서비스 소개

**횡단보도 보행시 잔여 시간 알림과 같은 보조 기능들을 제공합니다.**

- 횡단보도 신호상태, 신호잔여시간 알림
- 횡단보도 보행시 횡단보도에서 벗어나지 않도록 진동을 통한 방향 보조 기능
- 진입한 횡단보도의 진행 방면을 알려주는 알림 기능
- 파손된 점자블록 신고 기능

<a name="plans"></a>
## 🎯 기획 배경
### 시각장애인들의 횡단보도 보행시 다양한 불편함

  ![image](https://github.com/NoRuTnT/Dotori/assets/114069644/2e23fc40-279e-4602-96af-69ebab1b2504)  

  - 도로는 건너는 중 현재 신호가 초록불인지 빨간불인지 알수가없다
  - 신호가 몇초 남았는지 알 수 없어 건너는도중 빨간불로 바뀌었을까봐 걱정된다.
  - 음향신호기가 고장나서 소리가 나지 않거나 소리가 너무 작아서 알아들을수없는 경우가 있다.

  ![image](https://github.com/NoRuTnT/Dotori/assets/114069644/49a6f785-8b09-44ab-bd4e-c634ec73645a)  

  - 음향신호기가 설치되지 않은 교차로가 존재한다
  - 음향신호기 위치까지 점자블록이 이어져 있지 않아서 음향신호기 버튼을 찾을수가없다.  

**위의 문제점들을 해결할 수 있는 시각장애인을 위한 안전보행서비스를 개발하게되었다.**  
(출처 : 원샷한솔OneshotHansol 유튜브 영상 캡쳐)

<a name="members"></a>
## 🙇 팀원 소개

|**최동헌 (팀장/BE)**|**문준형 (팀원/BE)**|**차다운 (팀원/BE)**|
|:---:|:---:|:---:|
|S3, 카프카 Sink Connector|인프라, 카프카 파이프라인|카프카 Sink Connector , Firebase|


|**이은지 (팀원/FE)**|**김지환 (팀원/FE)**|
|:---:|:---:|
|화면 페이지 구현, Firebase|화면 페이지 구현, Geofencing 구현|

<a name="project"></a>

## 💡 프로젝트 진행

### ✏ Notion

- 프로젝트 관련 학습 내용과 논의 내용을 notion 에 작성하여 문서 관리

### ✏ Jira

- 프로젝트 일정 관리
- 이슈 발행 및 담당자 지정
  - 매주 스프린트 시작 전 백로그에 이슈 등록
  - 소요 시간 별 스토리 포인트 지정
  - 하위 작업 등록을 통한 세부 일정 관리
- 스프린트 번다운 차트 활용

### ✏ Git

- 팀 Notion에 Git 행동 강령과 Commit convention 작성, 공유


- 작업 브랜치 전략
```
master - fe-develop  - feature/이슈번호/기능
       - be-develop                  
       - data-develop                  
```
### ✏ 요구사항 정의서

- 아이디어 기획 및 구체화 단계에서 요구사항 정의
- 우선순위 지정 후 기능 확정

### ✏ Wireframe

- Figma 활용 UI/UX 디자인 진행
- 기능 develop
![image](https://github.com/NoRuTnT/Dotori/assets/114069644/7d3c8cde-3b70-49bf-b7f3-8b12add3650e)


### ✏ System Architecture
![KakaoTalk_20240519_154835047](https://github.com/NoRuTnT/Dotori/assets/114069644/3d20700d-71ec-4cdf-8be4-af629ebcbad3)


<a name="features"></a>

## 💡 주요 기능

### 🖥️ 메인페이지
|  메인페이지 및 이용안내  |
|:---------:|
| ![메인페이지](/uploads/84b6b438c4002259881bae0b283a7b4f/메인페이지및이용안내.gif) |

### 🙋‍♀️ 보행 보조기능

|  실시간신호정보교차로진입  |
|:---------:|
| ![실시간신호정보교차로](/uploads/d0c5ea5ef1cd618bf40b5971c0714101/실시간신호정보교차로.gif) |

|  교차로 진입  |
|:---------:|
| ![신호등앞안내시작버튼](/uploads/f4c3efd66637852087764c91dcfe8635/신호등앞안내시작버튼.gif) |

|  잔여시간안내  |
|:---------:|
| ![잔여시간안내](/uploads/d4a50b89f244fd2af91a7f44110cd415/잔여시간안내.gif) |

|  보행방향보조  |
|:---------:|
| ![보행방향보조](/uploads/5bfe6c9eb1f538a6dd2e555c00b8031c/보행방향보조.gif) |


### 📑 신고 기능
|  파손된 보도블록 신고  |
|:---------:|
| ![보도블록신고기능](/uploads/65a0c9fab829ff7e9982620428666e86/보도블록신고기능.gif) |


<a name="technology"></a>
## 🔑 기술 소개



### 📉 Geofence
![image](https://github.com/NoRuTnT/Dotori/assets/114069644/45e53796-5ac9-480d-9278-2769bb06ca49)
- 실제 위치에 기반해 가상의 경계를 생성
- 기반 서비스와 센서 기술을 결합하여 실시간으로 특정 지역에서의 사건을 감지하고 대응

---

### 📊 kafka Connect
![image](https://github.com/NoRuTnT/Dotori/assets/114069644/102c4418-0330-4dc9-a812-a773a30f2b2f)

Kafka Connect는 데이터베이스, 키-값 저장소, 검색 인덱스 및 파일 시스템 간의 간단한 데이터 통합을 위한 중앙 집중식 데이터 허브 역할을 하는 Apache Kafka의 무료 오픈소스 구성요소로 해당 프로젝트에서는 api데이터소스에서 firebase로 데이터를 전달하기위한 파이프라인으로 사용하였다.  

- 실시간 교통데이터를 다루기때문에 높은 처리량과 내결함성을 고려하여 **kafka connect** 데이터 파이프라인을 이용하기로 했다.   

커넥트는 2가지 종류가 존재하는데 이를 아래와 같이 분류할 수 있다.  
소스 -> 카프카 : 소스 커넥터(Source Connector)  
카프카 -> 싱크 : 싱크 커넥터(Sink Connector)  


![image](https://github.com/NoRuTnT/Dotori/assets/114069644/c22a0e96-a5b0-4684-aa08-a5e246890c83)

- kafka 클러스터에서는 데이터소스에서 kafka 토픽으로 데이터를 전달하는 source connector와, kafka 토픽에서 firebase로 데이터를 전달하는 sink connector 두개의 커스텀 커넥터를 구현했다.

![동영상](https://github.com/NoRuTnT/Dotori/assets/114069644/24788a84-8bb4-4a18-9d7e-1d6eaa0ac0ed)

- realtime database에 데이터가 전달되는 모습


<a name="skills"></a>
## 🔨 개발 환경

|Teck stack ||version|
|------|---|---|
|Frontend|Flutter||
|Backend|SpringBoot |3.2.4|
|Data|SpringBoot |2.7.17|
||kafka |3.4.0|
||kafka-connect |3.4.0|
||shadowJar |8.1.1|
|Database|MySQL|8.0.32|
||RealtimeDatabase||
|Infra|Confluent kafka|7.2.1|
||Docker||
||Docker Hub||
||Nginx||
||AWS EC2||
||Prometheus||
||Promtail||
||Loki||
||Grafana||

<a name="installation"></a>
## 🚀 포팅 메뉴얼
[포팅 메뉴얼](https://lab.ssafy.com/s10-final/S10P31A207/-/blob/aaf44307db9b6e519f78350e60d70e315db3e4b0/exec/deploy.md)

<a name="folder"></a>
## 📂 폴더 구조
<details>
<summary>BackEnd 폴더 구조</summary>
<div markdown="1">

```
📦backend
 ┣ 📂gradle
 ┃ ┗ 📂wrapper
 ┃ ┃ ┣ 📜gradle-wrapper.jar
 ┃ ┃ ┗ 📜gradle-wrapper.properties
 ┣ 📂src
 ┃ ┣ 📂main
 ┃ ┃ ┣ 📂java
 ┃ ┃ ┃ ┗ 📂com
 ┃ ┃ ┃ ┃ ┗ 📂becareful
 ┃ ┃ ┃ ┃ ┃ ┗ 📂backend
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂common
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂config
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜S3Config.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂controller
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜FileController.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂exception
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜BadRequestException.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜BusinessException.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ForbiddenException.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜NotFoundException.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜UnauthorizedException.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂model
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂dto
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜SuccessResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📂entity
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜BaseTimeEntity.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📂service
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜S3UploaderService.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂domain
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂intersection
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂common
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜.gitkeep
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂controller
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜IntersectionController.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂model
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂dto
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜CoordinateDto.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜CrosswalkResponseDto.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜IntersectionResponseDto.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📂entity
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜crosswalk.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜Intersection.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂repository
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜CrosswalkRepository.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜IntersectionRepository.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📂service
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜IntersectionService.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📂report
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂common
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜.gitkeep
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂controller
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜ReportController.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂model
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂dto
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜ReportResponseDto.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📂entity
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜Report.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂repository
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜ReportRepository.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📂service
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜ReportService.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜BackendApplication.java
 ┃ ┃ ┗ 📂resources
 ┃ ┃ ┃ ┣ 📜application-db.yml
 ┃ ┃ ┃ ┣ 📜application-s3.yml
 ┃ ┃ ┃ ┣ 📜application-security.yml
 ┃ ┃ ┃ ┗ 📜application.yml
 ┃ ┗ 📂test
 ┃ ┃ ┣ 📂java
 ┃ ┃ ┃ ┗ 📂com
 ┃ ┃ ┃ ┃ ┗ 📂becareful
 ┃ ┃ ┃ ┃ ┃ ┗ 📂backend
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂report
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📂controller
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜ReportControllerTest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜BackendApplicationTests.java
 ┃ ┃ ┗ 📂resources
 ┃ ┃ ┃ ┗ 📜application.yml
 ┣ 📜.gitignore
 ┣ 📜build.gradle
 ┣ 📜Dockerfile
 ┣ 📜gradlew
 ┣ 📜gradlew.bat
 ┗ 📜settings.gradle
```
</div>
</details>

<details>
<summary>FrontEnd폴더 구조</summary>
<div markdown="1">

```
📦frontend
 ┣ 📂.idea
 ┃ ┣ 📜frontend.iml
 ┃ ┣ 📜misc.xml
 ┃ ┣ 📜modules.xml
 ┃ ┣ 📜vcs.xml
 ┃ ┗ 📜workspace.xml
 ┗ 📂becarefulcrosswalk
 ┃ ┣ 📂android
 ┃ ┃ ┣ 📂app
 ┃ ┃ ┃ ┣ 📂src
 ┃ ┃ ┃ ┃ ┣ 📂debug
 ┃ ┃ ┃ ┃ ┃ ┗ 📜AndroidManifest.xml
 ┃ ┃ ┃ ┃ ┣ 📂main
 ┃ ┃ ┃ ┃ ┃ ┣ 📂kotlin
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📂com
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📂a207
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📂becarefulcrosswalk
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜MainActivity.kt
 ┃ ┃ ┃ ┃ ┃ ┣ 📂res
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂drawable
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜launch_background.xml
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂drawable-v21
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜launch_background.xml
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂mipmap-hdpi
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ic_launcher.png
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜traffic_lights.png
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂mipmap-mdpi
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜ic_launcher.png
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂mipmap-xhdpi
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜ic_launcher.png
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂mipmap-xxhdpi
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜ic_launcher.png
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂mipmap-xxxhdpi
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜ic_launcher.png
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂values
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜styles.xml
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📂values-night
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜styles.xml
 ┃ ┃ ┃ ┃ ┃ ┗ 📜AndroidManifest.xml
 ┃ ┃ ┃ ┃ ┗ 📂profile
 ┃ ┃ ┃ ┃ ┃ ┗ 📜AndroidManifest.xml
 ┃ ┃ ┃ ┗ 📜build.gradle
 ┃ ┃ ┣ 📂gradle
 ┃ ┃ ┃ ┗ 📂wrapper
 ┃ ┃ ┃ ┃ ┗ 📜gradle-wrapper.properties
 ┃ ┃ ┣ 📜.gitignore
 ┃ ┃ ┣ 📜build.gradle
 ┃ ┃ ┣ 📜gradle.properties
 ┃ ┃ ┗ 📜settings.gradle
 ┃ ┣ 📂assets
 ┃ ┃ ┗ 📂sounds
 ┃ ┃ ┃ ┣ 📜cameraFlash.mp3
 ┃ ┃ ┃ ┗ 📜half-pass.mp3
 ┃ ┣ 📂images
 ┃ ┃ ┣ 📜checked.png
 ┃ ┃ ┣ 📜fail.png
 ┃ ┃ ┣ 📜information.png
 ┃ ┃ ┣ 📜lamplight.png
 ┃ ┃ ┣ 📜map.png
 ┃ ┃ ┣ 📜report.png
 ┃ ┃ ┗ 📜traffic-lights.png
 ┃ ┣ 📂ios
 ┃ ┃ ┣ 📂Flutter
 ┃ ┃ ┃ ┣ 📜AppFrameworkInfo.plist
 ┃ ┃ ┃ ┣ 📜Debug.xcconfig
 ┃ ┃ ┃ ┗ 📜Release.xcconfig
 ┃ ┃ ┣ 📂Runner
 ┃ ┃ ┃ ┣ 📂Assets.xcassets
 ┃ ┃ ┃ ┃ ┣ 📂AppIcon.appiconset
 ┃ ┃ ┃ ┃ ┃ ┣ 📜Contents.json
 ┃ ┃ ┃ ┃ ┃ ┣ 📜Icon-App-1024x1024@1x.png
 ┃ ┃ ┃ ┃ ┃ ┣ 📜Icon-App-20x20@1x.png
 ┃ ┃ ┃ ┃ ┃ ┣ 📜Icon-App-20x20@2x.png
 ┃ ┃ ┃ ┃ ┃ ┣ 📜Icon-App-20x20@3x.png
 ┃ ┃ ┃ ┃ ┃ ┣ 📜Icon-App-29x29@1x.png
 ┃ ┃ ┃ ┃ ┃ ┣ 📜Icon-App-29x29@2x.png
 ┃ ┃ ┃ ┃ ┃ ┣ 📜Icon-App-29x29@3x.png
 ┃ ┃ ┃ ┃ ┃ ┣ 📜Icon-App-40x40@1x.png
 ┃ ┃ ┃ ┃ ┃ ┣ 📜Icon-App-40x40@2x.png
 ┃ ┃ ┃ ┃ ┃ ┣ 📜Icon-App-40x40@3x.png
 ┃ ┃ ┃ ┃ ┃ ┣ 📜Icon-App-60x60@2x.png
 ┃ ┃ ┃ ┃ ┃ ┣ 📜Icon-App-60x60@3x.png
 ┃ ┃ ┃ ┃ ┃ ┣ 📜Icon-App-76x76@1x.png
 ┃ ┃ ┃ ┃ ┃ ┣ 📜Icon-App-76x76@2x.png
 ┃ ┃ ┃ ┃ ┃ ┗ 📜Icon-App-83.5x83.5@2x.png
 ┃ ┃ ┃ ┃ ┗ 📂LaunchImage.imageset
 ┃ ┃ ┃ ┃ ┃ ┣ 📜Contents.json
 ┃ ┃ ┃ ┃ ┃ ┣ 📜LaunchImage.png
 ┃ ┃ ┃ ┃ ┃ ┣ 📜LaunchImage@2x.png
 ┃ ┃ ┃ ┃ ┃ ┣ 📜LaunchImage@3x.png
 ┃ ┃ ┃ ┃ ┃ ┗ 📜README.md
 ┃ ┃ ┃ ┣ 📂Base.lproj
 ┃ ┃ ┃ ┃ ┣ 📜LaunchScreen.storyboard
 ┃ ┃ ┃ ┃ ┗ 📜Main.storyboard
 ┃ ┃ ┃ ┣ 📜AppDelegate.swift
 ┃ ┃ ┃ ┣ 📜Info.plist
 ┃ ┃ ┃ ┗ 📜Runner-Bridging-Header.h
 ┃ ┃ ┣ 📂Runner.xcodeproj
 ┃ ┃ ┃ ┣ 📂project.xcworkspace
 ┃ ┃ ┃ ┃ ┣ 📂xcshareddata
 ┃ ┃ ┃ ┃ ┃ ┣ 📜IDEWorkspaceChecks.plist
 ┃ ┃ ┃ ┃ ┃ ┗ 📜WorkspaceSettings.xcsettings
 ┃ ┃ ┃ ┃ ┗ 📜contents.xcworkspacedata
 ┃ ┃ ┃ ┣ 📂xcshareddata
 ┃ ┃ ┃ ┃ ┗ 📂xcschemes
 ┃ ┃ ┃ ┃ ┃ ┗ 📜Runner.xcscheme
 ┃ ┃ ┃ ┗ 📜project.pbxproj
 ┃ ┃ ┣ 📂Runner.xcworkspace
 ┃ ┃ ┃ ┣ 📂xcshareddata
 ┃ ┃ ┃ ┃ ┣ 📜IDEWorkspaceChecks.plist
 ┃ ┃ ┃ ┃ ┗ 📜WorkspaceSettings.xcsettings
 ┃ ┃ ┃ ┗ 📜contents.xcworkspacedata
 ┃ ┃ ┣ 📂RunnerTests
 ┃ ┃ ┃ ┗ 📜RunnerTests.swift
 ┃ ┃ ┗ 📜.gitignore
 ┃ ┣ 📂lib
 ┃ ┃ ┣ 📂env
 ┃ ┃ ┃ ┗ 📜env.dart
 ┃ ┃ ┣ 📂models
 ┃ ┃ ┃ ┣ 📜geofence_model.dart
 ┃ ┃ ┃ ┣ 📜intersection_model.dart
 ┃ ┃ ┃ ┗ 📜traffic_light_model.dart
 ┃ ┃ ┣ 📂provider
 ┃ ┃ ┃ ┣ 📜crosswalk_info.dart
 ┃ ┃ ┃ ┣ 📜current_page.dart
 ┃ ┃ ┃ ┣ 📜my_location_state.dart
 ┃ ┃ ┃ ┗ 📜report_data.dart
 ┃ ┃ ┣ 📂screens
 ┃ ┃ ┃ ┣ 📂report
 ┃ ┃ ┃ ┃ ┣ 📜report_fail_screen.dart
 ┃ ┃ ┃ ┃ ┣ 📜report_location_screen.dart
 ┃ ┃ ┃ ┃ ┣ 📜report_photo_screen.dart
 ┃ ┃ ┃ ┃ ┣ 📜report_stt_result_screen.dart
 ┃ ┃ ┃ ┃ ┣ 📜report_success_screen.dart
 ┃ ┃ ┃ ┃ ┗ 📜report_voice_screen.dart
 ┃ ┃ ┃ ┣ 📂userGuide
 ┃ ┃ ┃ ┃ ┣ 📜user_guide_screen.dart
 ┃ ┃ ┃ ┃ ┗ 📜user_guide_screen2.dart
 ┃ ┃ ┃ ┣ 📜landing_screen.dart
 ┃ ┃ ┃ ┣ 📜main_screen.dart
 ┃ ┃ ┃ ┗ 📜map_screen.dart
 ┃ ┃ ┣ 📂service
 ┃ ┃ ┃ ┣ 📜api_service.dart
 ┃ ┃ ┃ ┣ 📜my_direction.dart
 ┃ ┃ ┃ ┗ 📜my_location.dart
 ┃ ┃ ┣ 📂theme
 ┃ ┃ ┃ ┗ 📜colors.dart
 ┃ ┃ ┣ 📂utils
 ┃ ┃ ┃ ┣ 📜bottom_bar.dart
 ┃ ┃ ┃ ┗ 📜temp.dart
 ┃ ┃ ┣ 📂widgets
 ┃ ┃ ┃ ┣ 📜alert_dialog_widget.dart
 ┃ ┃ ┃ ┣ 📜button_widget.dart
 ┃ ┃ ┃ ┣ 📜guide_widget.dart
 ┃ ┃ ┃ ┣ 📜logo_widget.dart
 ┃ ┃ ┃ ┣ 📜modal_widget.dart
 ┃ ┃ ┃ ┣ 📜prompt_widget.dart
 ┃ ┃ ┃ ┗ 📜service_box_widget.dart
 ┃ ┃ ┣ 📜firebase_options.dart
 ┃ ┃ ┗ 📜main.dart
 ┃ ┣ 📂linux
 ┃ ┃ ┣ 📂flutter
 ┃ ┃ ┃ ┣ 📜CMakeLists.txt
 ┃ ┃ ┃ ┣ 📜generated_plugins.cmake
 ┃ ┃ ┃ ┣ 📜generated_plugin_registrant.cc
 ┃ ┃ ┃ ┗ 📜generated_plugin_registrant.h
 ┃ ┃ ┣ 📜.gitignore
 ┃ ┃ ┣ 📜CMakeLists.txt
 ┃ ┃ ┣ 📜main.cc
 ┃ ┃ ┣ 📜my_application.cc
 ┃ ┃ ┗ 📜my_application.h
 ┃ ┣ 📂macos
 ┃ ┃ ┣ 📂Flutter
 ┃ ┃ ┃ ┣ 📜Flutter-Debug.xcconfig
 ┃ ┃ ┃ ┣ 📜Flutter-Release.xcconfig
 ┃ ┃ ┃ ┗ 📜GeneratedPluginRegistrant.swift
 ┃ ┃ ┣ 📂Runner
 ┃ ┃ ┃ ┣ 📂Assets.xcassets
 ┃ ┃ ┃ ┃ ┗ 📂AppIcon.appiconset
 ┃ ┃ ┃ ┃ ┃ ┣ 📜app_icon_1024.png
 ┃ ┃ ┃ ┃ ┃ ┣ 📜app_icon_128.png
 ┃ ┃ ┃ ┃ ┃ ┣ 📜app_icon_16.png
 ┃ ┃ ┃ ┃ ┃ ┣ 📜app_icon_256.png
 ┃ ┃ ┃ ┃ ┃ ┣ 📜app_icon_32.png
 ┃ ┃ ┃ ┃ ┃ ┣ 📜app_icon_512.png
 ┃ ┃ ┃ ┃ ┃ ┣ 📜app_icon_64.png
 ┃ ┃ ┃ ┃ ┃ ┗ 📜Contents.json
 ┃ ┃ ┃ ┣ 📂Base.lproj
 ┃ ┃ ┃ ┃ ┗ 📜MainMenu.xib
 ┃ ┃ ┃ ┣ 📂Configs
 ┃ ┃ ┃ ┃ ┣ 📜AppInfo.xcconfig
 ┃ ┃ ┃ ┃ ┣ 📜Debug.xcconfig
 ┃ ┃ ┃ ┃ ┣ 📜Release.xcconfig
 ┃ ┃ ┃ ┃ ┗ 📜Warnings.xcconfig
 ┃ ┃ ┃ ┣ 📜AppDelegate.swift
 ┃ ┃ ┃ ┣ 📜DebugProfile.entitlements
 ┃ ┃ ┃ ┣ 📜Info.plist
 ┃ ┃ ┃ ┣ 📜MainFlutterWindow.swift
 ┃ ┃ ┃ ┗ 📜Release.entitlements
 ┃ ┃ ┣ 📂Runner.xcodeproj
 ┃ ┃ ┃ ┣ 📂project.xcworkspace
 ┃ ┃ ┃ ┃ ┗ 📂xcshareddata
 ┃ ┃ ┃ ┃ ┃ ┗ 📜IDEWorkspaceChecks.plist
 ┃ ┃ ┃ ┣ 📂xcshareddata
 ┃ ┃ ┃ ┃ ┗ 📂xcschemes
 ┃ ┃ ┃ ┃ ┃ ┗ 📜Runner.xcscheme
 ┃ ┃ ┃ ┗ 📜project.pbxproj
 ┃ ┃ ┣ 📂Runner.xcworkspace
 ┃ ┃ ┃ ┣ 📂xcshareddata
 ┃ ┃ ┃ ┃ ┗ 📜IDEWorkspaceChecks.plist
 ┃ ┃ ┃ ┗ 📜contents.xcworkspacedata
 ┃ ┃ ┣ 📂RunnerTests
 ┃ ┃ ┃ ┗ 📜RunnerTests.swift
 ┃ ┃ ┗ 📜.gitignore
 ┃ ┣ 📂sounds
 ┃ ┃ ┗ 📜all-pass.mp3
 ┃ ┣ 📂test
 ┃ ┃ ┗ 📜widget_test.dart
 ┃ ┣ 📂web
 ┃ ┃ ┣ 📂icons
 ┃ ┃ ┃ ┣ 📜Icon-192.png
 ┃ ┃ ┃ ┣ 📜Icon-512.png
 ┃ ┃ ┃ ┣ 📜Icon-maskable-192.png
 ┃ ┃ ┃ ┗ 📜Icon-maskable-512.png
 ┃ ┃ ┣ 📜favicon.png
 ┃ ┃ ┣ 📜index.html
 ┃ ┃ ┗ 📜manifest.json
 ┃ ┣ 📂windows
 ┃ ┃ ┣ 📂flutter
 ┃ ┃ ┃ ┣ 📜CMakeLists.txt
 ┃ ┃ ┃ ┣ 📜generated_plugins.cmake
 ┃ ┃ ┃ ┣ 📜generated_plugin_registrant.cc
 ┃ ┃ ┃ ┗ 📜generated_plugin_registrant.h
 ┃ ┃ ┣ 📂runner
 ┃ ┃ ┃ ┣ 📂resources
 ┃ ┃ ┃ ┃ ┗ 📜app_icon.ico
 ┃ ┃ ┃ ┣ 📜CMakeLists.txt
 ┃ ┃ ┃ ┣ 📜flutter_window.cpp
 ┃ ┃ ┃ ┣ 📜flutter_window.h
 ┃ ┃ ┃ ┣ 📜main.cpp
 ┃ ┃ ┃ ┣ 📜resource.h
 ┃ ┃ ┃ ┣ 📜runner.exe.manifest
 ┃ ┃ ┃ ┣ 📜Runner.rc
 ┃ ┃ ┃ ┣ 📜utils.cpp
 ┃ ┃ ┃ ┣ 📜utils.h
 ┃ ┃ ┃ ┣ 📜win32_window.cpp
 ┃ ┃ ┃ ┗ 📜win32_window.h
 ┃ ┃ ┣ 📜.gitignore
 ┃ ┃ ┗ 📜CMakeLists.txt
 ┃ ┣ 📜.gitignore
 ┃ ┣ 📜.metadata
 ┃ ┣ 📜analysis_options.yaml
 ┃ ┣ 📜pubspec.lock
 ┃ ┣ 📜pubspec.yaml
 ┃ ┗ 📜README.md
```
</div>
</details>

<details>
<summary>Data 폴더 구조</summary>
<div markdown="1">

```
📦data
 ┣ 📂gradle
 ┃ ┗ 📂wrapper
 ┃ ┃ ┣ 📜gradle-wrapper.jar
 ┃ ┃ ┗ 📜gradle-wrapper.properties
 ┣ 📂sink
 ┃ ┣ 📂src
 ┃ ┃ ┗ 📂main
 ┃ ┃ ┃ ┗ 📂java
 ┃ ┃ ┃ ┃ ┗ 📂com
 ┃ ┃ ┃ ┃ ┃ ┗ 📂sinkconnector
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂config
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜TrafficLightSinkConnectorConfig.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂dataset
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂model
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜TrafficSignalData.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜CustomLocalDateTimeDeserializer.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜FirebaseAdmin.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜TrafficLightSinkConnector.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜TrafficLightSinkTask.java
 ┃ ┗ 📜build.gradle
 ┣ 📂source
 ┃ ┣ 📂src
 ┃ ┃ ┗ 📂main
 ┃ ┃ ┃ ┗ 📂java
 ┃ ┃ ┃ ┃ ┗ 📂com
 ┃ ┃ ┃ ┃ ┃ ┗ 📂sourceconnector
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂config
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜TrafficLightSourceConnectorConfig.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂dataset
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂model
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜TrafficSignalData.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜CustomLocalDateTimeDeserializer.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜DataService.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜TrafficLightSourceConnector.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜TrafficLightSourcePartition.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜TrafficLightSourceTask.java
 ┃ ┗ 📜build.gradle
 ┣ 📜.gitignore
 ┣ 📜application.yml
 ┣ 📜build.gradle
 ┣ 📜Dockerfile
 ┣ 📜gradlew
 ┣ 📜gradlew.bat
 ┗ 📜settings.gradle
```
</div>
</details>
