// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$SearchPagination {
  int get page => throw _privateConstructorUsedError;
  int get limit => throw _privateConstructorUsedError;
  int get totalCount => throw _privateConstructorUsedError;
  int get totalPages => throw _privateConstructorUsedError;
  bool get hasNext => throw _privateConstructorUsedError;
  bool get hasPrevious => throw _privateConstructorUsedError;

  /// Create a copy of SearchPagination
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SearchPaginationCopyWith<SearchPagination> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchPaginationCopyWith<$Res> {
  factory $SearchPaginationCopyWith(
    SearchPagination value,
    $Res Function(SearchPagination) then,
  ) = _$SearchPaginationCopyWithImpl<$Res, SearchPagination>;
  @useResult
  $Res call({
    int page,
    int limit,
    int totalCount,
    int totalPages,
    bool hasNext,
    bool hasPrevious,
  });
}

/// @nodoc
class _$SearchPaginationCopyWithImpl<$Res, $Val extends SearchPagination>
    implements $SearchPaginationCopyWith<$Res> {
  _$SearchPaginationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SearchPagination
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = null,
    Object? limit = null,
    Object? totalCount = null,
    Object? totalPages = null,
    Object? hasNext = null,
    Object? hasPrevious = null,
  }) {
    return _then(
      _value.copyWith(
            page: null == page
                ? _value.page
                : page // ignore: cast_nullable_to_non_nullable
                      as int,
            limit: null == limit
                ? _value.limit
                : limit // ignore: cast_nullable_to_non_nullable
                      as int,
            totalCount: null == totalCount
                ? _value.totalCount
                : totalCount // ignore: cast_nullable_to_non_nullable
                      as int,
            totalPages: null == totalPages
                ? _value.totalPages
                : totalPages // ignore: cast_nullable_to_non_nullable
                      as int,
            hasNext: null == hasNext
                ? _value.hasNext
                : hasNext // ignore: cast_nullable_to_non_nullable
                      as bool,
            hasPrevious: null == hasPrevious
                ? _value.hasPrevious
                : hasPrevious // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SearchPaginationImplCopyWith<$Res>
    implements $SearchPaginationCopyWith<$Res> {
  factory _$$SearchPaginationImplCopyWith(
    _$SearchPaginationImpl value,
    $Res Function(_$SearchPaginationImpl) then,
  ) = __$$SearchPaginationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int page,
    int limit,
    int totalCount,
    int totalPages,
    bool hasNext,
    bool hasPrevious,
  });
}

/// @nodoc
class __$$SearchPaginationImplCopyWithImpl<$Res>
    extends _$SearchPaginationCopyWithImpl<$Res, _$SearchPaginationImpl>
    implements _$$SearchPaginationImplCopyWith<$Res> {
  __$$SearchPaginationImplCopyWithImpl(
    _$SearchPaginationImpl _value,
    $Res Function(_$SearchPaginationImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SearchPagination
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = null,
    Object? limit = null,
    Object? totalCount = null,
    Object? totalPages = null,
    Object? hasNext = null,
    Object? hasPrevious = null,
  }) {
    return _then(
      _$SearchPaginationImpl(
        page: null == page
            ? _value.page
            : page // ignore: cast_nullable_to_non_nullable
                  as int,
        limit: null == limit
            ? _value.limit
            : limit // ignore: cast_nullable_to_non_nullable
                  as int,
        totalCount: null == totalCount
            ? _value.totalCount
            : totalCount // ignore: cast_nullable_to_non_nullable
                  as int,
        totalPages: null == totalPages
            ? _value.totalPages
            : totalPages // ignore: cast_nullable_to_non_nullable
                  as int,
        hasNext: null == hasNext
            ? _value.hasNext
            : hasNext // ignore: cast_nullable_to_non_nullable
                  as bool,
        hasPrevious: null == hasPrevious
            ? _value.hasPrevious
            : hasPrevious // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc

class _$SearchPaginationImpl implements _SearchPagination {
  const _$SearchPaginationImpl({
    required this.page,
    required this.limit,
    required this.totalCount,
    required this.totalPages,
    required this.hasNext,
    required this.hasPrevious,
  });

  @override
  final int page;
  @override
  final int limit;
  @override
  final int totalCount;
  @override
  final int totalPages;
  @override
  final bool hasNext;
  @override
  final bool hasPrevious;

  @override
  String toString() {
    return 'SearchPagination(page: $page, limit: $limit, totalCount: $totalCount, totalPages: $totalPages, hasNext: $hasNext, hasPrevious: $hasPrevious)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchPaginationImpl &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.limit, limit) || other.limit == limit) &&
            (identical(other.totalCount, totalCount) ||
                other.totalCount == totalCount) &&
            (identical(other.totalPages, totalPages) ||
                other.totalPages == totalPages) &&
            (identical(other.hasNext, hasNext) || other.hasNext == hasNext) &&
            (identical(other.hasPrevious, hasPrevious) ||
                other.hasPrevious == hasPrevious));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    page,
    limit,
    totalCount,
    totalPages,
    hasNext,
    hasPrevious,
  );

  /// Create a copy of SearchPagination
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchPaginationImplCopyWith<_$SearchPaginationImpl> get copyWith =>
      __$$SearchPaginationImplCopyWithImpl<_$SearchPaginationImpl>(
        this,
        _$identity,
      );
}

abstract class _SearchPagination implements SearchPagination {
  const factory _SearchPagination({
    required final int page,
    required final int limit,
    required final int totalCount,
    required final int totalPages,
    required final bool hasNext,
    required final bool hasPrevious,
  }) = _$SearchPaginationImpl;

  @override
  int get page;
  @override
  int get limit;
  @override
  int get totalCount;
  @override
  int get totalPages;
  @override
  bool get hasNext;
  @override
  bool get hasPrevious;

  /// Create a copy of SearchPagination
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SearchPaginationImplCopyWith<_$SearchPaginationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$SearchState {
  /// Current search mode
  SearchMode get searchMode => throw _privateConstructorUsedError;

  /// Text search query
  String get textQuery => throw _privateConstructorUsedError;

  /// Voice search transcribed text
  String? get voiceTranscription => throw _privateConstructorUsedError;

  /// OCR extracted text from camera
  String? get ocrText => throw _privateConstructorUsedError;

  /// OCR processing status
  OcrStatus get ocrStatus => throw _privateConstructorUsedError;

  /// Whether voice is currently recording
  bool get isRecording => throw _privateConstructorUsedError;

  /// Search results
  List<SearchResultEntity> get results => throw _privateConstructorUsedError;

  /// Whether search is loading
  bool get isLoading => throw _privateConstructorUsedError;

  /// Whether more results are being loaded (pagination)
  bool get isLoadingMore => throw _privateConstructorUsedError;

  /// Pagination information
  SearchPagination? get pagination => throw _privateConstructorUsedError;

  /// Error message if any
  String? get errorMessage => throw _privateConstructorUsedError;

  /// Last search query that was executed
  String? get lastSearchQuery => throw _privateConstructorUsedError;

  /// Create a copy of SearchState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SearchStateCopyWith<SearchState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchStateCopyWith<$Res> {
  factory $SearchStateCopyWith(
    SearchState value,
    $Res Function(SearchState) then,
  ) = _$SearchStateCopyWithImpl<$Res, SearchState>;
  @useResult
  $Res call({
    SearchMode searchMode,
    String textQuery,
    String? voiceTranscription,
    String? ocrText,
    OcrStatus ocrStatus,
    bool isRecording,
    List<SearchResultEntity> results,
    bool isLoading,
    bool isLoadingMore,
    SearchPagination? pagination,
    String? errorMessage,
    String? lastSearchQuery,
  });

  $SearchPaginationCopyWith<$Res>? get pagination;
}

/// @nodoc
class _$SearchStateCopyWithImpl<$Res, $Val extends SearchState>
    implements $SearchStateCopyWith<$Res> {
  _$SearchStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SearchState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? searchMode = null,
    Object? textQuery = null,
    Object? voiceTranscription = freezed,
    Object? ocrText = freezed,
    Object? ocrStatus = null,
    Object? isRecording = null,
    Object? results = null,
    Object? isLoading = null,
    Object? isLoadingMore = null,
    Object? pagination = freezed,
    Object? errorMessage = freezed,
    Object? lastSearchQuery = freezed,
  }) {
    return _then(
      _value.copyWith(
            searchMode: null == searchMode
                ? _value.searchMode
                : searchMode // ignore: cast_nullable_to_non_nullable
                      as SearchMode,
            textQuery: null == textQuery
                ? _value.textQuery
                : textQuery // ignore: cast_nullable_to_non_nullable
                      as String,
            voiceTranscription: freezed == voiceTranscription
                ? _value.voiceTranscription
                : voiceTranscription // ignore: cast_nullable_to_non_nullable
                      as String?,
            ocrText: freezed == ocrText
                ? _value.ocrText
                : ocrText // ignore: cast_nullable_to_non_nullable
                      as String?,
            ocrStatus: null == ocrStatus
                ? _value.ocrStatus
                : ocrStatus // ignore: cast_nullable_to_non_nullable
                      as OcrStatus,
            isRecording: null == isRecording
                ? _value.isRecording
                : isRecording // ignore: cast_nullable_to_non_nullable
                      as bool,
            results: null == results
                ? _value.results
                : results // ignore: cast_nullable_to_non_nullable
                      as List<SearchResultEntity>,
            isLoading: null == isLoading
                ? _value.isLoading
                : isLoading // ignore: cast_nullable_to_non_nullable
                      as bool,
            isLoadingMore: null == isLoadingMore
                ? _value.isLoadingMore
                : isLoadingMore // ignore: cast_nullable_to_non_nullable
                      as bool,
            pagination: freezed == pagination
                ? _value.pagination
                : pagination // ignore: cast_nullable_to_non_nullable
                      as SearchPagination?,
            errorMessage: freezed == errorMessage
                ? _value.errorMessage
                : errorMessage // ignore: cast_nullable_to_non_nullable
                      as String?,
            lastSearchQuery: freezed == lastSearchQuery
                ? _value.lastSearchQuery
                : lastSearchQuery // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }

  /// Create a copy of SearchState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SearchPaginationCopyWith<$Res>? get pagination {
    if (_value.pagination == null) {
      return null;
    }

    return $SearchPaginationCopyWith<$Res>(_value.pagination!, (value) {
      return _then(_value.copyWith(pagination: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SearchStateImplCopyWith<$Res>
    implements $SearchStateCopyWith<$Res> {
  factory _$$SearchStateImplCopyWith(
    _$SearchStateImpl value,
    $Res Function(_$SearchStateImpl) then,
  ) = __$$SearchStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    SearchMode searchMode,
    String textQuery,
    String? voiceTranscription,
    String? ocrText,
    OcrStatus ocrStatus,
    bool isRecording,
    List<SearchResultEntity> results,
    bool isLoading,
    bool isLoadingMore,
    SearchPagination? pagination,
    String? errorMessage,
    String? lastSearchQuery,
  });

  @override
  $SearchPaginationCopyWith<$Res>? get pagination;
}

/// @nodoc
class __$$SearchStateImplCopyWithImpl<$Res>
    extends _$SearchStateCopyWithImpl<$Res, _$SearchStateImpl>
    implements _$$SearchStateImplCopyWith<$Res> {
  __$$SearchStateImplCopyWithImpl(
    _$SearchStateImpl _value,
    $Res Function(_$SearchStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SearchState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? searchMode = null,
    Object? textQuery = null,
    Object? voiceTranscription = freezed,
    Object? ocrText = freezed,
    Object? ocrStatus = null,
    Object? isRecording = null,
    Object? results = null,
    Object? isLoading = null,
    Object? isLoadingMore = null,
    Object? pagination = freezed,
    Object? errorMessage = freezed,
    Object? lastSearchQuery = freezed,
  }) {
    return _then(
      _$SearchStateImpl(
        searchMode: null == searchMode
            ? _value.searchMode
            : searchMode // ignore: cast_nullable_to_non_nullable
                  as SearchMode,
        textQuery: null == textQuery
            ? _value.textQuery
            : textQuery // ignore: cast_nullable_to_non_nullable
                  as String,
        voiceTranscription: freezed == voiceTranscription
            ? _value.voiceTranscription
            : voiceTranscription // ignore: cast_nullable_to_non_nullable
                  as String?,
        ocrText: freezed == ocrText
            ? _value.ocrText
            : ocrText // ignore: cast_nullable_to_non_nullable
                  as String?,
        ocrStatus: null == ocrStatus
            ? _value.ocrStatus
            : ocrStatus // ignore: cast_nullable_to_non_nullable
                  as OcrStatus,
        isRecording: null == isRecording
            ? _value.isRecording
            : isRecording // ignore: cast_nullable_to_non_nullable
                  as bool,
        results: null == results
            ? _value._results
            : results // ignore: cast_nullable_to_non_nullable
                  as List<SearchResultEntity>,
        isLoading: null == isLoading
            ? _value.isLoading
            : isLoading // ignore: cast_nullable_to_non_nullable
                  as bool,
        isLoadingMore: null == isLoadingMore
            ? _value.isLoadingMore
            : isLoadingMore // ignore: cast_nullable_to_non_nullable
                  as bool,
        pagination: freezed == pagination
            ? _value.pagination
            : pagination // ignore: cast_nullable_to_non_nullable
                  as SearchPagination?,
        errorMessage: freezed == errorMessage
            ? _value.errorMessage
            : errorMessage // ignore: cast_nullable_to_non_nullable
                  as String?,
        lastSearchQuery: freezed == lastSearchQuery
            ? _value.lastSearchQuery
            : lastSearchQuery // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

class _$SearchStateImpl extends _SearchState {
  const _$SearchStateImpl({
    this.searchMode = SearchMode.text,
    this.textQuery = '',
    this.voiceTranscription,
    this.ocrText,
    this.ocrStatus = OcrStatus.idle,
    this.isRecording = false,
    final List<SearchResultEntity> results = const [],
    this.isLoading = false,
    this.isLoadingMore = false,
    this.pagination,
    this.errorMessage,
    this.lastSearchQuery,
  }) : _results = results,
       super._();

  /// Current search mode
  @override
  @JsonKey()
  final SearchMode searchMode;

  /// Text search query
  @override
  @JsonKey()
  final String textQuery;

  /// Voice search transcribed text
  @override
  final String? voiceTranscription;

  /// OCR extracted text from camera
  @override
  final String? ocrText;

  /// OCR processing status
  @override
  @JsonKey()
  final OcrStatus ocrStatus;

  /// Whether voice is currently recording
  @override
  @JsonKey()
  final bool isRecording;

  /// Search results
  final List<SearchResultEntity> _results;

  /// Search results
  @override
  @JsonKey()
  List<SearchResultEntity> get results {
    if (_results is EqualUnmodifiableListView) return _results;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_results);
  }

  /// Whether search is loading
  @override
  @JsonKey()
  final bool isLoading;

  /// Whether more results are being loaded (pagination)
  @override
  @JsonKey()
  final bool isLoadingMore;

  /// Pagination information
  @override
  final SearchPagination? pagination;

  /// Error message if any
  @override
  final String? errorMessage;

  /// Last search query that was executed
  @override
  final String? lastSearchQuery;

  @override
  String toString() {
    return 'SearchState(searchMode: $searchMode, textQuery: $textQuery, voiceTranscription: $voiceTranscription, ocrText: $ocrText, ocrStatus: $ocrStatus, isRecording: $isRecording, results: $results, isLoading: $isLoading, isLoadingMore: $isLoadingMore, pagination: $pagination, errorMessage: $errorMessage, lastSearchQuery: $lastSearchQuery)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchStateImpl &&
            (identical(other.searchMode, searchMode) ||
                other.searchMode == searchMode) &&
            (identical(other.textQuery, textQuery) ||
                other.textQuery == textQuery) &&
            (identical(other.voiceTranscription, voiceTranscription) ||
                other.voiceTranscription == voiceTranscription) &&
            (identical(other.ocrText, ocrText) || other.ocrText == ocrText) &&
            (identical(other.ocrStatus, ocrStatus) ||
                other.ocrStatus == ocrStatus) &&
            (identical(other.isRecording, isRecording) ||
                other.isRecording == isRecording) &&
            const DeepCollectionEquality().equals(other._results, _results) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isLoadingMore, isLoadingMore) ||
                other.isLoadingMore == isLoadingMore) &&
            (identical(other.pagination, pagination) ||
                other.pagination == pagination) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.lastSearchQuery, lastSearchQuery) ||
                other.lastSearchQuery == lastSearchQuery));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    searchMode,
    textQuery,
    voiceTranscription,
    ocrText,
    ocrStatus,
    isRecording,
    const DeepCollectionEquality().hash(_results),
    isLoading,
    isLoadingMore,
    pagination,
    errorMessage,
    lastSearchQuery,
  );

  /// Create a copy of SearchState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchStateImplCopyWith<_$SearchStateImpl> get copyWith =>
      __$$SearchStateImplCopyWithImpl<_$SearchStateImpl>(this, _$identity);
}

abstract class _SearchState extends SearchState {
  const factory _SearchState({
    final SearchMode searchMode,
    final String textQuery,
    final String? voiceTranscription,
    final String? ocrText,
    final OcrStatus ocrStatus,
    final bool isRecording,
    final List<SearchResultEntity> results,
    final bool isLoading,
    final bool isLoadingMore,
    final SearchPagination? pagination,
    final String? errorMessage,
    final String? lastSearchQuery,
  }) = _$SearchStateImpl;
  const _SearchState._() : super._();

  /// Current search mode
  @override
  SearchMode get searchMode;

  /// Text search query
  @override
  String get textQuery;

  /// Voice search transcribed text
  @override
  String? get voiceTranscription;

  /// OCR extracted text from camera
  @override
  String? get ocrText;

  /// OCR processing status
  @override
  OcrStatus get ocrStatus;

  /// Whether voice is currently recording
  @override
  bool get isRecording;

  /// Search results
  @override
  List<SearchResultEntity> get results;

  /// Whether search is loading
  @override
  bool get isLoading;

  /// Whether more results are being loaded (pagination)
  @override
  bool get isLoadingMore;

  /// Pagination information
  @override
  SearchPagination? get pagination;

  /// Error message if any
  @override
  String? get errorMessage;

  /// Last search query that was executed
  @override
  String? get lastSearchQuery;

  /// Create a copy of SearchState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SearchStateImplCopyWith<_$SearchStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$SearchResultEntity {
  ArtworkEntity get artwork => throw _privateConstructorUsedError;
  double get relevanceScore => throw _privateConstructorUsedError;

  /// Create a copy of SearchResultEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SearchResultEntityCopyWith<SearchResultEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchResultEntityCopyWith<$Res> {
  factory $SearchResultEntityCopyWith(
    SearchResultEntity value,
    $Res Function(SearchResultEntity) then,
  ) = _$SearchResultEntityCopyWithImpl<$Res, SearchResultEntity>;
  @useResult
  $Res call({ArtworkEntity artwork, double relevanceScore});

  $ArtworkEntityCopyWith<$Res> get artwork;
}

/// @nodoc
class _$SearchResultEntityCopyWithImpl<$Res, $Val extends SearchResultEntity>
    implements $SearchResultEntityCopyWith<$Res> {
  _$SearchResultEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SearchResultEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? artwork = null, Object? relevanceScore = null}) {
    return _then(
      _value.copyWith(
            artwork: null == artwork
                ? _value.artwork
                : artwork // ignore: cast_nullable_to_non_nullable
                      as ArtworkEntity,
            relevanceScore: null == relevanceScore
                ? _value.relevanceScore
                : relevanceScore // ignore: cast_nullable_to_non_nullable
                      as double,
          )
          as $Val,
    );
  }

  /// Create a copy of SearchResultEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ArtworkEntityCopyWith<$Res> get artwork {
    return $ArtworkEntityCopyWith<$Res>(_value.artwork, (value) {
      return _then(_value.copyWith(artwork: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SearchResultEntityImplCopyWith<$Res>
    implements $SearchResultEntityCopyWith<$Res> {
  factory _$$SearchResultEntityImplCopyWith(
    _$SearchResultEntityImpl value,
    $Res Function(_$SearchResultEntityImpl) then,
  ) = __$$SearchResultEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ArtworkEntity artwork, double relevanceScore});

  @override
  $ArtworkEntityCopyWith<$Res> get artwork;
}

/// @nodoc
class __$$SearchResultEntityImplCopyWithImpl<$Res>
    extends _$SearchResultEntityCopyWithImpl<$Res, _$SearchResultEntityImpl>
    implements _$$SearchResultEntityImplCopyWith<$Res> {
  __$$SearchResultEntityImplCopyWithImpl(
    _$SearchResultEntityImpl _value,
    $Res Function(_$SearchResultEntityImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SearchResultEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? artwork = null, Object? relevanceScore = null}) {
    return _then(
      _$SearchResultEntityImpl(
        artwork: null == artwork
            ? _value.artwork
            : artwork // ignore: cast_nullable_to_non_nullable
                  as ArtworkEntity,
        relevanceScore: null == relevanceScore
            ? _value.relevanceScore
            : relevanceScore // ignore: cast_nullable_to_non_nullable
                  as double,
      ),
    );
  }
}

/// @nodoc

class _$SearchResultEntityImpl implements _SearchResultEntity {
  const _$SearchResultEntityImpl({
    required this.artwork,
    required this.relevanceScore,
  });

  @override
  final ArtworkEntity artwork;
  @override
  final double relevanceScore;

  @override
  String toString() {
    return 'SearchResultEntity(artwork: $artwork, relevanceScore: $relevanceScore)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchResultEntityImpl &&
            (identical(other.artwork, artwork) || other.artwork == artwork) &&
            (identical(other.relevanceScore, relevanceScore) ||
                other.relevanceScore == relevanceScore));
  }

  @override
  int get hashCode => Object.hash(runtimeType, artwork, relevanceScore);

  /// Create a copy of SearchResultEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchResultEntityImplCopyWith<_$SearchResultEntityImpl> get copyWith =>
      __$$SearchResultEntityImplCopyWithImpl<_$SearchResultEntityImpl>(
        this,
        _$identity,
      );
}

abstract class _SearchResultEntity implements SearchResultEntity {
  const factory _SearchResultEntity({
    required final ArtworkEntity artwork,
    required final double relevanceScore,
  }) = _$SearchResultEntityImpl;

  @override
  ArtworkEntity get artwork;
  @override
  double get relevanceScore;

  /// Create a copy of SearchResultEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SearchResultEntityImplCopyWith<_$SearchResultEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
