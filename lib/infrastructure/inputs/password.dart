import 'package:formz/formz.dart';

// Define input validation errors
enum PasswordInputError { empty, length }

// Extend FormzInput and provide the input type and error type.
class Password extends FormzInput<String, PasswordInputError> {
  // Call super.pure to represent an unmodified form input.
  const Password.pure() : super.pure('');

  // Call super.dirty to represent a modified form input.
  const Password.dirty({String value = ''}) : super.dirty(value);

  String? get errorMessage {
    if (isValid || isPure) return null;

    if (displayError == PasswordInputError.empty) {
      return 'La contraseña no puede estar vacía';
    }

    if (displayError == PasswordInputError.length) {
      return 'Minimo 6 caracteres';
    }

    return 'Contraseña no válida';
  }

  // Override validator to handle validating a given input value.
  @override
  PasswordInputError? validator(String value) {
    if (value.isEmpty || value.trim().isEmpty) return PasswordInputError.empty;
    if (value.length < 6) return PasswordInputError.length;
    return null;
  }
}