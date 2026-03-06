import 'package:flutter/widgets.dart';
import 'package:link_shortener_app/features/home/factories/presentation/home_controller_factory.dart';
import 'package:link_shortener_app/features/home/presentation/home_screen.dart';

Widget homeScreenFactory() => HomeScreen(controller: homeControllerFactory());
