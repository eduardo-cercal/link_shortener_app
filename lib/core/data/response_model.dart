import 'package:equatable/equatable.dart';

class ResponseModel extends Equatable {
  final int statusCode;
  final dynamic data;

  const ResponseModel({required this.statusCode, required this.data});

  @override
  List<Object?> get props => [statusCode, data];
}
