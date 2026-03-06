import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:link_shortener_app/features/home/presentation/home_controller.dart';
import 'package:link_shortener_app/features/home/presentation/widgets/alias_link_widget.dart';
import 'package:link_shortener_app/features/home/presentation/widgets/empty_list_widget.dart';
import 'package:link_shortener_app/features/home/presentation/widgets/input_link_widget.dart';
import 'package:link_shortener_app/features/home/presentation/widgets/loading_list_widget.dart';
import 'package:link_shortener_app/features/home/presentation/widgets/title_text.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.controller});
  final HomeController controller; // Mantenha seu HomeController aqui

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    // Sua lógica de init permanece a mesma
    widget.controller.getAliasList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(
        0xFFF8F9FA,
      ), // Um branco levemente acinzentado para menos cansaço visual
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5, // Leve sombra para dar profundidade
        title: const Text(
          "Encurtador",
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 30),
            InputLinkWidget(homeController: widget.controller),
            const SizedBox(height: 40),
            const TitleText(),
            const SizedBox(height: 16),
            Expanded(
              child: Obx(() {
                if (widget.controller.isListLoading.value) {
                  return const LoadingListWidget();
                }
                if (widget.controller.aliasList.isEmpty) {
                  return const EmptyListWidget();
                }
                return AliasLinkWidget(controller: widget.controller);
              }),
            ),
          ],
        ),
      ),
    );
  }
}
