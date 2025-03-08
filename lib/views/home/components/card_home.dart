import 'package:dalcioteca_mobile/core/constants/constants.dart';
import 'package:dalcioteca_mobile/domain/models/material_model.dart';
import 'package:flutter/material.dart';

class CardHome extends StatelessWidget {
  final MaterialModel material;
  final void Function()? onTap;
  
  const CardHome({super.key, required this.material, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        elevation: 3,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(12)),
                child: material.url != null
                    ? Image.network(
                        material.url!,
                        fit: BoxFit.cover,
                        width: double.infinity,
                      )
                    : Image.asset(
                        ImageConstants.logo,
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                material.name,
                style: const TextStyle(fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
