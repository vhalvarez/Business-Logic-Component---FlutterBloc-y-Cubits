import 'package:formz/formz.dart';

// Define input validation errors
enum EmailInputError { empty, format }

// Extend FormzInput and provide the input type and error type.
class Email extends FormzInput<String, EmailInputError> {
  // Call super.pure to represent an unmodified form input.
  const Email.pure() : super.pure('');

  // Call super.dirty to represent a modified form input.
  const Email.dirty({String value = ''}) : super.dirty(value);

  static final RegExp _emailRegex = RegExp(
    r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
  );

  String? get errorMessage {
    if (isValid || isPure) return null;

    if (displayError == EmailInputError.empty) {
      return 'El correo electrónico no puede estar vacío';
    }

    if (displayError == EmailInputError.format) {
      return 'El formato del correo electrónico no es válido';
    }

    return 'Correo electrónico no válido';
  }

  // Override validator to handle validating a given input value.
  @override
  EmailInputError? validator(String value) {
    if (value.isEmpty || value.trim().isEmpty) return EmailInputError.empty;

    if (!_emailRegex.hasMatch(value)) return EmailInputError.format;

    return null;
  }
}
