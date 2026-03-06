import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:link_shortener_app/features/home/presentation/home_controller.dart';

class InputLinkWidget extends StatelessWidget {
  InputLinkWidget({super.key, required this.homeController});
  final HomeController homeController;
  final textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: .05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      padding: const EdgeInsets.all(8),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: textController,
              decoration: const InputDecoration(
                hintText: 'Cole seu link aqui...',
                hintStyle: TextStyle(color: Colors.grey),
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(horizontal: 16),
              ),
            ),
          ),
          Obx(
            () => Material(
              color: Colors.blueAccent, // Cor de destaque
              borderRadius: BorderRadius.circular(12),
              child: InkWell(
                borderRadius: BorderRadius.circular(12),
                onTap: homeController.isCreateAliasLoading.value
                    ? null
                    : () {
                        homeController.createAlias(textController.text);
                        textController.clear();
                        FocusScope.of(context).unfocus();
                      },
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: homeController.isCreateAliasLoading.value
                      ? const SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(
                            color: Colors.white,
                            strokeWidth: 2,
                          ),
                        )
                      : const Icon(
                          Icons.bolt_rounded,
                          color: Colors.white,
                        ), // Ícone mais "moderno"
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
