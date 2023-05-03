// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'network_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

NetworkResponse _$NetworkResponseFromJson(Map<String, dynamic> json) {
  return _NetworkResponse.fromJson(json);
}

/// @nodoc
mixin _$NetworkResponse {
  bool get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'status_description')
  String get statusDescription => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  Map<String, dynamic>? get data => throw _privateConstructorUsedError;
  dynamic get issues => throw _privateConstructorUsedError;
  double get version => throw _privateConstructorUsedError;
  @JsonKey(name: 'versioned_by')
  String get versionedBy => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NetworkResponseCopyWith<NetworkResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NetworkResponseCopyWith<$Res> {
  factory $NetworkResponseCopyWith(
          NetworkResponse value, $Res Function(NetworkResponse) then) =
      _$NetworkResponseCopyWithImpl<$Res, NetworkResponse>;
  @useResult
  $Res call(
      {bool status,
      @JsonKey(name: 'status_description') String statusDescription,
      String message,
      Map<String, dynamic>? data,
      dynamic issues,
      double version,
      @JsonKey(name: 'versioned_by') String versionedBy});
}

/// @nodoc
class _$NetworkResponseCopyWithImpl<$Res, $Val extends NetworkResponse>
    implements $NetworkResponseCopyWith<$Res> {
  _$NetworkResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? statusDescription = null,
    Object? message = null,
    Object? data = freezed,
    Object? issues = freezed,
    Object? version = null,
    Object? versionedBy = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool,
      statusDescription: null == statusDescription
          ? _value.statusDescription
          : statusDescription // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      issues: freezed == issues
          ? _value.issues
          : issues // ignore: cast_nullable_to_non_nullable
              as dynamic,
      version: null == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as double,
      versionedBy: null == versionedBy
          ? _value.versionedBy
          : versionedBy // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_NetworkResponseCopyWith<$Res>
    implements $NetworkResponseCopyWith<$Res> {
  factory _$$_NetworkResponseCopyWith(
          _$_NetworkResponse value, $Res Function(_$_NetworkResponse) then) =
      __$$_NetworkResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool status,
      @JsonKey(name: 'status_description') String statusDescription,
      String message,
      Map<String, dynamic>? data,
      dynamic issues,
      double version,
      @JsonKey(name: 'versioned_by') String versionedBy});
}

/// @nodoc
class __$$_NetworkResponseCopyWithImpl<$Res>
    extends _$NetworkResponseCopyWithImpl<$Res, _$_NetworkResponse>
    implements _$$_NetworkResponseCopyWith<$Res> {
  __$$_NetworkResponseCopyWithImpl(
      _$_NetworkResponse _value, $Res Function(_$_NetworkResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? statusDescription = null,
    Object? message = null,
    Object? data = freezed,
    Object? issues = freezed,
    Object? version = null,
    Object? versionedBy = null,
  }) {
    return _then(_$_NetworkResponse(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool,
      statusDescription: null == statusDescription
          ? _value.statusDescription
          : statusDescription // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      data: freezed == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      issues: freezed == issues
          ? _value.issues
          : issues // ignore: cast_nullable_to_non_nullable
              as dynamic,
      version: null == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as double,
      versionedBy: null == versionedBy
          ? _value.versionedBy
          : versionedBy // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_NetworkResponse extends _NetworkResponse {
  _$_NetworkResponse(
      {required this.status,
      @JsonKey(name: 'status_description') required this.statusDescription,
      required this.message,
      required final Map<String, dynamic>? data,
      required this.issues,
      required this.version,
      @JsonKey(name: 'versioned_by') required this.versionedBy})
      : _data = data,
        super._();

  factory _$_NetworkResponse.fromJson(Map<String, dynamic> json) =>
      _$$_NetworkResponseFromJson(json);

  @override
  final bool status;
  @override
  @JsonKey(name: 'status_description')
  final String statusDescription;
  @override
  final String message;
  final Map<String, dynamic>? _data;
  @override
  Map<String, dynamic>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableMapView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  final dynamic issues;
  @override
  final double version;
  @override
  @JsonKey(name: 'versioned_by')
  final String versionedBy;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NetworkResponse &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.statusDescription, statusDescription) ||
                other.statusDescription == statusDescription) &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            const DeepCollectionEquality().equals(other.issues, issues) &&
            (identical(other.version, version) || other.version == version) &&
            (identical(other.versionedBy, versionedBy) ||
                other.versionedBy == versionedBy));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      status,
      statusDescription,
      message,
      const DeepCollectionEquality().hash(_data),
      const DeepCollectionEquality().hash(issues),
      version,
      versionedBy);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NetworkResponseCopyWith<_$_NetworkResponse> get copyWith =>
      __$$_NetworkResponseCopyWithImpl<_$_NetworkResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_NetworkResponseToJson(
      this,
    );
  }
}

abstract class _NetworkResponse extends NetworkResponse {
  factory _NetworkResponse(
      {required final bool status,
      @JsonKey(name: 'status_description')
          required final String statusDescription,
      required final String message,
      required final Map<String, dynamic>? data,
      required final dynamic issues,
      required final double version,
      @JsonKey(name: 'versioned_by')
          required final String versionedBy}) = _$_NetworkResponse;
  _NetworkResponse._() : super._();

  factory _NetworkResponse.fromJson(Map<String, dynamic> json) =
      _$_NetworkResponse.fromJson;

  @override
  bool get status;
  @override
  @JsonKey(name: 'status_description')
  String get statusDescription;
  @override
  String get message;
  @override
  Map<String, dynamic>? get data;
  @override
  dynamic get issues;
  @override
  double get version;
  @override
  @JsonKey(name: 'versioned_by')
  String get versionedBy;
  @override
  @JsonKey(ignore: true)
  _$$_NetworkResponseCopyWith<_$_NetworkResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
