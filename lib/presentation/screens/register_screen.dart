import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_app/presentation/blocs/register/register_cubit.dart';
import 'package:forms_app/presentation/widgets/widgets.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Nuevo usuario')),
      body: BlocProvider(
        create: (context) => RegisterCubit(),
        child: _RegisterView(),
      ),
    );
  }
}

class _RegisterView extends StatelessWidget {
  const _RegisterView();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
            children: const [
              FlutterLogo(size: 100),

              _RegisterForm(),

              SizedBox(height: 20),

              //   SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

class _RegisterForm extends StatelessWidget {
  const _RegisterForm();

  @override
  Widget build(BuildContext context) {
    final registerCubit = context.watch<RegisterCubit>();
    final username = registerCubit.state.username;
    final password = registerCubit.state.password;

    return Form(
      child: Column(
        children: [
          const SizedBox(height: 10),
          CustomTextFormField(
            label: 'Nombre de usuario',
            onChanged: registerCubit.usernameChanged,
            errorMessage: username.errorMessage,
          ),
          const SizedBox(height: 10),
          CustomTextFormField(
            label: 'Correo electrónico',
            onChanged: (value) {
              registerCubit.emailChanged(value);
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'El correo electrónico es obligatorio';
              }
              if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                return 'El correo electrónico no es válido';
              }
              return null;
            },
          ),
          const SizedBox(height: 10),
          CustomTextFormField(
            label: 'Contraseña',
            obscureText: true,
            onChanged: registerCubit.passwordChanged,
            errorMessage: password.errorMessage,
          ),
          const SizedBox(height: 10),

          FilledButton.tonalIcon(
            onPressed: () {
              registerCubit.onSubmit();
            },
            icon: Icon(Icons.save),
            label: Text('Crear usuario'),
          ),
        ],
      ),
    );
  }
}
