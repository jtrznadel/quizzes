import 'package:equatable/equatable.dart';

abstract class TokenException extends Equatable implements Exception{
  String get message => 'token exception';

  @override
  List<Object?> get props => [message];
}