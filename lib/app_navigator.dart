import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'auth_state.dart';
import 'cubit/auth_cubit.dart';
import 'cubit/todo_cubit.dart';
import 'screens/auth_view.dart';
import 'screens/todos_view.dart';
import 'widgets/loading_view.dart';

class AppNavigator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(builder: (context, state) {
      return Navigator(
        pages: [
          if (state is Unauthenticated) MaterialPage(child: AuthView()),
          if (state is Authenticated)
            MaterialPage(
              child: BlocProvider(
                create: (context) => TodoCubit(userId: state.userId)
                  ..getTodos()
                  ..observeTodo(),
                child: TodosView(),
              ),
            ),
          if (state is UnknownAuthState) MaterialPage(child: LoadingView())
        ],
        onPopPage: (route, result) => route.didPop(result),
      );
    });
  }
}
