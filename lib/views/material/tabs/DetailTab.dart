import 'package:dalcioteca_mobile/domain/provider/material/material_provider_impl.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailTab extends StatelessWidget {
  const DetailTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalhes'),
      ),
      body: Consumer<MaterialProviderImpl>(
        builder: (context, provider, __) {
          final material = provider.obj;
          return Column(
            children: [
              Visibility(
                visible: material.url != null,
                child: Image.network(
                  material.url!,
                  fit: BoxFit.cover,
                  height: 300,
                  width: double.infinity,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
                child: Column(
                  children: [
                    Text(
                      material.name,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                       height: 12,
                    ),
                    Text(
                      material.categoryModel.description,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  material.description,
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
