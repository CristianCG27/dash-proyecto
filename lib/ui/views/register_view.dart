import 'package:admin_dashboard/providers/auth_provider.dart';
import 'package:admin_dashboard/providers/register_form_provider.dart';
import 'package:admin_dashboard/router/router.dart';
import 'package:admin_dashboard/ui/buttons/custom_outlined_button.dart';
import 'package:admin_dashboard/ui/buttons/link_text.dart';
import 'package:admin_dashboard/ui/inputs/custom_inputs.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => RegisterFormProvider(),
      child: Builder(
        builder: (context) {
          final registerFormProvider =
              Provider.of<RegisterFormProvider>(context, listen: false);
          return Container(
            margin: const EdgeInsets.only(top: 50),
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 370),
                child: Form(
                  //autovalidateMode: AutovalidateMode.always,
                  key: registerFormProvider.formKey,
                  child: Column(
                    children: [
                      //Nombre
                      TextFormField(
                        //validator: ,
                        onChanged: (value) => registerFormProvider.name = value,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'El nombre es obligatorio';
                          } else {
                            return null;
                          }
                        },

                        style: const TextStyle(
                          color: Colors.white,
                        ),
                        decoration: CustomInputs.loginInputStyle(
                          hintText: 'Ingrese su nombre',
                          labelText: 'Nombre',
                          icon: Icons.person_sharp,
                        ),
                      ),
                      const SizedBox(height: 20),

                      // Email
                      TextFormField(
                        //validator: ,
                        onChanged: (value) =>
                            registerFormProvider.email = value,
                        validator: (value) {
                          if (!EmailValidator.validate(value ?? '')) {
                            return 'Email no valido!';
                          } else {
                            return null;
                          }
                        },

                        style: const TextStyle(
                          color: Colors.white,
                        ),
                        decoration: CustomInputs.loginInputStyle(
                          hintText: 'Ingrese su correo',
                          labelText: 'Email',
                          icon: Icons.email_outlined,
                        ),
                      ),

                      const SizedBox(height: 20),
                      // Password

                      TextFormField(
                        //validator: ,
                        onChanged: (value) =>
                            registerFormProvider.password = value,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Ingrese la contraseña';
                          }
                          if (value.length < 6) {
                            return 'La contraseña debe ser mayor a 6 caracteres';
                          }

                          return null;
                        },
                        obscureText: true,
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                        decoration: CustomInputs.loginInputStyle(
                          hintText: '*********',
                          labelText: 'Contraseña',
                          icon: Icons.lock_outline_rounded,
                        ),
                      ),
                      const SizedBox(height: 20),

                      //Boton
                      CustomOutlinedButton(
                        onPressed: () {
                          //Navigator.pushNamed(context, Flurorouter.loginRoute);
                          final validForm = registerFormProvider.validateForm();
                          if (!validForm) return;

                          final authProvider =
                              Provider.of<AuthProvider>(context, listen: false);
                          authProvider.register(
                              registerFormProvider.email,
                              registerFormProvider.password,
                              registerFormProvider.name);
                        },
                        text: 'Registrar',
                      ), //color: Colors.red),

                      const SizedBox(height: 20),

                      LinkText(
                        text: 'Ir a Login',
                        onPress: () {
                          Navigator.pushReplacementNamed(
                              context, Flurorouter.loginRoute);
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
