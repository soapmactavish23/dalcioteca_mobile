// ignore_for_file: use_build_context_synchronously

import 'package:brasil_fields/brasil_fields.dart';
import 'package:dalcioteca_mobile/core/components/forms/input_custom.dart';
import 'package:dalcioteca_mobile/core/components/utils/dialog_custom.dart';
import 'package:dalcioteca_mobile/core/constants/constants.dart';
import 'package:dalcioteca_mobile/core/provider/user/user_provider_impl.dart';
import 'package:dalcioteca_mobile/core/utils/msgs_custom.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:validatorless/validatorless.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  final formKey = GlobalKey<FormState>();
  final nameEC = TextEditingController();
  final contactEC = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    nameEC.dispose();
    contactEC.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<UserProviderImpl>();
    nameEC.text = provider.userLogged!.name;
    contactEC.text = provider.userLogged!.contact;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Editar Perfil'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                const Center(
                  child: CircleAvatar(
                    backgroundImage: AssetImage(ImageConstants.imageUser),
                    radius: 50,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                InputCustom(
                  controller: nameEC,
                  icon: const Icon(Icons.person),
                  label: 'Nome',
                  hintText: 'Digite seu nome',
                  maxLength: 50,
                  validator: Validatorless.multiple([
                    Validatorless.min(
                      3,
                      'O campo deve ter entre 3 a 50 caracteres',
                    ),
                    Validatorless.required('Campo obrigatório'),
                  ]),
                  onSaved: (value) {
                    provider.userLogged!.name = value!;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                const SizedBox(
                  height: 10,
                ),
                InputCustom(
                  controller: contactEC,
                  icon: const Icon(Icons.phone_android),
                  label: 'Contato',
                  hintText: 'Digite seu contato',
                  maxLength: 15,
                  textInputType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    TelefoneInputFormatter(),
                  ],
                  validator: Validatorless.required('Campo obrigatório'),
                  onSaved: (value) {
                    provider.userLogged!.contact = value!;
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          if (formKey.currentState!.validate()) {
            formKey.currentState!.save();
            DialogCustom.dialogLoading(context);
            await provider.editProfile().then((value) {
              Navigator.of(context).pop();
              DialogCustom.dialogSuccess(
                  context: context, msg: MsgsCustom.save);
            }).catchError((err) {
              Navigator.of(context).pop();
              DialogCustom.dialogError(context: context, msg: err);
            });
          }
        },
        child: const Icon(Icons.check),
      ),
    );
  }
}
