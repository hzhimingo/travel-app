part of 'pwd_form_bloc.dart';

class PwdFormState extends Equatable {
  final Authorization authorization;
  final String account;
  final String password;
  final bool isEmailValid;
  final bool isPasswordValid;
  final bool isSubmitting;
  final bool isSuccess;
  final bool isFailure;

  bool get isFormValid => isEmailValid && isPasswordValid;

  PwdFormState({
    this.authorization,
    this.account,
    this.password,
    this.isEmailValid,
    this.isPasswordValid,
    this.isSubmitting,
    this.isSuccess,
    this.isFailure,
  });

  factory PwdFormState.empty() {
    return PwdFormState(
      authorization: null,
      account: null,
      password: null,
      isEmailValid: false,
      isPasswordValid: false,
      isSubmitting: false,
      isSuccess: false,
      isFailure: false,
    );
  }

  factory PwdFormState.loading({String account, String password}) {
    return PwdFormState(
      authorization: null,
      account: account,
      password: password,
      isEmailValid: true,
      isPasswordValid: true,
      isSubmitting: true,
      isSuccess: false,
      isFailure: false,
    );
  }

  factory PwdFormState.failure({String account, String password}) {
    return PwdFormState(
      authorization: null,
      account: account,
      password: password,
      isEmailValid: true,
      isPasswordValid: true,
      isSubmitting: false,
      isSuccess: false,
      isFailure: true,
    );
  }

  factory PwdFormState.success({Authorization authorization, String account, String password}) {
    return PwdFormState(
      authorization: authorization,
      account: null,
      password: null,
      isEmailValid: true,
      isPasswordValid: true,
      isSubmitting: false,
      isSuccess: true,
      isFailure: false,
    );
  }

  PwdFormState update({
    String account,
    String password,
    bool isEmailValid,
    bool isPasswordValid,
  }) {
    return copyWith(
      account: account,
      password: password,
      isEmailValid: isEmailValid,
      isPasswordValid: isPasswordValid,
      isSubmitting: false,
      isSuccess: false,
      isFailure: false,
    );
  }

  PwdFormState copyWith({
    String account,
    String password,
    bool isEmailValid,
    bool isPasswordValid,
    bool isSubmitting,
    bool isSuccess,
    bool isFailure,
  }) {
    return PwdFormState(
      account: account ?? this.account,
      password: password ?? this.password,
      isEmailValid: isEmailValid ?? this.isEmailValid,
      isPasswordValid: isPasswordValid ?? this.isPasswordValid,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      isSuccess: isSuccess ?? this.isSuccess,
      isFailure: isFailure ?? this.isFailure,
    );
  }

  @override
  List<Object> get props => [
        account,
        password,
        isEmailValid,
        isPasswordValid,
        isSubmitting,
        isSuccess,
        isFailure,
      ];
}
