import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/logout_cubit.dart';
import '../cubit/logout_state.dart';

class LogoutPage extends StatelessWidget {
  const LogoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LogoutCubit(),
      child: Scaffold(
        appBar: AppBar(title: const Text('Logout Page')),
        body: BlocBuilder<LogoutCubit, LogoutState>(
          builder: (context, state) {
            if (state is LogoutLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is LogoutFailure) {
              return Center(child: Text('Error: ${state.error}'));
            }
            return const Center(child: Text('Logout Page'));
          },
        ),
      ),
    );
  }
}
