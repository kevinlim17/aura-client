# Aura Flutter - 아키텍처 패턴 및 전략

## 📋 개요

이 문서는 Aura Flutter 프로젝트의 아키텍처 패턴, 레이어 구조, 의존성 관리 전략을 정의합니다.

**최종 업데이트:** 2025-12-06
**아키텍처 스타일:** Clean Architecture + Feature-First

---

## 🏗️ 전체 아키텍처

```
┌─────────────────────────────────────────────────────────┐
│                    Presentation Layer                    │
│  ┌──────────────┐  ┌──────────────┐  ┌──────────────┐  │
│  │   Screens    │  │   Widgets    │  │  Controllers │  │
│  └──────────────┘  └──────────────┘  └──────────────┘  │
└─────────────────────────────────────────────────────────┘
                          ↓ uses
┌─────────────────────────────────────────────────────────┐
│                     Domain Layer                         │
│  ┌──────────────┐  ┌──────────────┐  ┌──────────────┐  │
│  │   Entities   │  │  Providers   │  │   Notifiers  │  │
│  └──────────────┘  └──────────────┘  └──────────────┘  │
│  ┌──────────────┐  ┌──────────────┐                    │
│  │    States    │  │   UseCases   │   (Pure Dart)     │
│  └──────────────┘  └──────────────┘                    │
└─────────────────────────────────────────────────────────┘
                          ↓ uses
┌─────────────────────────────────────────────────────────┐
│                      Data Layer                          │
│  ┌──────────────┐  ┌──────────────┐  ┌──────────────┐  │
│  │   Services   │  │  Repositories│  │    Models    │  │
│  └──────────────┘  └──────────────┘  └──────────────┘  │
│  ┌──────────────┐  ┌──────────────┐                    │
│  │ Data Sources │  │    Cache     │                    │
│  └──────────────┘  └──────────────┘                    │
└─────────────────────────────────────────────────────────┘
                          ↓ uses
┌─────────────────────────────────────────────────────────┐
│                     External Layer                       │
│  ┌──────────────┐  ┌──────────────┐  ┌──────────────┐  │
│  │  REST API    │  │  Local DB    │  │   Platform   │  │
│  └──────────────┘  └──────────────┘  └──────────────┘  │
└─────────────────────────────────────────────────────────┘
```

---

## 📂 디렉토리 구조

```
lib/
├── main.dart                          # App Entry Point
├── app.dart                           # Root Widget
│
├── core/                              # 공통 핵심 기능
│   ├── constants/
│   │   ├── api_constants.dart        # API 엔드포인트, 상수
│   │   └── app_constants.dart        # 앱 전역 상수
│   ├── theme/
│   │   ├── app_theme.dart            # Theme 설정
│   │   ├── app_colors.dart           # 색상 정의
│   │   ├── app_typography.dart       # 타이포그래피
│   │   └── app_spacing.dart          # 간격 상수
│   ├── accessibility/
│   │   ├── tts_service.dart          # TTS 서비스
│   │   └── haptic_service.dart       # 햅틱 피드백
│   └── utils/
│       ├── storage_service.dart      # 로컬 저장소
│       └── logger.dart               # 로깅 유틸
│
├── data/                              # Data Layer
│   ├── models/                        # API Response Models
│   │   ├── user_response.dart
│   │   ├── preferences_response.dart
│   │   └── ...
│   ├── services/                      # API Services
│   │   ├── auth_service.dart
│   │   ├── preferences_service.dart
│   │   └── ...
│   └── repositories/                  # Data Repositories
│       ├── auth_repository.dart
│       └── ...
│
├── domain/                            # Domain Layer (Pure Dart)
│   ├── entities/                      # Business Entities
│   │   ├── user_entity.dart
│   │   ├── preferences_entity.dart
│   │   ├── user_state.dart
│   │   ├── preferences_state.dart
│   │   └── ...
│   ├── providers/                     # Riverpod Providers
│   │   ├── auth_provider.dart
│   │   ├── auth_notifier.dart
│   │   ├── preferences_provider.dart
│   │   ├── preferences_notifier.dart
│   │   └── ...
│   └── usecases/                      # Use Cases (Optional)
│       ├── login_usecase.dart
│       └── ...
│
└── presentation/                      # Presentation Layer
    ├── screens/                       # Feature Screens
    │   ├── auth/
    │   │   ├── login_screen.dart
    │   │   └── register_screen.dart
    │   ├── onboarding/
    │   │   ├── profile_setup_screen.dart
    │   │   ├── context_setup_screen.dart
    │   │   └── preferences_setup_screen.dart
    │   └── ...
    └── widgets/                       # Reusable Widgets
        ├── primary_button.dart
        ├── secondary_button.dart
        └── ...
```

---

## 🎯 레이어별 책임

### Presentation Layer

**책임:**
- UI 렌더링
- 사용자 입력 처리
- 화면 네비게이션
- 상태 구독 및 UI 업데이트

**규칙:**
- ✅ Domain Layer의 Provider만 사용
- ✅ Business Logic 포함 금지
- ✅ Widget은 재사용 가능하게 설계
- ❌ Data Layer 직접 접근 금지
- ❌ API 호출 직접 수행 금지

**예시:**
```dart
class PreferencesSetupScreen extends ConsumerStatefulWidget {
  @override
  ConsumerState<PreferencesSetupScreen> createState() =>
      _PreferencesSetupScreenState();
}

class _PreferencesSetupScreenState
    extends ConsumerState<PreferencesSetupScreen> {
  @override
  Widget build(BuildContext context) {
    // ✅ Provider를 통한 상태 구독
    final preferencesState = ref.watch(preferencesNotifierProvider);

    // ✅ UI 렌더링만 담당
    return Scaffold(
      body: preferencesState.when(
        initial: () => _buildInitial(),
        loading: () => _buildLoading(),
        loaded: (prefs) => _buildContent(prefs),
        error: (error) => _buildError(error),
      ),
    );
  }

  void _handleSave() {
    // ✅ Notifier를 통한 비즈니스 로직 호출
    ref.read(preferencesNotifierProvider.notifier).savePreferences();
  }
}
```

---

### Domain Layer

**책임:**
- 비즈니스 로직
- 상태 관리
- Entity 정의
- Use Case 구현

**규칙:**
- ✅ Pure Dart (Flutter 의존성 최소화)
- ✅ Entity는 불변 객체 (`@freezed`)
- ✅ State는 Union Type
- ✅ Notifier에서 비즈니스 로직 처리
- ❌ UI 로직 포함 금지
- ❌ 외부 패키지 의존성 최소화

**예시:**
```dart
// Entity
@freezed
class PreferencesEntity with _$PreferencesEntity {
  const factory PreferencesEntity({
    required NarrativeStyle narrativeStyle,
    required double ttsSpeed,
    // ...
  }) = _PreferencesEntity;
}

// State
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

// Notifier (Business Logic)
class PreferencesNotifier extends StateNotifier<PreferencesState> {
  final PreferencesService _service;

  PreferencesNotifier({required PreferencesService service})
      : _service = service,
        super(const PreferencesState.initial());

  Future<void> loadPreferences() async {
    state = const PreferencesState.loading();
    try {
      final prefs = await _service.getPreferences();
      state = PreferencesState.loaded(preferences: prefs);
    } catch (e) {
      state = PreferencesState.error(PreferencesException(e.toString()));
    }
  }
}

// Provider
final preferencesNotifierProvider =
    StateNotifierProvider<PreferencesNotifier, PreferencesState>((ref) {
  final service = ref.watch(preferencesServiceProvider);
  return PreferencesNotifier(service: service);
});
```

---

### Data Layer

**책임:**
- API 통신
- 데이터 캐싱
- Response → Entity 변환
- 에러 핸들링

**규칙:**
- ✅ Response Model은 API 구조 그대로
- ✅ `toEntity()` 메소드로 변환
- ✅ Exception은 Domain Exception으로 변환
- ✅ Repository 패턴 사용 (캐싱 필요 시)
- ❌ Business Logic 포함 금지
- ❌ UI 로직 포함 금지

**예시:**
```dart
// Response Model
@freezed
class PreferencesResponse with _$PreferencesResponse {
  const factory PreferencesResponse({
    required int id,
    required String narrativeStyle,
    // ... API 필드
  }) = _PreferencesResponse;

  const PreferencesResponse._();

  factory PreferencesResponse.fromJson(Map<String, dynamic> json) =>
      _$PreferencesResponseFromJson(json);

  // ✅ Entity 변환
  PreferencesEntity toEntity() {
    return PreferencesEntity(
      narrativeStyle: _parseNarrativeStyle(narrativeStyle),
      // ...
    );
  }
}

// Service
class PreferencesService {
  final http.Client client;
  final String baseUrl;

  Future<PreferencesEntity> getPreferences({
    required String userId,
    required String token,
  }) async {
    try {
      final response = await client.get(
        Uri.parse('$baseUrl/api/users/$userId/preferences'),
        headers: {'Authorization': 'Bearer $token'},
      );

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        final apiResponse = PreferencesApiResponse.fromJson(json);
        return apiResponse.toEntity();
      } else {
        throw PreferencesException('Failed to load preferences');
      }
    } catch (e) {
      throw PreferencesException('Network error: ${e.toString()}');
    }
  }
}
```

---

## 🔄 데이터 흐름

### Read Flow (데이터 읽기)

```
1. UI (Screen)
   └─> ref.watch(preferencesNotifierProvider)
       └─> Notifier.loadPreferences()
           └─> Service.getPreferences()
               └─> HTTP Client (API Call)
                   └─> Response Model
                       └─> toEntity()
                           └─> Entity
                               └─> State Update
                                   └─> UI Rebuild
```

### Write Flow (데이터 쓰기)

```
1. UI (Button onPressed)
   └─> ref.read(notifier).savePreferences()
       └─> Notifier.savePreferences()
           └─> Service.updatePreferences()
               └─> HTTP Client (API Call)
                   └─> Response Model
                       └─> toEntity()
                           └─> Entity
                               └─> State Update
                                   └─> UI Rebuild
```

---

## 🧩 의존성 주입 (Dependency Injection)

### Riverpod Provider 계층

```dart
// Core Services (Singleton)
final httpClientProvider = Provider<http.Client>((ref) {
  return http.Client();
});

final storageServiceProvider = Provider<StorageService>((ref) {
  return StorageService();
});

final ttsServiceProvider = Provider<TtsService>((ref) {
  return TtsService();
});

// Data Layer
final preferencesServiceProvider = Provider<PreferencesService>((ref) {
  final baseUrl = ref.watch(baseUrlProvider);
  final client = ref.watch(httpClientProvider);
  return PreferencesService(baseUrl: baseUrl, client: client);
});

// Domain Layer
final preferencesNotifierProvider =
    StateNotifierProvider<PreferencesNotifier, PreferencesState>((ref) {
  final service = ref.watch(preferencesServiceProvider);
  final tts = ref.watch(ttsServiceProvider);
  return PreferencesNotifier(service: service, ttsService: tts);
});

// Convenience Providers
final currentPreferencesProvider = Provider<PreferencesEntity?>((ref) {
  return ref.watch(preferencesNotifierProvider).preferences;
});
```

**규칙:**
1. ✅ Core 서비스는 Singleton (`Provider`)
2. ✅ Stateful 로직은 `StateNotifierProvider`
3. ✅ 읽기 전용 계산은 `Provider`
4. ✅ 의존성은 `ref.watch()`로 주입
5. ✅ 테스트 시 `overrideWithValue()` 사용 가능

---

## 🔐 인증 흐름

### Authentication State

```dart
@freezed
class AuthState with _$AuthState {
  const factory AuthState.initial() = AuthStateInitial;
  const factory AuthState.loading() = AuthStateLoading;
  const factory AuthState.authenticated({
    required UserEntity user,
    required String accessToken,
  }) = AuthStateAuthenticated;
  const factory AuthState.unauthenticated() = AuthStateUnauthenticated;
  const factory AuthState.error(String message) = AuthStateError;
}
```

### Auth Flow

```
1. Login Screen
   └─> AuthNotifier.login(email, password)
       └─> AuthService.login()
           └─> API: POST /api/auth/login
               └─> Token + User
                   └─> StorageService.saveToken()
                   └─> State: Authenticated
                       └─> Navigate to Home/Onboarding
```

### Token Management

```dart
class AuthNotifier extends StateNotifier<AuthState> {
  final AuthService _authService;
  final StorageService _storage;

  Future<void> login(String email, String password) async {
    state = const AuthState.loading();

    try {
      final result = await _authService.login(email, password);

      // 토큰 저장
      await _storage.saveToken(result.accessToken);
      await _storage.saveRefreshToken(result.refreshToken);

      state = AuthState.authenticated(
        user: result.user,
        accessToken: result.accessToken,
      );
    } catch (e) {
      state = AuthState.error(e.toString());
    }
  }

  Future<void> logout() async {
    await _storage.clearTokens();
    state = const AuthState.unauthenticated();
  }

  Future<void> refreshToken() async {
    final refreshToken = await _storage.getRefreshToken();
    if (refreshToken == null) {
      state = const AuthState.unauthenticated();
      return;
    }

    try {
      final result = await _authService.refreshToken(refreshToken);
      await _storage.saveToken(result.accessToken);

      final user = state.maybeWhen(
        authenticated: (user, _) => user,
        orElse: () => null,
      );

      if (user != null) {
        state = AuthState.authenticated(
          user: user,
          accessToken: result.accessToken,
        );
      }
    } catch (e) {
      state = const AuthState.unauthenticated();
    }
  }
}
```

---

## 🎭 상태 관리 패턴

### Union Type State

**장점:**
- 타입 안전한 상태 전환
- 모든 케이스 강제 처리 (`when()`)
- 명확한 상태 정의

```dart
@freezed
class MyState with _$MyState {
  const factory MyState.initial() = _Initial;
  const factory MyState.loading() = _Loading;
  const factory MyState.data(MyData data) = _Data;
  const factory MyState.error(String message) = _Error;
}

// UI에서 사용
state.when(
  initial: () => Text('초기 상태'),
  loading: () => CircularProgressIndicator(),
  data: (data) => Text(data.toString()),
  error: (msg) => Text('에러: $msg'),
);
```

### Loading States

```dart
// ✅ 좋은 예: 세분화된 로딩 상태
@freezed
class DataState with _$DataState {
  const factory DataState.initial() = _Initial;
  const factory DataState.loading() = _Loading;
  const factory DataState.refreshing(MyData currentData) = _Refreshing;
  const factory DataState.loaded(MyData data) = _Loaded;
  const factory DataState.error(String message) = _Error;
}

// ❌ 나쁜 예: boolean 플래그
class BadState {
  final MyData? data;
  final bool isLoading;
  final String? error;
}
```

### Optimistic Updates

```dart
Future<void> updatePreference(PreferencesEntity newPrefs) async {
  // 1. 즉시 UI 업데이트 (Optimistic)
  state = PreferencesState.loaded(preferences: newPrefs);

  try {
    // 2. API 호출
    final updated = await _service.updatePreferences(newPrefs);

    // 3. 서버 응답으로 확정
    state = PreferencesState.loaded(preferences: updated);
  } catch (e) {
    // 4. 실패 시 롤백 또는 에러 표시
    state = PreferencesState.error(PreferencesException(e.toString()));
  }
}
```

---

## 🚀 성능 최적화

### Provider 최적화

```dart
// ❌ 나쁜 예: 전체 State 구독
Widget build(BuildContext context, WidgetRef ref) {
  final state = ref.watch(myNotifierProvider);
  return Text(state.data?.name ?? '');
}

// ✅ 좋은 예: 필요한 부분만 구독
Widget build(BuildContext context, WidgetRef ref) {
  final name = ref.watch(
    myNotifierProvider.select((state) => state.data?.name),
  );
  return Text(name ?? '');
}
```

### Widget 재사용

```dart
// ✅ StatelessWidget으로 분리
class UserAvatar extends StatelessWidget {
  final String name;
  final String imageUrl;

  const UserAvatar({
    required this.name,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundImage: NetworkImage(imageUrl),
      child: Text(name[0]),
    );
  }
}
```

### 메모이제이션

```dart
// Riverpod의 자동 메모이제이션
final expensiveComputationProvider = Provider<int>((ref) {
  final data = ref.watch(dataProvider);

  // 이 계산은 data가 변경될 때만 실행됨
  return _computeExpensiveValue(data);
});
```

---

## 🧪 테스트 전략

### Unit Test (Domain Layer)

```dart
void main() {
  group('PreferencesNotifier', () {
    late MockPreferencesService mockService;
    late PreferencesNotifier notifier;

    setUp(() {
      mockService = MockPreferencesService();
      notifier = PreferencesNotifier(service: mockService);
    });

    test('should emit loading then loaded state', () async {
      // Arrange
      final prefs = PreferencesEntity.defaults();
      when(mockService.getPreferences()).thenAnswer((_) async => prefs);

      // Act
      await notifier.loadPreferences();

      // Assert
      expect(notifier.state, isA<PreferencesStateLoaded>());
    });
  });
}
```

### Widget Test (Presentation Layer)

```dart
void main() {
  testWidgets('should show preferences when loaded', (tester) async {
    final container = ProviderContainer(
      overrides: [
        preferencesNotifierProvider.overrideWith(
          (ref) => MockPreferencesNotifier(),
        ),
      ],
    );

    await tester.pumpWidget(
      UncontrolledProviderScope(
        container: container,
        child: MaterialApp(
          home: PreferencesSetupScreen(),
        ),
      ),
    );

    expect(find.text('선호도 설정'), findsOneWidget);
  });
}
```

### Integration Test

```dart
void main() {
  testWidgets('complete onboarding flow', (tester) async {
    await tester.pumpWidget(MyApp());

    // 1. Login
    await tester.enterText(find.byKey(Key('email')), 'test@example.com');
    await tester.enterText(find.byKey(Key('password')), 'password');
    await tester.tap(find.text('로그인'));
    await tester.pumpAndSettle();

    // 2. Profile Setup
    await tester.enterText(find.byKey(Key('displayName')), 'Test User');
    await tester.tap(find.text('다음'));
    await tester.pumpAndSettle();

    // 3. Preferences Setup
    await tester.tap(find.text('감정적 공감 중심'));
    await tester.tap(find.text('저장하고 계속'));
    await tester.pumpAndSettle();

    // Verify onboarding completed
    expect(find.text('환영합니다'), findsOneWidget);
  });
}
```

---

## 📝 베스트 프랙티스 요약

### DO ✅

1. **단일 책임 원칙**
   - 각 클래스는 하나의 책임만
   - Service는 API 호출만
   - Notifier는 비즈니스 로직만
   - Widget은 UI만

2. **불변성**
   - Entity는 `@freezed`
   - State는 불변 객체
   - `copyWith()`로 업데이트

3. **타입 안전성**
   - Enum 사용
   - Nullable 명시
   - `dynamic` 최소화

4. **에러 핸들링**
   - Custom Exception
   - Union Type State
   - 사용자 친화적 메시지

5. **접근성**
   - Semantics 적용
   - TTS 지원
   - 고대비 모드

### DON'T ❌

1. **레이어 위반**
   - UI에서 직접 API 호출
   - Service에 비즈니스 로직
   - Domain에 UI 로직

2. **전역 상태**
   - Singleton (Provider 제외)
   - Static 변수
   - Global 변수

3. **암묵적 의존성**
   - Hard-coded URL
   - Magic Number
   - Context 무분별 사용

4. **성능 저해**
   - 불필요한 rebuild
   - 큰 Widget tree
   - 동기 I/O

---

**최종 업데이트:** 2025-12-06
**담당자:** Claude Code Sonnet 4.5
