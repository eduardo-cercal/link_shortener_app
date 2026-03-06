import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:link_shortener_app/features/home/presentation/home_controller.dart';

class AliasLinkWidget extends StatelessWidget {
  const AliasLinkWidget({super.key, required this.controller});
  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      // Builder puro fica mais limpo com Cards
      itemCount: controller.aliasList.length,
      itemBuilder: (context, index) {
        final item = controller.aliasList[index];
        return Card(
          elevation: 0,
          margin: const EdgeInsets.only(bottom: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: BorderSide(color: Colors.grey.shade200),
          ),
          child: ListTile(
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 8,
            ),
            title: Text(
              item.link.short,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
              ),
            ),
            subtitle: Text(
              item.link.self,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: Colors.grey.shade600),
            ),
            trailing: IconButton(
              icon: const Icon(Icons.copy_rounded, size: 20),
              onPressed: () {
                Clipboard.setData(ClipboardData(text: item.link.short));
                Get.rawSnackbar(message: "Link copiado!");
              },
            ),
            onTap: () => controller.navigateToLink(item.link.self),
          ),
        );
      },
    );
  }
}
