import 'package:bloc_to_api_exa/blocs/app_bloc.dart';
import 'package:bloc_to_api_exa/blocs/user_event.dart';
import 'package:bloc_to_api_exa/blocs/user_state.dart';
import 'package:bloc_to_api_exa/model/user_model.dart';
import 'package:bloc_to_api_exa/repository/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: Home(),
      home: RepositoryProvider(
        create: (context) => UserRepository(),
        child: const Home(),
      ),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) =>
            UserBloc(RepositoryProvider.of<UserRepository>(context))
              ..add(LoadUserEvent()),
        child: Scaffold(
            appBar: AppBar(
              title: Text("Bloc Tutorial"),
            ),
            body: BlocBuilder<UserBloc, UserState>(builder: ((context, state) {
              if (state is UserLoadingState) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is UserLoadedState) {
                List<UserModel> users = state.users;
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView.builder(
                      itemCount: users.length,
                      itemBuilder: (context, index) {
                        return Card(
                          color: Colors.blue,
                          elevation: 4,
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          child: ListTile(
                            title: Text(
                              users[index].firstname,
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white),
                            ),
                            subtitle: Text(
                              users[index].lastname,
                              style:
                                  TextStyle(fontSize: 14, color: Colors.white),
                            ),
                            trailing: CircleAvatar(
                              backgroundImage:
                                  NetworkImage(users[index].avatar),
                            ),
                          ),
                        );
                      }),
                );
              }
              if (state is UserErrorState) {
                return Center(
                  child: Text("Error Occured"),
                );
              }
              return Container();
            }))));
  }
}
