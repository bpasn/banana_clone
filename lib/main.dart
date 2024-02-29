import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:banana_clone/app.dart';
import 'package:banana_clone/getx/init.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await getXinit();
  runApp(const MyApp());
}
