import 'package:bloc_to_api_exa/model/user_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class UserState extends Equatable {}

// data loading state
class UserLoadingState extends UserState {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

// data loaded state
class UserLoadedState extends UserState {
  final List<UserModel> users;
  UserLoadedState(this.users);
  
  @override
  // TODO: implement props
  List<Object> get props => [users];
}


class UserErrorState extends UserState {
  final String error;
  UserErrorState(this.error);
  
  @override
  // TODO: implement props
  List<Object> get props => [error];
}