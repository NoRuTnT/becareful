# :clapper: 조심횡


## 📚 목차
- [💬 서비스 소개](#intro)
- [🎯 기획 배경](#plans)
- [🙇 팀원 소개](#members)
- [💡 주요 기능](#features)
- [🔑 기술 소개](#technology)
- [🔨 개발 환경](#skills)
- [🚀 포팅 메뉴얼](#installation)
- [📂 폴더 구조](#folder)

<a name="intro"></a>
## 💬 서비스 소개

**횡단보도 보행시 잔여 시간 알림과 같은 보조 기능들을 제공합니다.**

- 횡단보도 잔여 시간 알림
- 횡단보도 보행시 횡단보도에서 벗어나지 않도록 진동을 통한 방향 보조 기능
- 진입한 횡단보도의 진행 방면을 알려주는 알림 기능
- 파손된 점자블록 신고 기능

<a name="plans"></a>
## 🎯 기획 배경
- 시각장애인들의 횡단보도 보행시 다양한 불편함
    - 도로는 건너는 중 현재 신호가 초록불인지 빨간불인지 알수가없다
    - 신호가 몇초 남았는지 알 수 없어 건너는도중 빨간불로 바뀌었을까봐 걱정된다.
    - 음향신호기가 고장나서 소리가 나지 않거나 소리가 너무 작아서 알아들을수없는 경우가 있다.
    - 음향신호기가 설치되지 않은 교차로가 존재한다
    - 음향신호기 위치까지 점자블록이 이어져 있지 않아서 음향신호기 버튼을 찾을수가없다.  

위의 문제점들을 해결할 수 있는 시각장애인을 위한 안전보행서비스를 개발하게되었다.

<a name="members"></a>
## 🙇 팀원 소개

|**최동헌 (팀장/BE)**|**문준형 (팀원/BE)**|**차다운 (팀원/BE)**|
|:---:|:---:|:---:|
|S3, 카프카 Sink Connector|인프라, 카프카 파이프라인|카프카 Sink Connector , Firebase|


|**이은지 (팀원/FE)**|**김지환 (팀원/FE)**|
|:---:|:---:|
|화면 페이지 구현, Firebase|화면 페이지 구현, Geofencing 구현|

<a name="features"></a>

## 💡 주요 기능

### 🖥️ 랜딩 페이지
|  초기화면  |
|:---------:|
| ![초기화면](/uploads/97564a9008894b4c42e84692007c0564/초기화면.gif) |

### 🙋‍♀️ 로그인 및 회원가입

|  정보입력  |
|:---------:|
| ![정보입력](/uploads/a308ddcfeb2c0961ae620d7265d5d2d1/정보입력.gif) |

|  관심영상  |
|:---------:|
| ![관심영상](/uploads/f1725ae685a2ccfa8df84464b0ed097c/관심영상.gif) |

|  레벨테스트  |
|:---------:|
| ![레벨테스트](/uploads/8c67aa24c2512950804c5e615702ce41/레벨테스트.gif) |

### 🎞 메인 페이지
|  최근 학습 뉴스와 추천 뉴스 |
|:---------:|
| ![메인페이지](/uploads/b4128a368d4122f41006b1fdadbba4ee/메인페이지.gif) |


### 📑 영상 목록 페이지
|  카테고리별 조회  |
|:---------:|
| ![둘러보기](/uploads/437dad0317e1aaabc558c2aaf7ed2cbd/둘러보기.gif) |

|  제목과 문장에서 키워드로 검색 |
|:---------:|
| ![검색기능](/uploads/bd5134cd9e8e8f22721cf35987c4de53/검색기능.gif) |



### ✏ 학습 진행 페이지 
|  스크립트  |
|:----------|
| ![스크립트](/uploads/e8f7e7755b013025e69fa57704b790ca/스크립트.gif) |

|   발음평가  |
|:----------:|
| ![발음평가](/uploads/86af72ffe6fd19c3c0e9c4df3dedaa9c/발음평가.gif) |

|  영어사전 팝업창  |
|:----------|
| ![영어사전팝업창](/uploads/1ae7baf98575ba6026a43cf114285639/영어사전팝업창.gif) |

|  단어장  |
|:----------|
| ![단어장](/uploads/6873dd3d895ede78bdf0ca6804c880af/단어장.gif) |

|  학습통계  |
|:----------|
| ![학습통계](/uploads/12e758804ef3ca7d8b7c18a469a16fd4/학습통계.gif) |

### 💯 학습 테스트 페이지
| 시험 문제 |
|:---------:|
| ![학습테스트](/uploads/c458690fafb26b9b95f4a93c723e2c85/학습테스트.gif) |

| 채점 결과 |
|:---------:|
| ![채점결과](/uploads/8819f8497c34af8183113a6f18980114/채점.gif) |

### 📑 학습 기록 페이지
|  학습 상태별 영상 |
|:---------:|
| ![학습기록영상](/uploads/ea15283568edac11fdacfd91828539c9/학습기록영상.gif) |

|  커스텀 단어장  |
|:---------:|
| ![커스텀단어장](/uploads/878c855a71ae41f293f32b746f5d4df8/커스텀단어장.gif) |

<a name="technology"></a>
## 🔑 기술 소개



### 📉 Geofence
- 실제 위치에 기반해 가상의 경계를 생성
- 기반 서비스와 센서 기술을 결합하여 실시간으로 특정 지역에서의 사건을 감지하고 대응

---

### 📊 kafka Connect

- EC2 서버의 높은 처리량과 내결함성을 고려하여 **kafka connect** 데이터 파이프라인 사용
- 실서비스의 유연성과 확장성를 위해 **kafka connect** 데이터 파이프라인 구현



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

