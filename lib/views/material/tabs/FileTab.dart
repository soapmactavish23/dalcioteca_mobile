import 'package:dalcioteca_mobile/core/components/lists/not_found.dart';
import 'package:dalcioteca_mobile/core/components/utils/card_custom_icon.dart';
import 'package:dalcioteca_mobile/domain/provider/file/file_provider_impl.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class FileTab extends StatefulWidget {
  const FileTab({super.key});

  @override
  State<FileTab> createState() => _FileTabState();
}

class _FileTabState extends State<FileTab> {
  @override
  Widget build(BuildContext context) {
    final provider = context.watch<FileProviderImpl>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Arquivos'),
      ),
      body: ChangeNotifierProvider.value(
        value: provider,
        builder: (_, index) {
          if (provider.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (provider.list.isEmpty) {
            return const NotFound();
          }

          return ListView.builder(
            itemCount: provider.list.length,
            itemBuilder: (context, index) {
              final file = provider.list[index];
              return CardCustomIcon(
                title: file.name,
                icon: const Icon(Icons.file_copy),
                trailing: IconButton(
                  onPressed: () async {
                    launchUrl(Uri.parse(file.url));
                  },
                  icon: const Icon(Icons.download),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
