import 'package:freezed_annotation/freezed_annotation.dart';

part 'artwork_entity.freezed.dart';
part 'artwork_entity.g.dart';

/// Artwork entity for domain logic
@freezed
class ArtworkEntity with _$ArtworkEntity {
  const factory ArtworkEntity({
    required int id,
    required String title,
    String? titleEn,
    String? artist,
    String? artistEn,
    String? artworkType,
    String? genre,
    String? creationYear,
    String? creationPeriod,
    String? medium,
    String? dimensions,
    String? museum,
    String? museumEn,
    String? museumLocation,
    String? currentLocation,
    @Default('') String imageUrl,
    String? thumbnailUrl,
    String? highResUrl,
    String? description,
    String? historicalContext,
    @Default({}) Map<String, dynamic> metadata,
    String? wikipediaUrl,
    String? museumWebsiteUrl,
    @Default(0) int viewCount,
    @Default(0) int docentGenerationCount,
    double? averageRating,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _ArtworkEntity;

  const ArtworkEntity._();

  factory ArtworkEntity.fromJson(Map<String, dynamic> json) =>
      _$ArtworkEntityFromJson(json);

  /// Get display title (prefer Korean, fallback to English)
  String get displayTitle => title.isNotEmpty ? title : (titleEn ?? '제목 없음');

  /// Get display artist name (prefer Korean, fallback to English)
  String get displayArtist => artist ?? artistEn ?? '작가 미상';

  /// Get display museum name (prefer Korean, fallback to English)
  String get displayMuseum => museum ?? museumEn ?? '';

  /// Get thumbnail or main image URL
  String get displayImageUrl => thumbnailUrl ?? imageUrl;

  /// Get short description for TTS (first 100 characters)
  String get shortDescription {
    if (description == null || description!.isEmpty) {
      return '$displayTitle, $displayArtist 작품';
    }
    if (description!.length <= 100) {
      return description!;
    }
    return '${description!.substring(0, 100)}...';
  }

  /// Get TTS-friendly summary
  String get ttsSummary {
    final parts = <String>[];
    parts.add(displayTitle);
    parts.add(displayArtist);
    if (creationYear != null) {
      parts.add('$creationYear년 작');
    } else if (creationPeriod != null) {
      parts.add(creationPeriod!);
    }
    if (displayMuseum.isNotEmpty) {
      parts.add('소장처: $displayMuseum');
    }
    return parts.join(', ');
  }
}