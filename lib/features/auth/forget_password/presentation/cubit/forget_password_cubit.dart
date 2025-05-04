import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tracking_app/core/base/base_state.dart';

part 'forget_password_state.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  ForgetPasswordCubit() : super(ForgetPasswordState());
  forgetPassword() async {
    emit(state.copyWith(forgetPasswordState: BaseLoading()));
    //call use case
    emit(state.copyWith(forgetPasswordState: BaseSuccess() ));
  }
}
