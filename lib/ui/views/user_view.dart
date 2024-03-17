import 'package:admin_dashboard/models/usuario.dart';
import 'package:admin_dashboard/providers/user_form_provider.dart';
import 'package:admin_dashboard/providers/users_provider.dart';
import 'package:admin_dashboard/services/navigation_service.dart';
import 'package:admin_dashboard/services/notification_service.dart';
import 'package:admin_dashboard/ui/inputs/custom_inputs.dart';
import 'package:admin_dashboard/ui/labels/custom_labels.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:file_picker/file_picker.dart';

import '../cards/white_card.dart';

class UserView extends StatefulWidget {
  const UserView({super.key, required this.uid});

  final String uid;

  @override
  State<UserView> createState() => _UserViewState();
}

class _UserViewState extends State<UserView> {
  Usuario? user;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    final usersProvider = Provider.of<UsersProvider>(context, listen: false);
    final userFormProvider = Provider.of<UserFormProvider>(context, listen: false);

    usersProvider.getUserById(widget.uid).then((userDb) {
      if (userDb != null) {
        userFormProvider.user = userDb;
        userFormProvider.formKey = GlobalKey<FormState>();

        setState(() {
          user = userDb;
        });
      } else {
        NavigationService.replaceTo('/dashboard/users');
      }
    });

    print('UserView: ${widget.uid}');
  }

  @override
  void dispose() {
    user = null;
    Provider.of<UserFormProvider>(context, listen: false).user = null;

    super.dispose();
  }

  //min 12
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: ListView(
        physics: const ClampingScrollPhysics(),
        children: [
          Text(
            'User View',
            style: CustomLabels.h1,
          ),
          const SizedBox(height: 10),
          if (user == null)
            WhiteCard(
              child: Container(
                height: 400,
                child: const Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            ),
          if (user != null) _UserViewBody(),

          //Text('${user?.nombre}'),
          // WhiteCard(
          //   title: 'User Page',
          //   child: Text(widget.uid),
          // )
        ],
      ),
    );
  }
}

class _UserViewBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Table(
        columnWidths: const {0: FixedColumnWidth(250)},
        children: const [
          TableRow(children: [
            //Tabla

            //Avatar
            _AvatarContainer(),

            //Fomulario
            _UserViewForm(),
          ])
        ],
      ),
    );
  }
}

class _UserViewForm extends StatelessWidget {
  const _UserViewForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final userFormProvider = Provider.of<UserFormProvider>(context);
    final user = userFormProvider.user!;

    return WhiteCard(
      title: 'Información general   ${user.correo}',
      child: Form(
        key: userFormProvider.formKey,
        autovalidateMode: AutovalidateMode.always,
        child: Column(
          children: [
            TextFormField(
              initialValue: user.nombre,
              decoration: CustomInputs.FormInputDecoration(
                  hintText: 'Nombre del Usuario',
                  icon: Icons.supervised_user_circle_outlined,
                  labelText: 'Nombre'),
              onChanged: (value) => userFormProvider.copyUserWith(nombre: value),
              validator: (value) {
                if (value == null || value.isEmpty) return 'Ingrese un nombre';
                if (value.length < 3) return 'El nombre debe de ser de 3 caracteres';
                return null;
              },
            ),
            const SizedBox(height: 20),
            TextFormField(
              initialValue: user.correo,
              decoration: CustomInputs.FormInputDecoration(
                  hintText: 'Correo del Usuario',
                  icon: Icons.mark_email_read_outlined,
                  labelText: 'Correo'),
              onChanged: (value) => userFormProvider.copyUserWith(correo: value),
              validator: (value) {
                if (!EmailValidator.validate(value ?? '')) return 'Email no valido!';
                return null;
              },
            ),
            const SizedBox(height: 20),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 120),
              child: ElevatedButton(
                onPressed: () async {
                  final saved = await userFormProvider.updateUser();

                  if (saved) {
                    NotificationsService.showSnackbar('Usuario actualizado');
                    // ignore: use_build_context_synchronously
                    Provider.of<UsersProvider>(context, listen: false).refreshUsers(user);
                    //Actualizar UsuariosProvider?????
                  } else {
                    NotificationsService.showSnackbarError('No se pudo actualizar');
                  }
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.indigo),
                  shadowColor: MaterialStateProperty.all(Colors.indigo),
                ),
                child: const Row(
                  children: [
                    Icon(
                      Icons.save_outlined,
                      size: 20,
                    ),
                    Text('   Guardar'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _AvatarContainer extends StatelessWidget {
  const _AvatarContainer();

  @override
  Widget build(BuildContext context) {
    final userFormProvider = Provider.of<UserFormProvider>(context);
    final user = userFormProvider.user!;
    final image = (user.img == null)
        ? const Image(
            image: AssetImage('noimage.jpg'),
          )
        : FadeInImage.assetNetwork(placeholder: 'loader.gif', image: user.img!);

    return WhiteCard(
      width: 250,
      child: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Profile',
              style: CustomLabels.h2,
            ),
            const SizedBox(height: 20),
            Container(
              width: 150,
              height: 160,
              child: Stack(
                children: [
                  ClipOval(
                    child: image,
                  ),
                  Positioned(
                    bottom: 5,
                    right: 5,
                    child: Container(
                        width: 45,
                        height: 45,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            border: Border.all(color: Colors.white, width: 5)),
                        child: FloatingActionButton(
                          backgroundColor: Colors.indigo,
                          elevation: 0,
                          onPressed: () async {
                            FilePickerResult? result = await FilePicker.platform.pickFiles();

                            if (result != null) {
                              // PlatformFile file = result.files.first;

                              // print(file.name);
                              // print(file.bytes);
                              // print(file.size);
                              // print(file.extension);
                              //print('subiendo imagen...');

                              NotificationsService.showBusyIndicator(context);

                              final newUser = await userFormProvider.uploadImage(
                                  '/uploads/usuarios/${user.uid}', result.files.first.bytes!);

                              Provider.of<UsersProvider>(context, listen: false)
                                  .refreshUsers(newUser);

                              Navigator.of(context).pop();

                              //print(resp.img);
                            } else {
                              // User canceled the picker
                              print('NO hay imagen');
                            }
                          },
                          child: const Icon(Icons.camera_alt_outlined, size: 20),
                        )),
                  )
                ],
              ),
            ),
            const SizedBox(height: 20),
            Text(
              user.nombre,
              style: const TextStyle(fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
