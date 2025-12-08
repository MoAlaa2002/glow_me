abstract class RegisterState {}

class InitialRegisterSate extends RegisterState {}

class LoadingRegisterSate extends RegisterState {}

class LoadedRegisterSate extends RegisterState {}

class FailureRegisterSate extends RegisterState {
  final String errormsg;

  FailureRegisterSate({required this.errormsg});
}

class TermsAndConditionsState extends RegisterState {
  final bool value;

  TermsAndConditionsState({required this.value});
}

class ShowPassState extends RegisterState {
  final bool value;

  ShowPassState({required this.value});
}
