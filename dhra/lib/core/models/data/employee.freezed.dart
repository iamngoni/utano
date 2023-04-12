// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'employee.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Employee _$EmployeeFromJson(Map<String, dynamic> json) {
  return _Employee.fromJson(json);
}

/// @nodoc
mixin _$Employee {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt => throw _privateConstructorUsedError;
  List<String> get tags => throw _privateConstructorUsedError;
  List<String> get qualifications => throw _privateConstructorUsedError;
  @JsonKey(name: 'registered_on')
  DateTime get registeredOn => throw _privateConstructorUsedError;
  User get user => throw _privateConstructorUsedError;
  @JsonKey(name: 'registered_at')
  HealthInstitution get registeredAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'deleted_at')
  DateTime? get deletedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'professional_title')
  String? get professionalTitle => throw _privateConstructorUsedError;
  String? get bio => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EmployeeCopyWith<Employee> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EmployeeCopyWith<$Res> {
  factory $EmployeeCopyWith(Employee value, $Res Function(Employee) then) =
      _$EmployeeCopyWithImpl<$Res, Employee>;
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'updated_at') DateTime updatedAt,
      List<String> tags,
      List<String> qualifications,
      @JsonKey(name: 'registered_on') DateTime registeredOn,
      User user,
      @JsonKey(name: 'registered_at') HealthInstitution registeredAt,
      @JsonKey(name: 'deleted_at') DateTime? deletedAt,
      @JsonKey(name: 'professional_title') String? professionalTitle,
      String? bio});

  $UserCopyWith<$Res> get user;
  $HealthInstitutionCopyWith<$Res> get registeredAt;
}

/// @nodoc
class _$EmployeeCopyWithImpl<$Res, $Val extends Employee>
    implements $EmployeeCopyWith<$Res> {
  _$EmployeeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? tags = null,
    Object? qualifications = null,
    Object? registeredOn = null,
    Object? user = null,
    Object? registeredAt = null,
    Object? deletedAt = freezed,
    Object? professionalTitle = freezed,
    Object? bio = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      tags: null == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      qualifications: null == qualifications
          ? _value.qualifications
          : qualifications // ignore: cast_nullable_to_non_nullable
              as List<String>,
      registeredOn: null == registeredOn
          ? _value.registeredOn
          : registeredOn // ignore: cast_nullable_to_non_nullable
              as DateTime,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      registeredAt: null == registeredAt
          ? _value.registeredAt
          : registeredAt // ignore: cast_nullable_to_non_nullable
              as HealthInstitution,
      deletedAt: freezed == deletedAt
          ? _value.deletedAt
          : deletedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      professionalTitle: freezed == professionalTitle
          ? _value.professionalTitle
          : professionalTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      bio: freezed == bio
          ? _value.bio
          : bio // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res> get user {
    return $UserCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $HealthInstitutionCopyWith<$Res> get registeredAt {
    return $HealthInstitutionCopyWith<$Res>(_value.registeredAt, (value) {
      return _then(_value.copyWith(registeredAt: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_EmployeeCopyWith<$Res> implements $EmployeeCopyWith<$Res> {
  factory _$$_EmployeeCopyWith(
          _$_Employee value, $Res Function(_$_Employee) then) =
      __$$_EmployeeCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'updated_at') DateTime updatedAt,
      List<String> tags,
      List<String> qualifications,
      @JsonKey(name: 'registered_on') DateTime registeredOn,
      User user,
      @JsonKey(name: 'registered_at') HealthInstitution registeredAt,
      @JsonKey(name: 'deleted_at') DateTime? deletedAt,
      @JsonKey(name: 'professional_title') String? professionalTitle,
      String? bio});

  @override
  $UserCopyWith<$Res> get user;
  @override
  $HealthInstitutionCopyWith<$Res> get registeredAt;
}

/// @nodoc
class __$$_EmployeeCopyWithImpl<$Res>
    extends _$EmployeeCopyWithImpl<$Res, _$_Employee>
    implements _$$_EmployeeCopyWith<$Res> {
  __$$_EmployeeCopyWithImpl(
      _$_Employee _value, $Res Function(_$_Employee) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? tags = null,
    Object? qualifications = null,
    Object? registeredOn = null,
    Object? user = null,
    Object? registeredAt = null,
    Object? deletedAt = freezed,
    Object? professionalTitle = freezed,
    Object? bio = freezed,
  }) {
    return _then(_$_Employee(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      tags: null == tags
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      qualifications: null == qualifications
          ? _value._qualifications
          : qualifications // ignore: cast_nullable_to_non_nullable
              as List<String>,
      registeredOn: null == registeredOn
          ? _value.registeredOn
          : registeredOn // ignore: cast_nullable_to_non_nullable
              as DateTime,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      registeredAt: null == registeredAt
          ? _value.registeredAt
          : registeredAt // ignore: cast_nullable_to_non_nullable
              as HealthInstitution,
      deletedAt: freezed == deletedAt
          ? _value.deletedAt
          : deletedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      professionalTitle: freezed == professionalTitle
          ? _value.professionalTitle
          : professionalTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      bio: freezed == bio
          ? _value.bio
          : bio // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Employee implements _Employee {
  _$_Employee(
      {required this.id,
      @JsonKey(name: 'created_at') required this.createdAt,
      @JsonKey(name: 'updated_at') required this.updatedAt,
      required final List<String> tags,
      required final List<String> qualifications,
      @JsonKey(name: 'registered_on') required this.registeredOn,
      required this.user,
      @JsonKey(name: 'registered_at') required this.registeredAt,
      @JsonKey(name: 'deleted_at') this.deletedAt,
      @JsonKey(name: 'professional_title') this.professionalTitle,
      this.bio})
      : _tags = tags,
        _qualifications = qualifications;

  factory _$_Employee.fromJson(Map<String, dynamic> json) =>
      _$$_EmployeeFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;
  final List<String> _tags;
  @override
  List<String> get tags {
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tags);
  }

  final List<String> _qualifications;
  @override
  List<String> get qualifications {
    if (_qualifications is EqualUnmodifiableListView) return _qualifications;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_qualifications);
  }

  @override
  @JsonKey(name: 'registered_on')
  final DateTime registeredOn;
  @override
  final User user;
  @override
  @JsonKey(name: 'registered_at')
  final HealthInstitution registeredAt;
  @override
  @JsonKey(name: 'deleted_at')
  final DateTime? deletedAt;
  @override
  @JsonKey(name: 'professional_title')
  final String? professionalTitle;
  @override
  final String? bio;

  @override
  String toString() {
    return 'Employee(id: $id, createdAt: $createdAt, updatedAt: $updatedAt, tags: $tags, qualifications: $qualifications, registeredOn: $registeredOn, user: $user, registeredAt: $registeredAt, deletedAt: $deletedAt, professionalTitle: $professionalTitle, bio: $bio)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Employee &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            const DeepCollectionEquality()
                .equals(other._qualifications, _qualifications) &&
            (identical(other.registeredOn, registeredOn) ||
                other.registeredOn == registeredOn) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.registeredAt, registeredAt) ||
                other.registeredAt == registeredAt) &&
            (identical(other.deletedAt, deletedAt) ||
                other.deletedAt == deletedAt) &&
            (identical(other.professionalTitle, professionalTitle) ||
                other.professionalTitle == professionalTitle) &&
            (identical(other.bio, bio) || other.bio == bio));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      createdAt,
      updatedAt,
      const DeepCollectionEquality().hash(_tags),
      const DeepCollectionEquality().hash(_qualifications),
      registeredOn,
      user,
      registeredAt,
      deletedAt,
      professionalTitle,
      bio);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_EmployeeCopyWith<_$_Employee> get copyWith =>
      __$$_EmployeeCopyWithImpl<_$_Employee>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_EmployeeToJson(
      this,
    );
  }
}

abstract class _Employee implements Employee {
  factory _Employee(
      {required final String id,
      @JsonKey(name: 'created_at')
          required final DateTime createdAt,
      @JsonKey(name: 'updated_at')
          required final DateTime updatedAt,
      required final List<String> tags,
      required final List<String> qualifications,
      @JsonKey(name: 'registered_on')
          required final DateTime registeredOn,
      required final User user,
      @JsonKey(name: 'registered_at')
          required final HealthInstitution registeredAt,
      @JsonKey(name: 'deleted_at')
          final DateTime? deletedAt,
      @JsonKey(name: 'professional_title')
          final String? professionalTitle,
      final String? bio}) = _$_Employee;

  factory _Employee.fromJson(Map<String, dynamic> json) = _$_Employee.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'created_at')
  DateTime get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt;
  @override
  List<String> get tags;
  @override
  List<String> get qualifications;
  @override
  @JsonKey(name: 'registered_on')
  DateTime get registeredOn;
  @override
  User get user;
  @override
  @JsonKey(name: 'registered_at')
  HealthInstitution get registeredAt;
  @override
  @JsonKey(name: 'deleted_at')
  DateTime? get deletedAt;
  @override
  @JsonKey(name: 'professional_title')
  String? get professionalTitle;
  @override
  String? get bio;
  @override
  @JsonKey(ignore: true)
  _$$_EmployeeCopyWith<_$_Employee> get copyWith =>
      throw _privateConstructorUsedError;
}
