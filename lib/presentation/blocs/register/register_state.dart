part of 'register_cubit.dart';

enum FormStatus { invalid, valid, validating }

class RegisterFormState extends Equatable {
  final FormStatus formStatus;
  final String email;
  final String username;
  final String password;

  const RegisterFormState({
    this.formStatus = FormStatus.invalid,
    this.email = '',
    this.username = '',
    this.password = '',
  });

  RegisterFormState copyWith({
    FormStatus? formStatus,
    String? email,
    String? username,
    String? password,
  }) {
    return RegisterFormState(
      formStatus: formStatus ?? this.formStatus,
      email: email ?? this.email,
      username: username ?? this.username,
      password: password ?? this.password,
    );
  }

  @override
  List<Object> get props => [formStatus, email, username, password];
}
