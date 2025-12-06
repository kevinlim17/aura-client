import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/artwork_entity.dart';
import '../../domain/entities/search_state.dart';

part 'search_response.freezed.dart';
part 'search_response.g.dart';

/// Artwork response from API
@freezed
class ArtworkResponse with _$ArtworkResponse {
  const factory ArtworkResponse({
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
  }) = _ArtworkResponse;

  const ArtworkResponse._();

  factory ArtworkResponse.fromJson(Map<String, dynamic> json) =>
      _$ArtworkResponseFromJson(json);

  /// Convert to domain entity
  ArtworkEntity toEntity() {
    return ArtworkEntity(
      id: id,
      title: title,
      titleEn: titleEn,
      artist: artist,
      artistEn: artistEn,
      artworkType: artworkType,
      genre: genre,
      creationYear: creationYear,
      creationPeriod: creationPeriod,
      medium: medium,
      dimensions: dimensions,
      museum: museum,
      museumEn: museumEn,
      museumLocation: museumLocation,
      currentLocation: currentLocation,
      imageUrl: imageUrl,
      thumbnailUrl: thumbnailUrl,
      highResUrl: highResUrl,
      description: description,
      historicalContext: historicalContext,
      metadata: metadata,
      wikipediaUrl: wikipediaUrl,
      museumWebsiteUrl: museumWebsiteUrl,
      viewCount: viewCount,
      docentGenerationCount: docentGenerationCount,
      averageRating: averageRating,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }
}

/// Search result item response from API
@freezed
class SearchResultResponse with _$SearchResultResponse {
  const factory SearchResultResponse({
    required ArtworkResponse artwork,
    required double relevanceScore,
  }) = _SearchResultResponse;

  const SearchResultResponse._();

  factory SearchResultResponse.fromJson(Map<String, dynamic> json) =>
      _$SearchResultResponseFromJson(json);

  /// Convert to domain entity
  SearchResultEntity toEntity() {
    return SearchResultEntity(
      artwork: artwork.toEntity(),
      relevanceScore: relevanceScore,
    );
  }
}

/// Pagination response from API
@freezed
class PaginationResponse with _$PaginationResponse {
  const factory PaginationResponse({
    required int page,
    required int limit,
    required int totalCount,
    required int totalPages,
    required bool hasNext,
    required bool hasPrevious,
  }) = _PaginationResponse;

  const PaginationResponse._();

  factory PaginationResponse.fromJson(Map<String, dynamic> json) =>
      _$PaginationResponseFromJson(json);

  /// Convert to domain entity
  SearchPagination toEntity() {
    return SearchPagination(
      page: page,
      limit: limit,
      totalCount: totalCount,
      totalPages: totalPages,
      hasNext: hasNext,
      hasPrevious: hasPrevious,
    );
  }
}

/// Search data response from API
@freezed
class SearchDataResponse with _$SearchDataResponse {
  const factory SearchDataResponse({
    @Default([]) List<SearchResultResponse> results,
    String? query,
    PaginationResponse? pagination,
  }) = _SearchDataResponse;

  const SearchDataResponse._();

  factory SearchDataResponse.fromJson(Map<String, dynamic> json) =>
      _$SearchDataResponseFromJson(json);

  /// Convert results to domain entities
  List<SearchResultEntity> toEntities() {
    return results.map((r) => r.toEntity()).toList();
  }

  /// Get pagination or default
  SearchPagination toPagination() {
    return pagination?.toEntity() ??
        SearchPagination(
          page: 1,
          limit: results.length,
          totalCount: results.length,
          totalPages: 1,
          hasNext: false,
          hasPrevious: false,
        );
  }
}

/// Search API response wrapper
@freezed
class SearchApiResponse with _$SearchApiResponse {
  const factory SearchApiResponse({
    required bool success,
    required SearchDataResponse data,
    String? message,
  }) = _SearchApiResponse;

  const SearchApiResponse._();

  factory SearchApiResponse.fromJson(Map<String, dynamic> json) =>
      _$SearchApiResponseFromJson(json);
}