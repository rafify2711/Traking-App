import 'package:flutter_bloc/flutter_bloc.dart';
import 'logout_state.dart';

class LogoutCubit extends Cubit<LogoutState> {
  LogoutCubit() : super(LogoutInitial());

  Future<void> doSomething() async {
    emit(LogoutLoading());
    try {
      // Call usecase
      // emit(LogoutSuccess(result));
    } catch (e) {
      emit(LogoutFailure(e.toString()));
    }
  }
}
