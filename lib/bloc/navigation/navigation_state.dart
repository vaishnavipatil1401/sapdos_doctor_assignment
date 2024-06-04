import 'package:equatable/equatable.dart';

abstract class NavigationState extends Equatable {
  @override
  List<Object> get props => [];
}

class HomePageState extends NavigationState {}

class LoginPageState extends NavigationState {}

class RegistrationPageState extends NavigationState {}
