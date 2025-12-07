# AURA Client

> AI-Powered Museum Docent for Visually Impaired Users

**AURA (Artwork Unified Resonance App)**는 시각장애인을 위한 AI 기반 맞춤형 미술관 도슨트 애플리케이션입니다. 사용자의 개인적 맥락, 경험, 감정을 바탕으로 Gemini AI가 생성하는 공감적인 작품 해설을 제공합니다.

## 주요 기능

### 🎨 맞춤형 도슨트 생성
- **AI 기반 해설**: Gemini AI를 활용한 개인화된 작품 해설 생성
- **맥락 인식**: 사용자의 기억, 경험, 감정을 반영한 해설
- **Few-shot 학습**: 사용자 피드백을 통한 지속적인 품질 개선

### ♿ 포괄적 접근성
- **전체 화면 TTS**: 모든 화면에서 Text-to-Speech 안내
- **음성 입력**: 텍스트 입력의 음성 대안 제공
- **햅틱 피드백**: 모든 상호작용에 촉각 피드백
- **고대비 모드**: 시각적 접근성 향상

### 🔍 다중 모달 검색
- **텍스트 검색**: 키워드 기반 작품 검색
- **음성 검색**: Speech-to-Text를 활용한 음성 검색
- **카메라 검색**: OCR 기반 작품 인식 및 검색

### 🎧 고급 오디오 기능
- **네이티브 TTS**: Android TextToSpeech API를 활용한 실시간 음성 합성
- **이중 모드**: 서버 생성 오디오와 네이티브 TTS의 자동 전환
- **실시간 분석**: 재생 통계 및 사용자 참여도 추적

## 기술 스택

- **프레임워크**: Flutter 3.9.2
- **상태 관리**: Riverpod 2.6.1
- **아키텍처**: Clean Architecture
- **코드 생성**: Freezed + JSON Serializable
- **오디오**: just_audio, flutter_tts
- **인식**: speech_to_text, google_mlkit_text_recognition
- **네이티브 통합**: Method Channels (Flutter ↔ Kotlin)

## 시작하기

### 필요 조건

- Flutter SDK ^3.9.2
- Dart SDK ^3.9.2
- Android Studio / Xcode
- Android SDK 21+ (Lollipop 이상)

### 설치

1. 저장소 클론
```bash
git clone https://github.com/your-username/aura_client.git
cd aura_client
```

2. 의존성 설치
```bash
flutter pub get
```

3. 코드 생성 (Freezed, JSON Serializable)
```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

4. 앱 실행
```bash
flutter run
```

### 빌드

#### Android APK
```bash
flutter build apk --release
```

#### Android App Bundle
```bash
flutter build appbundle --release
```

## 프로젝트 구조

```
lib/
├── core/                      # 공통 핵심 기능
│   ├── theme/                # 디자인 시스템
│   ├── accessibility/        # TTS 및 접근성 서비스
│   └── utils/                # 유틸리티
├── data/                      # Data Layer
│   ├── models/               # API 응답 모델
│   ├── services/             # API 서비스
│   └── repositories/         # 데이터 저장소
├── domain/                    # Domain Layer
│   ├── entities/             # 비즈니스 엔티티
│   ├── providers/            # Riverpod 프로바이더
│   └── usecases/             # 유스케이스
└── presentation/              # Presentation Layer
    ├── screens/              # UI 화면
    └── widgets/              # 재사용 가능한 위젯
```

## 라이선스 정보

이 프로젝트는 다음 오픈 소스 라이브러리를 사용합니다:

### 직접 의존성

| 패키지 | 버전 | 라이선스 | 용도 |
|---------|---------|---------|---------|
| `flutter` | SDK | BSD-3-Clause | UI 프레임워크 |
| `cupertino_icons` | ^1.0.8 | MIT | iOS 스타일 아이콘 |
| **상태 관리** |
| `flutter_riverpod` | ^2.6.1 | MIT | 상태 관리 및 의존성 주입 |
| **코드 생성** |
| `freezed_annotation` | ^2.4.4 | MIT | 불변 데이터 클래스 |
| `json_annotation` | ^4.9.0 | BSD-3-Clause | JSON 직렬화 |
| **저장소** |
| `shared_preferences` | ^2.3.3 | BSD-3-Clause | 로컬 키-값 저장소 |
| **접근성** |
| `flutter_tts` | ^4.2.0 | MIT | Text-to-speech |
| `just_audio` | ^0.10.5 | MIT | 오디오 재생 |
| **OCR** |
| `google_mlkit_text_recognition` | ^0.15.0 | BSD-3-Clause | 광학 문자 인식 |
| **인증** |
| `jwt_decoder` | ^2.0.1 | MIT | JWT 토큰 디코딩 |
| **HTTP 클라이언트** |
| `http` | ^1.2.2 | BSD-3-Clause | HTTP 요청 |
| **음성 입력** |
| `record` | ^6.1.2 | MIT | 오디오 녹음 |
| `path_provider` | ^2.1.4 | BSD-3-Clause | 파일 시스템 경로 |
| `speech_to_text` | ^7.0.0 | BSD-3-Clause | 음성 인식 |
| **카메라** |
| `camera` | ^0.11.0+2 | BSD-3-Clause | 카메라 접근 |

### 개발 의존성

| 패키지 | 버전 | 라이선스 | 용도 |
|---------|---------|---------|---------|
| `flutter_test` | SDK | BSD-3-Clause | 테스트 프레임워크 |
| `flutter_lints` | ^5.0.0 | BSD-3-Clause | 린팅 규칙 |
| `build_runner` | ^2.4.13 | BSD-3-Clause | 코드 생성 러너 |
| `freezed` | ^2.5.7 | MIT | 유니온/패턴 매칭용 코드 생성기 |
| `json_serializable` | ^6.8.0 | BSD-3-Clause | JSON 코드 생성기 |

### 커스텀 폰트

| 폰트 | 라이선스 | 사용 |
|------|---------|-------|
| MaruBuri | SIL Open Font License 1.1 | 앱 전체 한국어 타이포그래피 |

### 네이티브 Android 컴포넌트

| 컴포넌트 | 라이선스 | 용도 |
|-----------|---------|---------|
| Android TextToSpeech API | Apache 2.0 | 네이티브 TTS 합성 |
| Kotlin Standard Library | Apache 2.0 | 네이티브 코드 |

### 라이선스 준수 요약

이 프로젝트는 독점적으로 허용적 라이선스를 사용합니다:
- **MIT License**: 대부분의 패키지 (flutter_riverpod, freezed, jwt_decoder 등)
- **BSD-3-Clause License**: Flutter SDK, Google 패키지, HTTP 클라이언트
- **Apache 2.0**: Android 네이티브 컴포넌트

모든 라이선스가 허용하는 것:
- ✅ 상업적 사용
- ✅ 수정
- ✅ 배포
- ✅ 개인적 사용

저작권 표시 요구사항:
- 배포 시 저작권 공지 포함
- BSD/MIT 패키지의 라이선스 텍스트 포함

## 기여하기

기여를 환영합니다! 기여하기 전에 다음을 확인해 주세요:

1. [.claude/coding_guidelines.md](./.claude/coding_guidelines.md)를 읽고 코딩 규칙을 따릅니다
2. [.claude/architecture_patterns.md](./.claude/architecture_patterns.md)를 이해합니다
3. Pull Request 전에 테스트를 작성하고 실행합니다

### 개발 워크플로우

```bash
# 브랜치 생성
git checkout -b feature/your-feature-name

# 변경사항 커밋
git commit -m "feat: add your feature"

# 코드 생성 (필요 시)
flutter pub run build_runner build --delete-conflicting-outputs

# 테스트 실행
flutter test

# Push 및 Pull Request 생성
git push origin feature/your-feature-name
```

## 지원
문제가 발생하거나 기능 요청이 있으신 경우:
- [Issue 생성](https://github.com/kevinlim17/aura-client/issues)
- 이메일: kevinlim17@icloud.com

## 로드맵

### 현재 버전 (v1.0.0)
- ✅ 사용자 인증 및 온보딩
- ✅ 다중 모달 검색 (텍스트/음성/카메라)
- ✅ AI 도슨트 생성
- ✅ 네이티브 TTS 통합
- ✅ 피드백 시스템

### 계획된 기능 (v2.0.0)
- 🔄 동행자 모드
- 🔄 오프라인 모드
- 🔄 소셜 공유 기능
- 🔄 고급 분석 대시보드


## 감사의 말

- Google Gemini AI for natural language generation
- Flutter community for excellent packages
- All contributors and testers

---

## MIT License

```
MIT License

Copyright (c) 2025 Seung-hyeon Lim

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```

---

**Made with ❤️ for accessible museum experiences**