import 'package:equatable/equatable.dart';

sealed class Failure extends Equatable {
  final String message;

  const Failure(this.message);

  @override
  List<Object?> get props => [message];
}

class GenericFailure extends Failure {
  const GenericFailure()
    : super('Algo deu errado! Tente novamente em alguns instantes');
}

class CreateFailure extends Failure {
  const CreateFailure() : super('Erro ao criar link simplificado');
}

class ValidLinkFailure extends Failure {
  const ValidLinkFailure() : super('O texto enviado não é um link valido');
}
