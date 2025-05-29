part of 'register_cubit.dart';

enum FormStatus { invalid, valid, validating }

class RegisterFormState extends Equatable {
  final FormStatus formStatus;
  final bool isValid;
  final Email email;
  final Username username;
  final Password password;

  const RegisterFormState( {
    this.isValid = false,
    this.formStatus = FormStatus.invalid,
    this.email = const Email.pure(),
    this.username = const Username.pure(),
    this.password = const Password.pure(),
  });

  RegisterFormState copyWith({
    FormStatus? formStatus,
    bool? isValid,
    Email? email,
    Username? username,
    Password? password,
  }) {
    return RegisterFormState(
      formStatus: formStatus ?? this.formStatus,
      isValid: isValid ?? this.isValid,
      email: email ?? this.email,
      username: username ?? this.username,
      password: password ?? this.password,
    );
  }

  @override
  List<Object> get props => [formStatus, isValid, email, username, password];
}
