import 'package:app_lol/components/custom_nav_bar.dart';
import 'package:app_lol/components/top_nav_bar.dart';
import 'package:app_lol/screens/calculator/calculator_page.dart';
import 'package:app_lol/screens/champions/champions_page.dart';
import 'package:app_lol/screens/home/home.dart';
import 'package:app_lol/screens/statistics/statistics_page.dart';
import 'package:app_lol/screens/wiki/wiki.dart';
import 'package:flutter/material.dart';

class ConfigApp extends StatefulWidget {
  const ConfigApp({super.key});

  @override
  State<ConfigApp> createState() => _ConfigAppState();
}

class _ConfigAppState extends State<ConfigApp> {
  String selectedRouter = '/home-page';
  final _pageController = PageController();

  void _handleNavigation(String newRoute) {
    setState(() {
      selectedRouter = newRoute;
    });
    switch (newRoute) {
      case '/home-page':
        _pageController.jumpToPage(0);
        break;
      case '/statistics-page':
        _pageController.jumpToPage(1);
        break;
      case '/champions-page':
        _pageController.jumpToPage(2);
        break;
      case '/calculator-page':
        _pageController.jumpToPage(3);
        break;
      case '/wiki-page':
        _pageController.jumpToPage(4);
        break;
      default:
        _pageController.jumpToPage(0);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60), 
        child: TopNavBar()),
        bottomNavigationBar: CustomNavBar(
        selectedRouter: selectedRouter,
        routeCallBack: (route) {
          _handleNavigation(route);
        },
      ),
      body: PageView(
        controller: _pageController,
        children: const [
          HomePage(),
          StatisticsPage(),
          ChampionsPage(),
          CalculatorPage(),
          WikiPage(),
        ],
      ),
    );
  }
}
