# DaeChing-Front
![Frame 58](https://github.com/DaeChing/DaeChing-Front/assets/97583162/cf380a80-0918-48b5-aa94-86262ee71b19)

 ### _**👑 대장팀 👑**_
 _**대장님 팀의 iOS앱! 대칭💙**_ 
 </div>
 
 
### 🐰 About DeaChing
> 📅 프로젝트 기간: 2023.08.25 - 2023.08.26


대구시 청년 유출 문제을 해결하기 위한 청년 구직자와 대구시 IT구인자들을 매칭해주는 플랫폼
<br>
<br>
 
 ### 🧑‍💻 Authors
> 대장

<details>
<summary>Role ♥️</summary>
<div>

- 한영균: 기획 및 프로젝트 총괄
- 박보경, 신서연: iOS앱 개발 및 디자인
- 홍지표: 백엔드 개발, 서비스 배포, 웹 프론트 개발

</div>
</details>

|[<img src="https://github.com/bokoo14.png" width="100px">](https://github.com/bokoo14)|[<img src="https://github.com/devMuscle.png" width="100px">](https://github.com/devMuscle)|[<img src="https://github.com/seoyeon-1206.png" width="100px">](https://github.com/seoyeon-1206)|[<img src="https://github.com/Hanyeonggyun.png" width="100px">](https://github.com/Hanyeonggyun)|
|:----:|:----:|:----:|:----:|
|[박보경](https://github.com/bokoo14)|[홍지표](https://github.com/devMuscle)|[신서연](https://github.com/seoyeon-1206)|[한영균](https://github.com/Hanyeonggyun)|
<br>

---
### 🛠 Development Environment
<img width="80" src="https://img.shields.io/badge/IOS-16%2B-silver"> <img width="95" src="https://img.shields.io/badge/Xcode-14.3-blue">
<br>

### :sparkles: Skills & Tech Stack
* SwiftUI
* Figma
* Spring Boot
* AWS
<br>

### 🎁 Library
```swift
import SwiftUI
import Alomfire
```
<br>

### 🗂 Folder Structure
```swift
├── Assets.xcassets
│   ├── AccentColor.colorset
│   │   └── Contents.json
│   ├── AppIcon.appiconset
│   │   ├── Contents.json
│   │   └── 앱 로고.png
│   ├── Color
│   │   ├── Contents.json
│   │   ├── Main
│   │   │   ├── Contents.json
│   │   │   ├── mainImport500.colorset
│   │   │   │   └── Contents.json
│   │   │   ├── mainPoint500.colorset
│   │   │   │   └── Contents.json
│   │   │   ├── mainPrimary500.colorset
│   │   │   │   └── Contents.json
│   │   │   ├── mainSub1500.colorset
│   │   │   │   └── Contents.json
│   │   │   └── mainSub2500.colorset
│   │   │       └── Contents.json
│   │   ├── System
│   │   │   ├── Contents.json
│   │   │   ├── systemBlack.colorset
│   │   │   │   └── Contents.json
│   │   │   ├── systemGray1.colorset
│   │   │   │   └── Contents.json
│   │   │   ├── systemGray2.colorset
│   │   │   │   └── Contents.json
│   │   │   └── systemGray3.colorset
│   │   │       └── Contents.json
│   │   └── Text
│   │       ├── Contents.json
│   │       ├── textColorImport.colorset
│   │       │   └── Contents.json
│   │       ├── textColorPrimary.colorset
│   │       │   └── Contents.json
│   │       ├── textDark300.colorset
│   │       │   └── Contents.json
│   │       ├── textDark400.colorset
│   │       │   └── Contents.json
│   │       ├── textDark500.colorset
│   │       │   └── Contents.json
│   │       ├── textLight100.colorset
│   │       │   └── Contents.json
│   │       ├── textLight200.colorset
│   │       │   └── Contents.json
│   │       ├── textLight300.colorset
│   │       │   └── Contents.json
│   │       ├── textLight400.colorset
│   │       │   └── Contents.json
│   │       └── textLight500.colorset
│   │           └── Contents.json
│   ├── Contents.json
│   └── Image
│       ├── Contents.json
│       ├── ImgJootpia.imageset
│       │   ├── Contents.json
│       │   └── ImgJootpia.png
│       ├── JobCard.imageset
│       │   ├── Contents.json
│       │   └── JobCard.png
│       ├── JobCard2.imageset
│       │   ├── Contents.json
│       │   └── JobCard2.png
│       ├── JobCard3.imageset
│       │   ├── Contents.json
│       │   └── JobCard3.png
│       ├── Splash.imageset
│       │   ├── Contents.json
│       │   └── Splash.png
│       ├── alarm.imageset
│       │   ├── Contents.json
│       │   └── alarm.png
│       ├── email.imageset
│       │   ├── Contents.json
│       │   └── email.png
│       ├── follow.imageset
│       │   ├── Contents.json
│       │   └── follow.png
│       ├── handShake.imageset
│       │   ├── Contents.json
│       │   └── handShake.png
│       ├── pencil.imageset
│       │   ├── Contents.json
│       │   └── pencil.png
│       ├── person.imageset
│       │   ├── Contents.json
│       │   └── person.png
│       ├── q&a.imageset
│       │   ├── Contents.json
│       │   └── q&a.png
│       ├── resume.imageset
│       │   ├── Contents.json
│       │   └── resume.png
│       └── save.imageset
│           ├── Contents.json
│           └── save.png
├── ContentView.swift
├── DaeChingApp.swift
├── Info.plist
├── InfoApplicants
│   └── InfoApplicantsView.swift
├── Model
│   ├── CompanyModel.swift
│   ├── LogInModel.swift
│   ├── RecruitmentsModel.swift
│   ├── ResumeModel.swift
│   └── SignUpModel.swift
├── Networking
│   ├── JSONParsingManager.swift
│   └── NetworkManager.swift
├── Preview Content
│   └── Preview Assets.xcassets
│       └── Contents.json
├── Test.swift
├── Utils
│   ├── Colors
│   │   └── ColorExtension.swift
│   └── Fonts
│       ├── FontExtension.swift
│       └── Pretendard
│           ├── Pretendard-Black.otf
│           ├── Pretendard-Bold.otf
│           ├── Pretendard-ExtraBold.otf
│           ├── Pretendard-ExtraLight.otf
│           ├── Pretendard-Light.otf
│           ├── Pretendard-Medium.otf
│           ├── Pretendard-Regular.otf
│           ├── Pretendard-SemiBold.otf
│           └── Pretendard-Thin.otf
└── View
    ├── Applicant
    │   ├── ApplicantsListView.swift
    │   └── InfoApplicantsView.swift
    ├── Applicants
    │   └── ApplicationListView.swift
    ├── Certification
    │   └── CertifiationView.swift
    ├── Chat
    │   └── ChatView.swift
    ├── Component.swift
    ├── CurrentState
    │   └── MyStateView.swift
    ├── LogIn
    │   └── LogInView.swift
    ├── Main
    │   ├── ApplyJobView.swift
    │   ├── CardArea.swift
    │   ├── JobDetailView.swift
    │   ├── MainView.swift
    │   ├── ResearchJobView.swift
    │   ├── SearchArea.swift
    │   └── UploadJobOfferView.swift
    ├── ManagePeople
    │   └── ManagePeopleView.swift
    ├── MyPage
    │   └── MyPageView.swift
    ├── PeopleManage
    │   └── PeopleManageView.swift
    ├── SIgnIn
    │   └── SignUpView.swift
    └── ViewBuilder
        └── ViewBuilders.swift

```
<br>
 
### 🔀 Git branch & Git Flow
1. Git Convention
  - `[Hotfix]` : issue나, QA에서 급한 버그 수정에 사용
  - `[Fix]` : 버그, 오류 해결
  - `[Add]` : Feat 이외의 부수적인 코드 추가, 라이브러리 추가, 새로운 파일 생성 시
  - `[Style]` : 코드 포맷팅, 세미콜론 누락, 코드 변경이 없는 경우
  - `[Feat]` : 새로운 기능 구현
  - `[Del]` : 쓸모없는 코드 삭제
  - `[Docs]` : README나 WIKI 등의 문서 개정
  - `[Chore]` : 코드 수정, 내부 파일 수정, 빌드 업무 수정, 패키지 매니저 수정
  - `[Correct]` : 주로 문법의 오류나 타입의 변경, 이름 변경 등에 사용합니다.
  - `[Move]` : 프로젝트 내 파일이나 코드의 이동
  - `[Rename]` : 파일 이름 변경이 있을 때 사용합니다.
  - `[Refactor]` : 전면 수정이 있을 때 사용합니다
  - `[Init]` : Initial Commit
2. Branch 전략
  - `main` : 개발이 완료된 산출물이 저장될 공간
  - `develop` : feature 브랜치에서 구현된 기능들이 merge될 브랜치
  - `feature` : 기능을 개발하는 브랜치, 이슈별/작업별로 브랜치를 생성하여 기능을 개발한다
  - `release` : 릴리즈를 준비하는 브랜치, 릴리즈 직전 QA 기간에 사용한다
  - `hotfix` : 버그를 수정하는 브랜치
<br>

### :lock_with_ink_pen: License
<img width="100" src="https://img.shields.io/badge/MIT License-2.0-yellow">
<br><br>
