import 'package:equatable/equatable.dart';

abstract class NavigationEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class NavigateToLoginEvent extends NavigationEvent {}

class NavigateToRegisterEvent extends NavigationEvent {}

class NavigateToHomeEvent extends NavigationEvent {}
