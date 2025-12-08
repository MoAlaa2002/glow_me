abstract class ResetPasswordState {}

class InitialResetPassState extends ResetPasswordState {}

class LoadingResetPassState extends ResetPasswordState {}

class LoadedResetPassState extends ResetPasswordState {}

class FailureResetPassState extends ResetPasswordState {
  final String errormsg;
  FailureResetPassState({required this.errormsg});
}
