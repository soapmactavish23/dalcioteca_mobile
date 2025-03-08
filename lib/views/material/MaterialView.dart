import 'package:dalcioteca_mobile/core/constants/constants.dart';
import 'package:dalcioteca_mobile/views/material/tabs/DetailTab.dart';
import 'package:dalcioteca_mobile/views/material/tabs/FileTab.dart';
import 'package:dalcioteca_mobile/views/material/tabs/VideoTab.dart';
import 'package:flutter/material.dart';

class MaterialView extends StatefulWidget {
  const MaterialView({super.key});

  @override
  State<MaterialView> createState() => _MaterialViewState();
}

class _MaterialViewState extends State<MaterialView> {
  List<Widget> tabs = const [
    DetailTab(),
    VideoTab(),
    FileTab(),
  ];

  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[index],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        backgroundColor: ColorsConstants.defaultColor,
        onTap: (index) {
          setState(() {
            this.index = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Detalhes',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.video_library),
            label: 'Vídeos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.folder),
            label: 'Arquivos',
          ),
        ],
      ),
    );
  }
}
