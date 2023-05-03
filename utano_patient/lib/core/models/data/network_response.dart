import 'package:freezed_annotation/freezed_annotation.dart';

part 'network_response.freezed.dart';
part 'network_response.g.dart';

@freezed
class NetworkResponse with _$NetworkResponse {
  factory NetworkResponse({
    required bool status,
    @JsonKey(name: 'status_description') required String statusDescription,
    required String message,
    required Map<String, dynamic>? data,
    required dynamic issues,
    required double version,
    @JsonKey(name: 'versioned_by') required String versionedBy,
  }) = _NetworkResponse;

  const NetworkResponse._();

  factory NetworkResponse.fromJson(Map<String, dynamic> json) =>
      _$NetworkResponseFromJson(json);

  @override
  String toString() =>
      'NetworkResponse(status: $status, description: $statusDescription, '
      'message: $message, data: $data, issues: $issues, version: $version, '
      'versionedBy: $versionedBy,)';
}
