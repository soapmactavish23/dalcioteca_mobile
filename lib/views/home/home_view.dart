import 'package:dalcioteca_mobile/core/components/lists/not_found.dart';
import 'package:dalcioteca_mobile/core/components/utils/app_bar_custom.dart';
import 'package:dalcioteca_mobile/domain/provider/material/material_provider_impl.dart';
import 'package:dalcioteca_mobile/views/home/components/card_home.dart';
import 'package:dalcioteca_mobile/views/home/components/search_component.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final filterEC = TextEditingController();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timestamp) {
      final provider = context.read<MaterialProviderImpl>();
      provider.search();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<MaterialProviderImpl>();

    return Scaffold(
      appBar: AppBarCustom.getDefault(
        title: 'Dalcioteca em Rede',
        centerTitle: false,
        context: context,
        actions: const [
          SearchComponent(),
        ],
      ),
      body: ChangeNotifierProvider.value(
        value: provider,
        child: Consumer<MaterialProviderImpl>(
          builder: (context, provider, child) {
            if (provider.loading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (provider.list.isEmpty) {
              return const NotFound();
            }

            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 1,
                ),
                itemCount: provider.list.length,
                itemBuilder: (context, index) {
                  final material = provider.list[index];

                  return CardHome(
                    material: material,
                    onTap: () {},
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
