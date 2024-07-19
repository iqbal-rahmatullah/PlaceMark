import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:travel_indonesia_app/models/bookmark.dart';
import 'package:travel_indonesia_app/pages/main_page.dart';
import 'package:travel_indonesia_app/pages/saved_page.dart';
import 'package:travel_indonesia_app/pages/search_page.dart';
import 'package:travel_indonesia_app/widgets/navbar.dart';
import 'package:path_provider/path_provider.dart' as path;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final dir = await path.getApplicationDocumentsDirectory();

  Hive.init(dir.path);
  Hive.registerAdapter(BookmarkAdapter());

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
        resizeToAvoidBottomInset: false,
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
