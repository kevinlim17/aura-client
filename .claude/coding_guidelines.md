# Aura Flutter - 코드 생성 규칙 및 가이드라인

## 📋 개요

이 문서는 Aura Flutter 프로젝트의 일관된 코드 생성을 위한 규칙, 패턴, 베스트 프랙티스를 정의합니다.

**최종 업데이트:** 2025-12-06
**프로젝트 버전:** 1.0.0

---

## 🎯 핵심 원칙

### 1. 레이어 분리 (Clean Architecture)
```
Presentation Layer (UI)
    ↓
Domain Layer (Business Logic)
    ↓
Data Layer (API & Models)
```

- **각 레이어는 독립적으로 테스트 가능해야 함**
- **상위 레이어는 하위 레이어에 의존 가능, 역은 불가**
- **Domain Layer는 외부 의존성 없음 (pure Dart)**

### 2. 타입 안전성 우선
- Enum 사용으로 컴파일 타임 안전성 확보
- Nullable 타입 명시적 선언 (`?` 사용)
- `dynamic` 사용 최소화

### 3. 불변성 (Immutability)
- 모든 Entity/Model은 `@freezed` 사용
- State는 불변 객체로 관리
- `copyWith()` 메소드로 상태 업데이트

---

## 📦 Entity & Model 생성 규칙

### Domain Entity (도메인 엔티티)

**위치:** `lib/domain/entities/`
**목적:** 비즈니스 로직에서 사용하는 순수 데이터 객체

```dart
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_entity.freezed.dart';
part 'user_entity.g.dart';

/// User entity for domain logic
@freezed
class UserEntity with _$UserEntity {
  const factory UserEntity({
    required String id,
    required String email,
    required String displayName,
    required bool isOnboardingCompleted,
    required bool requiresTts,
  }) = _UserEntity;

  factory UserEntity.fromJson(Map<String, dynamic> json) =>
      _$UserEntityFromJson(json);
}
```

**규칙:**
1. ✅ `@freezed` 어노테이션 필수
2. ✅ Part 파일 선언 (`.freezed.dart`, `.g.dart`)
3. ✅ 생성자는 `const factory` 사용
4. ✅ `fromJson()` 팩토리 메소드 제공
5. ✅ 필수 필드는 `required` 명시
6. ✅ Nullable 필드는 `?` 사용
7. ❌ 비즈니스 로직 포함 금지 (Extension으로 분리)

### Data Model (API 응답 모델)

**위치:** `lib/data/models/`
**목적:** API 응답을 파싱하고 Domain Entity로 변환

```dart
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/preferences_entity.dart';

part 'preferences_response.freezed.dart';
part 'preferences_response.g.dart';

/// Preferences response from API
@freezed
class PreferencesResponse with _$PreferencesResponse {
  const factory PreferencesResponse({
    required int id,
    required int userId,
    required String narrativeStyle,
    required String preferredLength,
    required double ttsSpeed,
    required double ttsPitch,
    required String ttsVoice,
    required String preferredLanguage,
    required bool enableHapticFeedback,
    required bool enableAudioDescriptions,
    required bool highContrastMode,
    required bool enablePushNotifications,
    required bool isVisuallyImpaired,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _PreferencesResponse;

  const PreferencesResponse._();

  factory PreferencesResponse.fromJson(Map<String, dynamic> json) =>
      _$PreferencesResponseFromJson(json);

  /// Convert to domain entity
  PreferencesEntity toEntity() {
    return PreferencesEntity(
      narrativeStyle: _parseNarrativeStyle(narrativeStyle),
      preferredLength: _parsePreferredLength(preferredLength),
      ttsSpeed: ttsSpeed,
      ttsPitch: ttsPitch,
      ttsVoice: _parseTtsVoice(ttsVoice),
      preferredLanguage: preferredLanguage,
      enableHapticFeedback: enableHapticFeedback,
      enableAudioDescriptions: enableAudioDescriptions,
      highContrastMode: highContrastMode,
      enablePushNotifications: enablePushNotifications,
    );
  }

  static NarrativeStyle _parseNarrativeStyle(String value) {
    switch (value.toUpperCase()) {
      case 'LITERARY': return NarrativeStyle.literary;
      case 'SCHOLARLY': return NarrativeStyle.scholarly;
      case 'CONVERSATIONAL': return NarrativeStyle.conversational;
      case 'POETIC': return NarrativeStyle.poetic;
      default: return NarrativeStyle.conversational;
    }
  }

  // ... 기타 파싱 메소드
}
```

**규칙:**
1. ✅ API 필드를 있는 그대로 매핑 (snake_case → camelCase 자동 변환)
2. ✅ `toEntity()` 메소드로 Domain Entity 변환
3. ✅ String → Enum 파싱 로직 포함
4. ✅ 서버 전용 필드 포함 (id, createdAt, updatedAt)
5. ✅ Private 생성자 `._()` 사용 (메소드 추가용)

### Enum 정의 규칙

```dart
/// Narrative style as defined by the API
enum NarrativeStyle {
  @JsonValue('LITERARY')
  literary, // 문학적 서사

  @JsonValue('SCHOLARLY')
  scholarly, // 학술적 맥락 중심

  @JsonValue('CONVERSATIONAL')
  conversational, // 대화형 서사

  @JsonValue('POETIC')
  poetic, // 시적 묘사 중심
}
```

**규칙:**
1. ✅ `@JsonValue()` 어노테이션으로 API 값 매핑
2. ✅ camelCase 네이밍
3. ✅ 주석으로 한글 설명 추가
4. ✅ API 명세와 정확히 일치해야 함

---

## 🔄 State Management (상태 관리)

### State 정의

**위치:** `lib/domain/entities/`
**네이밍:** `{feature}_state.dart`

```dart
import 'package:freezed_annotation/freezed_annotation.dart';
import 'preferences_entity.dart';

part 'preferences_state.freezed.dart';

/// Exception for preferences-related errors
class PreferencesException implements Exception {
  final String message;
  final String? code;

  PreferencesException(this.message, {this.code});

  @override
  String toString() =>
      'PreferencesException: $message${code != null ? ' ($code)' : ''}';
}

/// State for preferences management
@freezed
class PreferencesState with _$PreferencesState {
  const factory PreferencesState.initial() = PreferencesStateInitial;
  const factory PreferencesState.loading() = PreferencesStateLoading;
  const factory PreferencesState.loaded({
    required PreferencesEntity preferences,
  }) = PreferencesStateLoaded;
  const factory PreferencesState.error(PreferencesException error) =
      PreferencesStateError;
}

/// Extension for convenience methods
extension PreferencesStateX on PreferencesState {
  bool get isLoading => this is PreferencesStateLoading;
  bool get isLoaded => this is PreferencesStateLoaded;
  bool get hasError => this is PreferencesStateError;

  PreferencesEntity? get preferences => maybeWhen(
        loaded: (prefs) => prefs,
        orElse: () => null,
      );

  PreferencesException? get error => maybeWhen(
        error: (err) => err,
        orElse: () => null,
      );
}
```

**규칙:**
1. ✅ Union Type으로 상태 정의 (initial/loading/loaded/error)
2. ✅ Exception 클래스 별도 정의
3. ✅ Extension으로 편의 getter 제공
4. ✅ `maybeWhen()` 사용으로 null-safe 접근

### Notifier 구현

**위치:** `lib/domain/providers/`
**네이밍:** `{feature}_notifier.dart`

```dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../entities/preferences_entity.dart';
import '../entities/preferences_state.dart';
import '../../data/services/preferences_service.dart';
import '../../core/accessibility/tts_service.dart';

class PreferencesNotifier extends StateNotifier<PreferencesState> {
  final PreferencesService _preferencesService;
  final TtsService _ttsService;
  final String _userId;
  final String _token;

  PreferencesNotifier({
    required PreferencesService preferencesService,
    required TtsService ttsService,
    required String userId,
    required String token,
  })  : _preferencesService = preferencesService,
        _ttsService = ttsService,
        _userId = userId,
        _token = token,
        super(const PreferencesState.initial());

  /// Load preferences from API
  Future<void> loadPreferences() async {
    state = const PreferencesState.loading();

    try {
      final preferences = await _preferencesService.getPreferences(
        userId: _userId,
        token: _token,
      );
      state = PreferencesState.loaded(preferences: preferences);
      await _applyTtsSettings(preferences);
    } catch (e) {
      if (e is PreferencesException) {
        state = PreferencesState.error(e);
      } else {
        state = PreferencesState.error(
          PreferencesException('Failed to load preferences: ${e.toString()}'),
        );
      }
    }
  }

  // ... 기타 메소드
}
```

**규칙:**
1. ✅ `StateNotifier<T>` 상속
2. ✅ 생성자에서 초기 상태 설정
3. ✅ Private 필드는 `_` prefix
4. ✅ Public 메소드로 상태 변경 로직 제공
5. ✅ Try-catch로 에러 핸들링
6. ✅ 비동기 작업은 `Future<void>` 반환

### Provider 정의

**위치:** `lib/domain/providers/`
**네이밍:** `{feature}_provider.dart`

```dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../entities/preferences_state.dart';
import '../entities/preferences_entity.dart';
import '../../data/services/preferences_service.dart';
import 'preferences_notifier.dart';
import 'auth_provider.dart';

/// Preferences service provider
final preferencesServiceProvider = Provider<PreferencesService>((ref) {
  final baseUrl = ref.watch(baseUrlProvider);
  final httpClient = ref.watch(httpClientProvider);
  return PreferencesService(baseUrl: baseUrl, client: httpClient);
});

/// Preferences state notifier provider
final preferencesNotifierProvider =
    StateNotifierProvider<PreferencesNotifier, PreferencesState>((ref) {
  final preferencesService = ref.watch(preferencesServiceProvider);
  final ttsService = ref.watch(ttsServiceProvider);
  final user = ref.watch(currentUserProvider);
  final token = ref.watch(currentTokenProvider);

  if (user == null || token == null) {
    throw StateError(
      'PreferencesNotifierProvider accessed without authentication.',
    );
  }

  return PreferencesNotifier(
    preferencesService: preferencesService,
    ttsService: ttsService,
    userId: user.id,
    token: token,
  );
});

/// Convenient provider to get current preferences
final currentPreferencesProvider = Provider<PreferencesEntity?>((ref) {
  final preferencesState = ref.watch(preferencesNotifierProvider);
  return preferencesState.preferences;
});
```

**규칙:**
1. ✅ Provider는 `final` 상수로 정의
2. ✅ 의존성은 `ref.watch()`로 주입
3. ✅ 편의 Provider 추가 (getter용)
4. ✅ 에러 상황 명시적 처리 (`throw StateError`)

---

## 🌐 Service Layer (API 통신)

### Service 클래스 구조

**위치:** `lib/data/services/`
**네이밍:** `{feature}_service.dart`

```dart
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import '../../domain/entities/preferences_entity.dart';
import '../../domain/entities/preferences_state.dart';
import '../models/preferences_response.dart';

/// Preferences service for API calls
class PreferencesService {
  final String baseUrl;
  final http.Client client;

  PreferencesService({required this.baseUrl, http.Client? client})
      : client = client ?? http.Client();

  /// Get user preferences
  Future<PreferencesEntity> getPreferences({
    required String userId,
    required String token,
  }) async {
    final url = '$baseUrl/api/users/$userId/preferences';
    debugPrint('[PreferencesService] GET $url');

    try {
      final response = await client.get(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      debugPrint('[PreferencesService] Response status: ${response.statusCode}');
      debugPrint('[PreferencesService] Response body: ${response.body}');

      final responseData = jsonDecode(response.body) as Map<String, dynamic>;

      if (response.statusCode == 200 && responseData['success'] == true) {
        debugPrint('[PreferencesService] Get preferences successful');
        final apiResponse = PreferencesApiResponse.fromJson(responseData);
        return apiResponse.toEntity();
      } else {
        final error = responseData['error'] as Map<String, dynamic>?;
        final errorCode = error?['code'] as String?;
        final errorMessage =
            error?['message'] as String? ?? 'Failed to get preferences';
        debugPrint('[PreferencesService] Get preferences failed: $errorMessage ($errorCode)');
        throw PreferencesException(errorMessage, code: errorCode);
      }
    } catch (e) {
      if (e is PreferencesException) rethrow;
      debugPrint('[PreferencesService] Network error: $e');
      throw PreferencesException('Network error: ${e.toString()}',
          code: 'NETWORK_ERROR');
    }
  }

  // POST, PUT, DELETE 메소드...
}
```

**규칙:**
1. ✅ `debugPrint()`로 로깅 (프로덕션에서 자동 제거)
2. ✅ Service 이름을 로그 prefix로 사용
3. ✅ Try-catch로 에러 핸들링
4. ✅ Custom Exception으로 에러 전파
5. ✅ HTTP Client 주입 가능 (테스트 용이)
6. ✅ Response Model → Domain Entity 변환
7. ✅ Status code와 success 필드 모두 체크

### API 응답 구조

```dart
/// API response wrapper
@freezed
class PreferencesApiResponse with _$PreferencesApiResponse {
  const factory PreferencesApiResponse({
    required bool success,
    required PreferencesResponse data,
    String? message,
  }) = _PreferencesApiResponse;

  const PreferencesApiResponse._();

  factory PreferencesApiResponse.fromJson(Map<String, dynamic> json) =>
      _$PreferencesApiResponseFromJson(json);

  PreferencesEntity toEntity() => data.toEntity();
}
```

**규칙:**
1. ✅ API 응답 구조 그대로 매핑
2. ✅ `success`, `data`, `message` 필드
3. ✅ `toEntity()` 편의 메소드 제공

---

## 🎨 UI Layer (Presentation)

### Screen 구조

**위치:** `lib/presentation/screens/{feature}/`
**네이밍:** `{feature}_screen.dart`

```dart
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../domain/providers/preferences_provider.dart';
import '../../../domain/entities/preferences_entity.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/theme/app_spacing.dart';
import '../../widgets/primary_button.dart';

/// Preferences setup screen for onboarding
class PreferencesSetupScreen extends ConsumerStatefulWidget {
  const PreferencesSetupScreen({super.key});

  @override
  ConsumerState<PreferencesSetupScreen> createState() =>
      _PreferencesSetupScreenState();
}

class _PreferencesSetupScreenState
    extends ConsumerState<PreferencesSetupScreen> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final notifier = ref.read(preferencesNotifierProvider.notifier);
      notifier.initializeWithDefaults();

      final ttsService = ref.read(ttsServiceProvider);
      ttsService.speak('선호도 설정 화면입니다.');
    });
  }

  @override
  Widget build(BuildContext context) {
    final preferencesState = ref.watch(preferencesNotifierProvider);
    final preferences = preferencesState.preferences ??
        PreferencesEntity.defaults();
    final isLoading = preferencesState.isLoading;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text('선호도 설정', style: AppTypography.headline1),
        backgroundColor: AppColors.surface,
        elevation: 0,
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.all(AppSpacing.lg),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildSectionTitle('서사 스타일'),
                _buildNarrativeStyleSelector(preferences),
                // ... 기타 UI 요소
              ],
            ),
          ),
          if (isLoading) _buildLoadingOverlay(),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Semantics(
      header: true,
      child: Text(
        title,
        style: AppTypography.headline2.copyWith(
          color: AppColors.primary,
        ),
      ),
    );
  }

  // ... 기타 빌드 메소드
}
```

**규칙:**
1. ✅ `ConsumerStatefulWidget` / `ConsumerWidget` 사용
2. ✅ `ref.watch()` - UI 업데이트, `ref.read()` - 이벤트 핸들러
3. ✅ Design System 준수 (AppColors, AppTypography, AppSpacing)
4. ✅ `_build` prefix로 private 위젯 메소드 정의
5. ✅ `Semantics`로 접근성 지원
6. ✅ Loading state UI 분리
7. ✅ TTS 안내 제공

### Widget 컴포넌트

**위치:** `lib/presentation/widgets/`

```dart
import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_typography.dart';
import '../../core/theme/app_spacing.dart';

class PrimaryButton extends StatelessWidget {
  final String label;
  final String semanticLabel;
  final VoidCallback? onPressed;
  final bool isLoading;
  final IconData? icon;

  const PrimaryButton({
    super.key,
    required this.label,
    required this.semanticLabel,
    this.onPressed,
    this.isLoading = false,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      label: semanticLabel,
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: AppColors.textOnPrimary,
          minimumSize: const Size(double.infinity, 56),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        child: isLoading
            ? const SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(
                  color: AppColors.textOnPrimary,
                  strokeWidth: 2,
                ),
              )
            : Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (icon != null) ...[
                    Icon(icon),
                    const SizedBox(width: AppSpacing.sm),
                  ],
                  Text(label, style: AppTypography.button),
                ],
              ),
      ),
    );
  }
}
```

**규칙:**
1. ✅ `Semantics` 위젯으로 래핑
2. ✅ `semanticLabel` 별도 제공
3. ✅ Loading state 지원
4. ✅ Design System 일관성
5. ✅ 명확한 네이밍 (Primary/Secondary/Tertiary)

---

## 🎨 Design System 적용

### 색상 (AppColors)

```dart
class AppColors {
  // Primary Colors
  static const Color primary = Color(0xFF6366F1);
  static const Color primaryDark = Color(0xFF4F46E5);

  // Background
  static const Color background = Color(0xFFF9FAFB);
  static const Color surface = Color(0xFFFFFFFF);

  // Text
  static const Color textPrimary = Color(0xFF111827);
  static const Color textSecondary = Color(0xFF6B7280);
  static const Color textOnPrimary = Color(0xFFFFFFFF);

  // Divider
  static const Color dividerLight = Color(0xFFE5E7EB);

  // High Contrast Mode
  static const Color highContrastText = Color(0xFF000000);
  static const Color highContrastBackground = Color(0xFFFFFFFF);
}
```

### 타이포그래피 (AppTypography)

```dart
class AppTypography {
  static const TextStyle headline1 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    height: 1.3,
  );

  static const TextStyle headline2 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    height: 1.4,
  );

  static const TextStyle body1 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    height: 1.5,
  );

  static const TextStyle body2 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    height: 1.5,
  );

  static const TextStyle caption = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.normal,
    height: 1.4,
  );

  static const TextStyle button = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    height: 1.2,
  );
}
```

### 간격 (AppSpacing)

```dart
class AppSpacing {
  static const double xs = 4.0;
  static const double sm = 8.0;
  static const double md = 16.0;
  static const double lg = 24.0;
  static const double xl = 32.0;
  static const double xxl = 48.0;
}
```

### Border Radius

- **버튼/선택 UI**: 8.0px
- **카드/컨테이너**: 12.0px

### Border Width

- **표준**: 2.0px

---

## ♿ 접근성 (Accessibility)

### 기본 원칙

1. ✅ 모든 interactive 요소에 `Semantics` 적용
2. ✅ `semanticLabel` 명시적 제공
3. ✅ TTS 안내 제공 (화면 진입, 상태 변경)
4. ✅ 햅틱 피드백 제공
5. ✅ 고대비 모드 지원

### TTS 사용 예시

```dart
// 화면 진입 시
final ttsService = ref.read(ttsServiceProvider);
ttsService.speak('선호도 설정 화면입니다. 서사 스타일, 음성 설정, 접근성 옵션을 설정할 수 있습니다.');

// 상태 변경 시
await ttsService.speak('음성을 ${voiceDescription}로 변경했습니다.');

// 에러 발생 시
await ttsService.speak('설정 저장에 실패했습니다. 다시 시도해주세요.');
```

### Semantics 예시

```dart
Semantics(
  button: true,
  label: '미리듣기 - 현재 설정된 음성으로 샘플 재생',
  child: ElevatedButton(...),
)

Semantics(
  header: true,
  child: Text('서사 스타일'),
)
```

---

## 🧪 테스트 규칙

### Unit Test

```dart
void main() {
  group('PreferencesEntity', () {
    test('should create entity with defaults', () {
      final prefs = PreferencesEntity.defaults();

      expect(prefs.narrativeStyle, NarrativeStyle.conversational);
      expect(prefs.ttsSpeed, 0.5);
      expect(prefs.enableHapticFeedback, true);
    });

    test('should convert to JSON correctly', () {
      final prefs = PreferencesEntity.defaults();
      final json = prefs.toJson();

      expect(json['narrativeStyle'], 'CONVERSATIONAL');
      expect(json['ttsSpeed'], 0.5);
    });
  });
}
```

### Widget Test

```dart
void main() {
  testWidgets('PrimaryButton should show loading state', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: PrimaryButton(
            label: 'Test',
            semanticLabel: 'Test button',
            isLoading: true,
            onPressed: () {},
          ),
        ),
      ),
    );

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
    expect(find.text('Test'), findsNothing);
  });
}
```

---

## 🔧 코드 생성 명령어

### build_runner 실행

```bash
# 코드 생성
flutter pub run build_runner build --delete-conflicting-outputs

# Watch 모드 (개발 중)
flutter pub run build_runner watch --delete-conflicting-outputs
```

### 분석

```bash
# 특정 파일 분석
flutter analyze lib/domain/entities/preferences_entity.dart

# 전체 프로젝트 분석
flutter analyze
```

---

## 📝 네이밍 컨벤션

### 파일명
- `snake_case.dart`
- 기능별 prefix 사용: `{feature}_{type}.dart`
  - `preferences_entity.dart`
  - `preferences_state.dart`
  - `preferences_notifier.dart`
  - `preferences_provider.dart`
  - `preferences_service.dart`
  - `preferences_response.dart`

### 클래스명
- `PascalCase`
- 기능 + 역할: `PreferencesNotifier`, `PreferencesService`

### 변수/메소드명
- `camelCase`
- Private: `_` prefix (`_userId`, `_applySettings`)

### 상수
- `lowerCamelCase` (일반 상수)
- `UPPER_SNAKE_CASE` (환경 변수)

---

## ❌ 피해야 할 패턴

1. ❌ `dynamic` 타입 남발
2. ❌ Stateful Widget에서 직접 API 호출
3. ❌ UI 로직과 비즈니스 로직 혼재
4. ❌ Magic Number/String 사용
5. ❌ 불필요한 `setState()` 호출
6. ❌ Exception을 무시하거나 일반 Exception만 사용
7. ❌ 접근성 미고려 (Semantics 누락)
8. ❌ 하드코딩된 색상/폰트 크기
9. ❌ Provider 없이 전역 변수 사용
10. ❌ `BuildContext` 비동기 작업 후 사용 (`mounted` 체크 필수)

---

## ✅ 체크리스트

새로운 기능 구현 시 다음을 확인하세요:

### Entity/Model
- [ ] `@freezed` 사용
- [ ] Part 파일 선언
- [ ] `fromJson()` / `toJson()` 구현
- [ ] Enum에 `@JsonValue()` 사용
- [ ] Response Model → Entity 변환 메소드

### State Management
- [ ] Union Type State 정의
- [ ] Exception 클래스 정의
- [ ] Notifier 구현
- [ ] Provider 등록
- [ ] 편의 Provider 추가

### Service Layer
- [ ] HTTP Client 주입 가능
- [ ] `debugPrint()` 로깅
- [ ] Try-catch 에러 핸들링
- [ ] Custom Exception 사용
- [ ] Response → Entity 변환

### UI Layer
- [ ] Design System 준수
- [ ] `Semantics` 적용
- [ ] TTS 안내 제공
- [ ] 햅틱 피드백 (옵션)
- [ ] Loading State 처리
- [ ] 에러 State 처리
- [ ] `mounted` 체크 (비동기 후)

### 테스트
- [ ] Unit Test 작성
- [ ] Widget Test 작성 (주요 UI)
- [ ] build_runner 실행
- [ ] flutter analyze 통과

---

## 📚 참고 문서

- [Freezed 공식 문서](https://pub.dev/packages/freezed)
- [Riverpod 공식 문서](https://riverpod.dev/)
- [Flutter Accessibility](https://docs.flutter.dev/development/accessibility-and-localization/accessibility)
- [Clean Architecture in Flutter](https://resocoder.com/flutter-clean-architecture-tdd/)

---

**최종 업데이트:** 2025-12-06
**담당자:** Claude Code Sonnet 4.5
