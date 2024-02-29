import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppProvider {
  MultiProvider wrapProvider(Widget child) {
    return MultiProvider(
      providers: [],
      child: child,
    );
  }
}
