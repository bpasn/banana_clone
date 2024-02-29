import 'package:flutter/material.dart';
import 'package:banana_clone/models/modal_nav.dart';
import 'package:banana_clone/routes/router_app.dart';
import 'package:banana_clone/widgets/app_bar.dart';
import 'package:banana_clone/widgets/bottom_bar.dart';
import 'package:banana_clone/screens/account/screen/account_screen.dart';
import 'package:banana_clone/screens/cart/screen/cart_screen.dart';
import 'package:banana_clone/screens/categories/screen/categories_screen.dart';
import 'package:banana_clone/screens/home/screen/home_screen.dart';
import 'package:banana_clone/constructor/theme.dart';
import 'package:banana_clone/widgets/floating_bar.dart';
import 'package:get/get.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final homeScreen = GlobalKey<NavigatorState>();
  final categoriesScreen = GlobalKey<NavigatorState>();
  final cartScreen = GlobalKey<NavigatorState>();
  final accountScreen = GlobalKey<NavigatorState>();
  int selectedTap = 0;

  bool keyboardOpen = false;

  List<ModalNav> navItem = [];
  @override
  void initState() {
    super.initState();
    navItem = [
      ModalNav(page: const HomeScreen(), key: homeScreen),
      ModalNav(page: const CategoriesScreen(), key: categoriesScreen),
      ModalNav(page: const CartScreen(), key: cartScreen),
      ModalNav(page: const AccountScreen(), key: accountScreen),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: setTheme(),
      initialRoute: RouterApp.init,
      getPages: RouterApp.routes,
      home: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: generateAppBar(context),
          body: IndexedStack(
            index: selectedTap,
            children: generateWidget(),
          ),
          bottomNavigationBar: BottomBar(
            page: selectedTap,
            onTab: onTabButtonBar,
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.miniCenterDocked,
          floatingActionButton: const FloatingButtonBar()),
    );
  }

  generateWidget() {
    return navItem
        .map(
          (ModalNav page) => Navigator(
            key: page.key,
            onGenerateInitialRoutes: (navigator, initialRoute) =>
                [MaterialPageRoute(builder: (_) => page.page)],
          ),
        )
        .toList();
  }

  onTabButtonBar(int index) {
    if (index == selectedTap) {
      navItem[index].key.currentState?.popUntil((route) => route.isFirst);
    } else {
      setState(() {
        selectedTap = index;
      });
    }
  }
}
