import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../entities/home_state.dart';
import '../../data/services/link_service.dart';
import '../../data/services/memo_service.dart';
import 'home_notifier.dart';
import 'auth_provider.dart';

/// Link service provider
final linkServiceProvider = Provider<LinkService>((ref) {
  final baseUrl = ref.watch(baseUrlProvider);
  final httpClient = ref.watch(httpClientProvider);
  return LinkService(baseUrl: baseUrl, client: httpClient);
});

/// Memo service provider
final memoServiceProvider = Provider<MemoService>((ref) {
  final baseUrl = ref.watch(baseUrlProvider);
  final httpClient = ref.watch(httpClientProvider);
  return MemoService(baseUrl: baseUrl, client: httpClient);
});

/// Home state notifier provider
final homeProvider = StateNotifierProvider<HomeNotifier, HomeState>((ref) {
  final linkService = ref.watch(linkServiceProvider);
  final memoService = ref.watch(memoServiceProvider);
  final user = ref.watch(currentUserProvider);
  final token = ref.watch(currentTokenProvider);

  if (user == null || token == null) {
    throw StateError(
      'HomeProvider accessed without authentication.',
    );
  }

  return HomeNotifier(
    linkService: linkService,
    memoService: memoService,
    userId: user.id,
    token: token,
  );
});
