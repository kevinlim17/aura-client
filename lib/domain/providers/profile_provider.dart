import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/services/profile_service.dart';
import 'auth_provider.dart';

/// Profile service provider
final profileServiceProvider = Provider<ProfileService>((ref) {
  final baseUrl = ref.watch(baseUrlProvider);
  final httpClient = ref.watch(httpClientProvider);

  return ProfileService(baseUrl: baseUrl, client: httpClient);
});