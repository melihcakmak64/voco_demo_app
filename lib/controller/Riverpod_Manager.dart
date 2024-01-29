import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:voco_demo/controller/Auth_Riverpod.dart';
import 'package:voco_demo/controller/HomePage_Riverpod.dart';

final authController = ChangeNotifierProvider((_) => AuthController());
final homeController = ChangeNotifierProvider((_) => HomePageController());
