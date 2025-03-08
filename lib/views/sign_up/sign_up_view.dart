// ignore_for_file: use_build_context_synchronously

import 'package:brasil_fields/brasil_fields.dart';
import 'package:dalcioteca_mobile/core/auth/models/dto/profile_register_dto.dart';
import 'package:dalcioteca_mobile/core/components/forms/buttom_custom.dart';
import 'package:dalcioteca_mobile/core/components/forms/input_custom.dart';
import 'package:dalcioteca_mobile/core/components/utils/dialog_custom.dart';
import 'package:dalcioteca_mobile/core/provider/user/user_provider_impl.dart';
import 'package:dalcioteca_mobile/core/routes/router_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:validatorless/validatorless.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final nameEC = TextEditingController();
  final emailEC = TextEditingController();
  final cpfEC = TextEditingController();
  final contactEC = TextEditingController();
  final passwordEC = TextEditingController();
  final confirmEC = TextEditingController();
  final formKey = GlobalKey<FormState>();

  ProfileRegisterDto dto = ProfileRegisterDto.empty();

  @override
  void dispose() {
    super.dispose();
    nameEC.dispose();
    emailEC.dispose();
    cpfEC.dispose();
    contactEC.dispose();
    passwordEC.dispose();
    confirmEC.dispose();
  }

  @override
  Widget build(BuildContext context) {

    Future<void> register() async {
      await context.read<UserProviderImpl>().signUp(dto).then((value) {
        Navigator.of(context).pop();
        Navigator.of(context).pushNamedAndRemoveUntil(
          RouterName.baseRoute,
          (route) => false,
        );
      }).catchError((err) {
        Navigator.of(context).pop();

        DialogCustom.dialogError(
          context: context,
          msg: 'Erro ao registrar usuário',
        );
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastrar-se'),
      ),
      body: SingleChildScrollView(
        child: Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  InputCustom(
                    controller: nameEC,
                    icon: const Icon(Icons.person),
                    label: 'Nome',
                    hintText: 'Digite o nome',
                    maxLength: 50,
                    validator: Validatorless.required('Campo obrigatório'),
                    onSaved: (value) {
                      dto.name = value!;
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  InputCustom(
                    controller: emailEC,
                    icon: const Icon(Icons.email),
                    label: 'E-mail',
                    textInputType: TextInputType.emailAddress,
                    hintText: 'Digite o E-mail',
                    maxLength: 50,
                    validator: Validatorless.multiple([
                      Validatorless.email('E-mail inválido'),
                      Validatorless.required('Campo obrigatório'),
                    ]),
                    onSaved: (value) {
                      dto.email = value!;
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
                    icon: const Icon(Icons.phone),
                    label: 'Contato',
                    maxLength: 15,
                    textInputType: TextInputType.number,
                    hintText: 'Digite o Contato',
                    validator: Validatorless.required('Campo obrigatório'),
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      TelefoneInputFormatter(),
                    ],
                    onSaved: (value) {
                      dto.contact = value!;
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  InputCustom(
                    controller: passwordEC,
                    icon: const Icon(Icons.lock),
                    label: 'Senha',
                    obscureText: true,
                    hintText: 'Digite a Senha',
                    maxLength: 150,
                    validator: Validatorless.required('Campo obrigatório'),
                    onSaved: (value) {
                      dto.password = value!;
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  InputCustom(
                    controller: confirmEC,
                    icon: const Icon(Icons.lock_outline),
                    label: 'Confirmar Senha',
                    obscureText: true,
                    hintText: 'Confirme a Senha',
                    maxLength: 150,
                    validator: Validatorless.multiple([
                      Validatorless.required('Campo obrigatório'),
                      Validatorless.compare(
                          passwordEC, 'As senhas devem ser iguais'),
                    ]),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  ButtomCustom(
                    label: 'Salvar',
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
                        DialogCustom.dialogLoading(context);
                        formKey.currentState!.save();
                        register();
                      }
                    },
                  )
                ],
              ),
            )),
      ),
    );
  }
}
