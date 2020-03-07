part of 'pwd_form_bloc.dart';

class PwdFormState extends Equatable {
  final String account;
  final String password;
  final bool isAccountValided;
  final bool isPasswordValided;

  bool get isFormValided => isAccountValided && isPasswordValided;

  PwdFormState({
    this.account,
    this.password,
    this.isAccountValided,
    this.isPasswordValided,
  });

  factory PwdFormState.empty() {
    return PwdFormState(
      account: null,
      password: null,
      isAccountValided: false,
      isPasswordValided: false,
    );
  }

  PwdFormState update({
    String account,
    String password,
    bool isAccountValided,
    bool isPasswordValided,
  }) {
    return copyWith(
      account: account,
      password: password,
      isAccountValided: isAccountValided,
      isPasswordValided: isPasswordValided,
    );
  }

  PwdFormState copyWith({
    String account,
    String password,
    bool isAccountValided,
    bool isPasswordValided,
  }) {
    return PwdFormState(
      account: account ?? this.account,
      password: password ?? this.password,
      isAccountValided: isAccountValided ?? this.isAccountValided,
      isPasswordValided: isPasswordValided ?? this.isPasswordValided,
    );
  }

  @override
  List<Object> get props => [
    account,
    password,
    isAccountValided,
    isPasswordValided,
  ];
}
