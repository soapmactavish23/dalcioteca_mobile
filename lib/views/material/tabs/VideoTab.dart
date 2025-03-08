// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:dalcioteca_mobile/core/components/utils/card_custom_icon.dart';
import 'package:dalcioteca_mobile/core/constants/constants.dart';
import 'package:dalcioteca_mobile/domain/models/video_model.dart';
import 'package:dalcioteca_mobile/domain/provider/material/material_provider_impl.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class VideoTab extends StatelessWidget {
  const VideoTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Vídeos'),
      ),
      body: Consumer<MaterialProviderImpl>(builder: (context, provider, __) {
        List<VideoModel> videos = provider.obj.videos;
        return ListView.builder(
          itemCount: videos.length,
          itemBuilder: (_, index) {
            final video = videos[index];
            return CardCustomIcon(
              icon: const Icon(
                Icons.video_call,
                size: 24,
                color: ColorsConstants.defaultColor,
              ),
              title: video.description,
              trailing: IconButton(
                  onPressed: () {
                    launchUrl(Uri.parse(video.url));
                  },
                  icon: const Icon(
                    Icons.play_arrow_rounded,
                    color: ColorsConstants.defaultColor,
                  )),
            );
          },
        );
      }),
    );
  }
}
