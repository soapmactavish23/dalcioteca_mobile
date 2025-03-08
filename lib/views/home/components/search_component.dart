import 'package:dalcioteca_mobile/core/components/forms/input_custom.dart';
import 'package:dalcioteca_mobile/core/components/utils/dialog_custom.dart';
import 'package:dalcioteca_mobile/domain/provider/material/material_provider_impl.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchComponent extends StatefulWidget {
  const SearchComponent({super.key});

  @override
  State<SearchComponent> createState() => _SearchComponentState();
}

class _SearchComponentState extends State<SearchComponent> {
  final filterEC = TextEditingController();

  @override
  void dispose() {
    filterEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.search),
      onPressed: () {
        DialogCustom.dialogComponent(
          context: context,
          title: 'Pesquisar',
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              InputCustom(
                controller: filterEC,
                icon: const Icon(Icons.search),
                hintText: 'Buscar...',
                label: "Pesquisar",
              )
            ],
          ),
          onPressed: () {
            context.read<MaterialProviderImpl>().search(name: filterEC.text);
            Navigator.pop(context);
          },
        );
      },
    );
  }
}
