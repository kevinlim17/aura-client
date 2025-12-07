# Aura UI Design Guideline - Claude Code 구현 가이드

> **목적**: Flutter Frontend 구현 시 Claude Code가 참조할 수 있는 디자인 시스템 및 접근성 중심 UI 가이드라인

---

## 📐 디자인 철학 (Design Philosophy)

### 핵심 원칙
Aura는 **시각장애인을 위한 미술관 가이드** 앱으로, 모든 UI 결정은 다음 우선순위를 따릅니다:

1. **접근성 우선 (Accessibility First)**: 모든 인터랙션은 음성, 진동, TTS로 완전히 작동해야 함
2. **명확성 (Clarity)**: 큰 텍스트, 높은 대비, 명확한 시각적 계층
3. **단순성 (Simplicity)**: 불필요한 장식 배제, 본질적 요소만 유지
4. **일관성 (Consistency)**: 모든 화면에서 동일한 패턴과 상호작용 방식

---

## 🎨 컬러 시스템 (Color System)

### Primary Palette

```dart
// lib/core/theme/app_colors.dart
class AppColors {
  // Primary - Teal/Cyan (주요 액션, 강조)
  static const Color primary = Color(0xFF00BCD4);
  static const Color primaryLight = Color(0xFF62EFFF);
  static const Color primaryDark = Color(0xFF008BA3);
  
  // Secondary - Blue Gray (보조 액션, 비활성화)
  static const Color secondary = Color(0xFF546E7A);
  static const Color secondaryLight = Color(0xFF819CA9);
  static const Color secondaryDark = Color(0xFF29434E);
  
  // Success - Green (성공 상태, 확인)
  static const Color success = Color(0xFF4CAF50);
  static const Color successLight = Color(0xFF80E27E);
  static const Color successDark = Color(0xFF087F23);
  
  // Background & Surface
  static const Color background = Color(0xFFF5F5F0); // Off-white/Cream
  static const Color surface = Color(0xFFFFFFFF);
  static const Color surfaceVariant = Color(0xFFF0F0EB);
  
  // Text
  static const Color textPrimary = Color(0xFF212121);
  static const Color textSecondary = Color(0xFF757575);
  static const Color textDisabled = Color(0xFFBDBDBD);
  
  // Divider
  static const Color divider = Color(0xFF212121);
  static const Color dividerLight = Color(0xFFE0E0E0);
}
```

### 접근성 대비 요구사항
- **최소 대비 비율**: 4.5:1 (WCAG AA 기준)
- **큰 텍스트(24px+) 대비**: 3:1 이상
- **인터랙티브 요소 대비**: 4.5:1 필수

### 컬러 사용 규칙

**Primary (Teal)**
- 주요 CTA 버튼 (로그인, 다음, 도슨트 시작 등)
- 진행 중 상태 (음성 입력 중, 로딩 인디케이터)
- 선택된 상태 (칩, 토글)
- 강조할 정보 (작품 제목 하이라이트)

**Secondary (Gray)**
- 보조 액션 버튼 (이전, 건너뛰기, 취소)
- 비활성화 상태
- 중립적 정보 제공

**Success (Green)**
- 완료 상태 (체크마크, 성공 메시지)
- 확인 아이콘
- 긍정적 피드백

---

## 📏 타이포그래피 (Typography)

### Font Family
```dart
// lib/core/theme/app_typography.dart
class AppTypography {
  // 한글: Noto Sans KR
  // 영문: SF Pro (iOS), Roboto (Android)
  static const String fontFamilyPrimary = 'NotoSansKR';
}
```

### Text Styles

```dart
class AppTextStyles {
  // Display - 브랜딩, 온보딩 타이틀
  static const TextStyle display = TextStyle(
    fontFamily: AppTypography.fontFamilyPrimary,
    fontSize: 48.0,
    fontWeight: FontWeight.w400,
    height: 1.2,
    letterSpacing: -0.5,
  );
  
  // Headline 1 - 화면 제목
  static const TextStyle headline1 = TextStyle(
    fontFamily: AppTypography.fontFamilyPrimary,
    fontSize: 32.0,
    fontWeight: FontWeight.w700,
    height: 1.3,
  );
  
  // Headline 2 - 섹션 제목
  static const TextStyle headline2 = TextStyle(
    fontFamily: AppTypography.fontFamilyPrimary,
    fontSize: 24.0,
    fontWeight: FontWeight.w700,
    height: 1.4,
  );
  
  // Body 1 - 본문 텍스트 (강조)
  static const TextStyle body1 = TextStyle(
    fontFamily: AppTypography.fontFamilyPrimary,
    fontSize: 18.0,
    fontWeight: FontWeight.w500,
    height: 1.6,
  );
  
  // Body 2 - 본문 텍스트 (일반)
  static const TextStyle body2 = TextStyle(
    fontFamily: AppTypography.fontFamilyPrimary,
    fontSize: 16.0,
    fontWeight: FontWeight.w400,
    height: 1.6,
  );
  
  // Caption - 부가 정보, 레이블
  static const TextStyle caption = TextStyle(
    fontFamily: AppTypography.fontFamilyPrimary,
    fontSize: 14.0,
    fontWeight: FontWeight.w400,
    height: 1.4,
    color: AppColors.textSecondary,
  );
  
  // Button - 버튼 텍스트
  static const TextStyle button = TextStyle(
    fontFamily: AppTypography.fontFamilyPrimary,
    fontSize: 18.0,
    fontWeight: FontWeight.w700,
    height: 1.2,
    letterSpacing: 0.5,
  );
}
```

### 타이포그래피 규칙

1. **최소 폰트 크기**: 16px (body text)
2. **버튼 텍스트**: 18px 이상
3. **제목 텍스트**: 24px 이상
4. **줄 간격**: 1.4~1.6 (가독성 확보)
5. **텍스트 정렬**: 기본 왼쪽 정렬, 중앙 정렬은 제한적 사용

---

## 🧱 레이아웃 시스템 (Layout System)

### Spacing Scale

```dart
// lib/core/theme/app_spacing.dart
class AppSpacing {
  static const double xs = 4.0;
  static const double sm = 8.0;
  static const double md = 16.0;
  static const double lg = 24.0;
  static const double xl = 32.0;
  static const double xxl = 48.0;
  static const double xxxl = 64.0;
}
```

### 화면 레이아웃 패턴

#### 기본 구조
```dart
// 모든 화면의 기본 Scaffold 구조
Scaffold(
  backgroundColor: AppColors.background,
  body: SafeArea(
    child: Padding(
      padding: EdgeInsets.symmetric(
        horizontal: AppSpacing.lg, // 좌우 24px
        vertical: AppSpacing.md,   // 상하 16px
      ),
      child: Column(
        children: [
          // 1. Progress Indicator (선택적)
          if (showProgress) ProgressIndicator(),
          SizedBox(height: AppSpacing.lg),
          
          // 2. Screen Title
          Text('화면 제목', style: AppTextStyles.headline1),
          SizedBox(height: AppSpacing.xl),
          
          // 3. Main Content
          Expanded(
            child: SingleChildScrollView(
              child: MainContent(),
            ),
          ),
          
          // 4. Bottom Actions
          SizedBox(height: AppSpacing.lg),
          BottomActionButtons(),
        ],
      ),
    ),
  ),
)
```

### Grid & Alignment

- **컨테이너 최대 너비**: 제한 없음 (전체 화면 활용)
- **좌우 여백**: 24px (lg)
- **컴포넌트 간 간격**: 16px (md) ~ 32px (xl)
- **섹션 간 간격**: 48px (xxl)

---

## 🎯 인터랙티브 요소 (Interactive Elements)

### 1. Buttons

#### Primary Button
```dart
// lib/presentation/widgets/primary_button.dart
class PrimaryButton extends StatelessWidget {
  final String label;
  final String semanticLabel;
  final VoidCallback? onPressed;
  final bool isLoading;
  
  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      label: semanticLabel,
      enabled: onPressed != null && !isLoading,
      child: GestureDetector(
        onTap: () {
          if (onPressed != null && !isLoading) {
            HapticFeedback.mediumImpact();
            onPressed!();
          }
        },
        child: Container(
          width: double.infinity,
          height: 56.0, // 최소 터치 영역 48dp + 여유
          decoration: BoxDecoration(
            color: onPressed != null 
              ? AppColors.primary 
              : AppColors.textDisabled,
            borderRadius: BorderRadius.circular(8.0),
          ),
          alignment: Alignment.center,
          child: isLoading
            ? CircularProgressIndicator(color: Colors.white)
            : Text(
                label,
                style: AppTextStyles.button.copyWith(
                  color: Colors.white,
                ),
              ),
        ),
      ),
    );
  }
}
```

**디자인 규칙**:
- **높이**: 56px (최소 터치 영역 48dp 이상)
- **너비**: 기본 full width, 필요시 제한
- **둥근 모서리**: 8px
- **텍스트**: 18px, Bold, White
- **비활성화**: Gray 배경, 투명도 낮춤
- **로딩**: CircularProgressIndicator 표시

#### Secondary Button
```dart
// Secondary Button은 Primary와 동일하되 색상만 변경
decoration: BoxDecoration(
  color: AppColors.secondary,
  borderRadius: BorderRadius.circular(8.0),
)
```

#### Button Spacing
```dart
// 연속된 버튼 간 간격
Column(
  children: [
    PrimaryButton(label: '다음'),
    SizedBox(height: AppSpacing.md), // 16px
    SecondaryButton(label: '이전'),
  ],
)
```

### 2. Input Fields

#### Text Input Field
```dart
// lib/presentation/widgets/app_text_field.dart
class AppTextField extends StatelessWidget {
  final String label;
  final String? hint;
  final String? semanticLabel;
  final TextEditingController? controller;
  final bool obscureText;
  final TextInputType? keyboardType;
  
  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: semanticLabel ?? label,
      textField: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Label
          Text(
            label,
            style: AppTextStyles.body1,
          ),
          SizedBox(height: AppSpacing.sm),
          
          // Input Field
          Container(
            decoration: BoxDecoration(
              color: AppColors.surface,
              borderRadius: BorderRadius.circular(8.0),
              border: Border.all(
                color: AppColors.dividerLight,
                width: 2.0,
              ),
            ),
            child: TextField(
              controller: controller,
              obscureText: obscureText,
              keyboardType: keyboardType,
              style: AppTextStyles.body2,
              decoration: InputDecoration(
                hintText: hint,
                hintStyle: AppTextStyles.body2.copyWith(
                  color: AppColors.textDisabled,
                ),
                border: InputBorder.none,
                contentPadding: EdgeInsets.all(AppSpacing.md),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
```

**디자인 규칙**:
- **높이**: 최소 56px (padding 포함)
- **레이블**: 입력 필드 위에 별도 표시
- **테두리**: 2px, Gray
- **포커스 상태**: 테두리 색상 Primary로 변경
- **패딩**: 16px (md)
- **둥근 모서리**: 8px

### 3. Voice Input Button

```dart
// lib/presentation/widgets/voice_input_button.dart
class VoiceInputButton extends StatelessWidget {
  final bool isRecording;
  final VoidCallback onTap;
  final String semanticLabel;
  
  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      label: semanticLabel,
      hint: isRecording ? '녹음 중' : '음성 입력 시작',
      child: GestureDetector(
        onTap: () {
          HapticFeedback.heavyImpact();
          onTap();
        },
        child: Container(
          width: 120.0,
          height: 120.0,
          decoration: BoxDecoration(
            color: isRecording 
              ? AppColors.primary 
              : AppColors.primary.withOpacity(0.9),
            shape: BoxShape.circle,
            boxShadow: [
              if (isRecording)
                BoxShadow(
                  color: AppColors.primary.withOpacity(0.5),
                  blurRadius: 20.0,
                  spreadRadius: 5.0,
                ),
            ],
          ),
          child: Icon(
            Icons.mic,
            size: 48.0,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
```

**디자인 규칙**:
- **크기**: 120x120px (큰 터치 영역)
- **모양**: 원형 (circle)
- **아이콘**: Microphone, 48px
- **활성 상태**: 그림자 효과 추가
- **진동 피드백**: heavyImpact

### 4. Icon Buttons

```dart
// 검색, 카메라 등 아이콘 버튼
class IconActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final String semanticLabel;
  final VoidCallback onTap;
  
  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      label: semanticLabel,
      child: InkWell(
        onTap: () {
          HapticFeedback.lightImpact();
          onTap();
        },
        borderRadius: BorderRadius.circular(8.0),
        child: Container(
          padding: EdgeInsets.all(AppSpacing.lg),
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(8.0),
            border: Border.all(
              color: AppColors.dividerLight,
              width: 2.0,
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, size: 48.0, color: AppColors.textPrimary),
              SizedBox(height: AppSpacing.sm),
              Text(label, style: AppTextStyles.body2),
            ],
          ),
        ),
      ),
    );
  }
}
```

---

## 📊 특수 컴포넌트 (Special Components)

### 1. Progress Indicator (Step Counter)

```dart
// lib/presentation/widgets/progress_indicator.dart
class StepProgressIndicator extends StatelessWidget {
  final int currentStep;
  final int totalSteps;
  
  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: '$totalSteps단계 중 $currentStep단계',
      readOnly: true,
      child: Row(
        children: List.generate(totalSteps, (index) {
          final isActive = index < currentStep;
          final isCurrent = index == currentStep - 1;
          
          return Expanded(
            child: Container(
              height: 4.0,
              margin: EdgeInsets.symmetric(horizontal: 2.0),
              decoration: BoxDecoration(
                color: isActive 
                  ? AppColors.primary 
                  : AppColors.dividerLight,
                borderRadius: BorderRadius.circular(2.0),
              ),
            ),
          );
        }),
      ),
    );
  }
}
```

**사용 위치**: 온보딩, 다단계 플로우
**디자인**: 화면 상단에 배치, 4px 높이, 현재 단계까지 Primary 색상

### 2. Loading Overlay

```dart
// lib/presentation/widgets/loading_overlay.dart
class LoadingOverlay extends StatelessWidget {
  final String message;
  final double? progress; // null이면 indeterminate
  
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black54,
      child: Center(
        child: Card(
          margin: EdgeInsets.all(AppSpacing.xl),
          child: Padding(
            padding: EdgeInsets.all(AppSpacing.xl),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (progress == null)
                  CircularProgressIndicator()
                else
                  CircularProgressIndicator(value: progress),
                SizedBox(height: AppSpacing.lg),
                Text(message, style: AppTextStyles.body1),
                if (progress != null)
                  Text(
                    '${(progress! * 100).toInt()}%',
                    style: AppTextStyles.caption,
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
```

### 3. Success/Error Dialog

```dart
// lib/presentation/widgets/status_dialog.dart
class StatusDialog extends StatelessWidget {
  final bool isSuccess;
  final String message;
  final VoidCallback onConfirm;
  
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Padding(
        padding: EdgeInsets.all(AppSpacing.xl),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 80.0,
              height: 80.0,
              decoration: BoxDecoration(
                color: isSuccess 
                  ? AppColors.success 
                  : Colors.red,
                shape: BoxShape.circle,
              ),
              child: Icon(
                isSuccess ? Icons.check : Icons.close,
                size: 48.0,
                color: Colors.white,
              ),
            ),
            SizedBox(height: AppSpacing.lg),
            Text(
              message,
              style: AppTextStyles.headline2,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: AppSpacing.xl),
            PrimaryButton(
              label: '확인',
              semanticLabel: '확인',
              onPressed: onConfirm,
            ),
          ],
        ),
      ),
    );
  }
}
```

### 4. Card Component

```dart
// lib/presentation/widgets/info_card.dart
class InfoCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final Widget? icon;
  final VoidCallback? onTap;
  
  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: onTap != null,
      label: '$title, $subtitle',
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12.0),
        child: Container(
          padding: EdgeInsets.all(AppSpacing.lg),
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(12.0),
            border: Border.all(
              color: AppColors.dividerLight,
              width: 2.0,
            ),
          ),
          child: Row(
            children: [
              if (icon != null) ...[
                icon!,
                SizedBox(width: AppSpacing.md),
              ],
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: AppTextStyles.body1.copyWith(
                        color: AppColors.primary,
                      ),
                    ),
                    SizedBox(height: AppSpacing.xs),
                    Text(
                      subtitle,
                      style: AppTextStyles.caption,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
```

---

## ♿ 접근성 (Accessibility)

### Semantics 필수 적용

**모든 인터랙티브 요소에 적용**:
```dart
Semantics(
  label: '로그인 버튼', // TTS가 읽을 텍스트
  button: true,        // 버튼임을 명시
  enabled: isEnabled,  // 활성화 상태
  hint: '탭하여 로그인', // 추가 설명 (선택)
  child: YourWidget(),
)
```

### Semantics 적용 원칙

1. **버튼**: `button: true`, `label` 필수
2. **입력 필드**: `textField: true`, `label` 필수
3. **이미지**: `image: true`, `label`에 이미지 설명
4. **정보성 텍스트**: `readOnly: true`, 필요시 `label`
5. **링크**: `link: true`, `label`에 링크 제목

### 진동 피드백

```dart
// 버튼 탭 시
HapticFeedback.lightImpact();

// 중요한 액션 (녹음 시작 등)
HapticFeedback.mediumImpact();

// 매우 중요한 액션 (삭제, 제출 등)
HapticFeedback.heavyImpact();

// 선택 변경 (토글, 슬라이더)
HapticFeedback.selectionClick();
```

### TTS 통합

```dart
// lib/core/utils/tts_helper.dart
class TTSHelper {
  static Future<void> speak(String text) async {
    // flutter_tts 사용
    await flutterTts.speak(text);
  }
  
  static Future<void> speakWithDelay(String text, {int delayMs = 500}) async {
    await Future.delayed(Duration(milliseconds: delayMs));
    await speak(text);
  }
}

// 화면 진입 시 자동 안내
@override
void initState() {
  super.initState();
  WidgetsBinding.instance.addPostFrameCallback((_) {
    TTSHelper.speakWithDelay('로그인 화면입니다. 이메일과 비밀번호를 입력하세요.');
  });
}
```

---

## 📱 화면별 레이아웃 가이드

### 1. 로그인 화면 (Login Screen)

```
[Progress: ●○○○○○○○○]

                Aura
     시각장애인을 위한 미술관 가이드
     ━━━━━━━━━━━━━━━━━━━━━━━━━━

이메일
┌─────────────────────────────┐
│ example@email.com           │
└─────────────────────────────┘

비밀번호
┌─────────────────────────────┐
│ 비밀번호를 입력하세요        │
└─────────────────────────────┘


┌─────────────────────────────┐
│         로그인              │  [Primary]
└─────────────────────────────┘

┌─────────────────────────────┐
│       계정 만들기           │  [Secondary]
└─────────────────────────────┘

     비밀번호를 잊으셨나요?
```

### 2. 음성 입력 화면 (Voice Input)

```
[Progress: ●●○○○○○○○]

           관심사와 취미
     ━━━━━━━━━━━━━━━━━━━━━━━━━━


              ◉  [Mic Icon]
              
         버튼을 눌러 음성 입력


┌─────────────────────────────┐
│ 또는 직접 입력하세요        │
│                             │
│                             │
└─────────────────────────────┘


┌──────────┐  ┌──────────────┐
│  이전    │  │     다음     │
└──────────┘  └──────────────┘
```

### 3. 작품 검색 (Artwork Search)

```
          작품 찾기
     ━━━━━━━━━━━━━━━━━━━━━━━━━━


┌─────────────────────────────┐
│     📍 전시에서 찾기        │
└─────────────────────────────┘

┌─────────────────────────────┐
│     🔍 작품 검색            │
└─────────────────────────────┘

┌─────────────────────────────┐
│     📷 카메라 촬영          │
└─────────────────────────────┘
```

### 4. 성공 화면 (Success)

```
              ✓  [Check Icon]
              
           준비 완료!


┌─────────────────────────────┐
│  국립현대미술관              │
│                             │
│  로 뮤익                    │
│                             │
│  서울관                     │
└─────────────────────────────┘


┌─────────────────────────────┐
│     전시 작품 보기          │  [Primary]
└─────────────────────────────┘

┌─────────────────────────────┐
│    다른 방법으로 찾기       │  [Secondary]
└─────────────────────────────┘
```

---

## 🎬 애니메이션 가이드

### Duration
```dart
class AppAnimations {
  static const Duration fast = Duration(milliseconds: 150);
  static const Duration normal = Duration(milliseconds: 300);
  static const Duration slow = Duration(milliseconds: 500);
}
```

### Curves
```dart
// 대부분의 애니메이션
Curves.easeInOut

// 등장 애니메이션
Curves.easeOut

// 퇴장 애니메이션
Curves.easeIn

// 바운스 효과 (선택적)
Curves.elasticOut
```

### 적용 대상
- 화면 전환: `PageRoute` 기본 애니메이션
- 버튼 호버/탭: 색상/크기 변화 150ms
- 로딩 인디케이터: 회전 애니메이션
- 다이얼로그 등장: Scale + Fade 300ms

---

## 📐 반응형 가이드

### Breakpoints
```dart
class AppBreakpoints {
  static const double mobile = 600;
  static const double tablet = 900;
  static const double desktop = 1200;
}
```

### 적용 전략
```dart
// 현재는 모바일 우선 (Portrait)
// 향후 Tablet 지원 시 고려사항:
// - 더 넓은 패딩 적용
// - 2-column 레이아웃 가능
// - 더 큰 텍스트 크기
```

---

## ✅ 구현 체크리스트

### 각 화면 구현 시 필수 확인사항

- [ ] **Semantics 라벨**: 모든 버튼, 입력 필드에 적용
- [ ] **진동 피드백**: 버튼 탭 시 HapticFeedback
- [ ] **TTS 안내**: 화면 진입 시 주요 정보 자동 읽기
- [ ] **최소 터치 영역**: 48dp 이상
- [ ] **색상 대비**: 4.5:1 이상
- [ ] **텍스트 크기**: 최소 16px
- [ ] **로딩 상태**: 명확한 인디케이터 또는 메시지
- [ ] **에러 처리**: TTS로 에러 메시지 안내
- [ ] **키보드 처리**: TextField 포커스 시 화면 조정

---

## 🛠️ Claude Code 프롬프트 템플릿

### UI 구현 요청 시 사용할 프롬프트 구조

```
aura-frontend의 [화면명] 화면을 구현해줘.

파일: lib/presentation/screens/[경로]/[파일명].dart

**디자인 참조**: AURA_UI_DESIGN_GUIDELINE.md

**레이아웃**:
[화면 구조 설명]

**컬러**:
- Primary 버튼: AppColors.primary
- Secondary 버튼: AppColors.secondary
- 배경: AppColors.background

**접근성**:
- 모든 버튼에 Semantics 라벨 추가
- 버튼 탭 시 HapticFeedback.lightImpact()
- 화면 진입 시 TTS 안내: "[안내 메시지]"

**컴포넌트**:
- PrimaryButton, SecondaryButton 사용
- AppTextField 사용
- 간격은 AppSpacing 상수 사용

**API 연동**:
[API 정보]

**추가 요구사항**:
[구체적 요구사항]
```

---

## 📚 참고 자료

- **Flutter Accessibility**: https://docs.flutter.dev/accessibility-and-localization/accessibility
- **Material Design 3**: https://m3.material.io/
- **WCAG 2.1 Guidelines**: https://www.w3.org/WAI/WCAG21/quickref/
- **프로젝트 파일**: aurauiwireframe_*.jpg, AURA_FLUTTER_CLAUDE_CODE_STRATEGY.md

---

*이 가이드라인은 Aura 프로젝트의 모든 UI 구현에 적용됩니다.*
*최종 업데이트: 2025년 12월*