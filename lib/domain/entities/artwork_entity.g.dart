// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'artwork_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ArtworkEntityImpl _$$ArtworkEntityImplFromJson(Map<String, dynamic> json) =>
    _$ArtworkEntityImpl(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      titleEn: json['titleEn'] as String?,
      artist: json['artist'] as String?,
      artistEn: json['artistEn'] as String?,
      artworkType: json['artworkType'] as String?,
      genre: json['genre'] as String?,
      creationYear: json['creationYear'] as String?,
      creationPeriod: json['creationPeriod'] as String?,
      medium: json['medium'] as String?,
      dimensions: json['dimensions'] as String?,
      museum: json['museum'] as String?,
      museumEn: json['museumEn'] as String?,
      museumLocation: json['museumLocation'] as String?,
      currentLocation: json['currentLocation'] as String?,
      imageUrl: json['imageUrl'] as String? ?? '',
      thumbnailUrl: json['thumbnailUrl'] as String?,
      highResUrl: json['highResUrl'] as String?,
      description: json['description'] as String?,
      historicalContext: json['historicalContext'] as String?,
      metadata: json['metadata'] as Map<String, dynamic>? ?? const {},
      wikipediaUrl: json['wikipediaUrl'] as String?,
      museumWebsiteUrl: json['museumWebsiteUrl'] as String?,
      viewCount: (json['viewCount'] as num?)?.toInt() ?? 0,
      docentGenerationCount:
          (json['docentGenerationCount'] as num?)?.toInt() ?? 0,
      averageRating: (json['averageRating'] as num?)?.toDouble(),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$ArtworkEntityImplToJson(_$ArtworkEntityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'titleEn': instance.titleEn,
      'artist': instance.artist,
      'artistEn': instance.artistEn,
      'artworkType': instance.artworkType,
      'genre': instance.genre,
      'creationYear': instance.creationYear,
      'creationPeriod': instance.creationPeriod,
      'medium': instance.medium,
      'dimensions': instance.dimensions,
      'museum': instance.museum,
      'museumEn': instance.museumEn,
      'museumLocation': instance.museumLocation,
      'currentLocation': instance.currentLocation,
      'imageUrl': instance.imageUrl,
      'thumbnailUrl': instance.thumbnailUrl,
      'highResUrl': instance.highResUrl,
      'description': instance.description,
      'historicalContext': instance.historicalContext,
      'metadata': instance.metadata,
      'wikipediaUrl': instance.wikipediaUrl,
      'museumWebsiteUrl': instance.museumWebsiteUrl,
      'viewCount': instance.viewCount,
      'docentGenerationCount': instance.docentGenerationCount,
      'averageRating': instance.averageRating,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };
