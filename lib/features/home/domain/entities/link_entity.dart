import 'package:equatable/equatable.dart';

class LinkEntity extends Equatable {
  final String short;
  final String self;

  const LinkEntity({required this.short, required this.self});

  @override
  List<Object?> get props => [short, self];
}
