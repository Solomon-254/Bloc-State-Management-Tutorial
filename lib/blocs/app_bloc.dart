import 'package:bloc_to_api_exa/blocs/user_event.dart';
import 'package:bloc_to_api_exa/blocs/user_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../repository/user_repository.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository userRepo;
  UserBloc(this.userRepo) : super(UserLoadingState()) {
    on<LoadUserEvent>(((event, emit) async {
      emit(UserLoadingState());
      print("You emitted the first state bro");
      try {
        final users = await userRepo.getUsers();
        emit(UserLoadedState(users));
      } catch (e) {
        emit(UserErrorState(e.toString()));
      }

      print("You emitted the second state bro");
    }));
  }
}
