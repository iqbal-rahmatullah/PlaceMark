import 'package:flutter/material.dart';
import 'package:travel_indonesia_app/pages/detail_page.dart';
import 'package:travel_indonesia_app/pages/main_page.dart';
import 'package:travel_indonesia_app/pages/saved_page.dart';
import 'package:travel_indonesia_app/pages/search_page.dart';
import 'package:travel_indonesia_app/widgets/navbar.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  var pages = [
    const MainPage(),
    const SearchPage(),
    const SavePage(),
  ];
  int currentIndex = BottomNavbar.currentIndex;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color(0xffF6F6F6),
        body: Stack(
          children: [
            IndexedStack(
              index: BottomNavbar.currentIndex,
              children: pages,
            ),
            BottomNavbar(
              reload: () {
                setState(() {});
              },
            )
          ],
        ),
        // body: const DetailPage(),
      ),
    );
  }
}
