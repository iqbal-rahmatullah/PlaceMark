import 'package:flutter/material.dart';

class BottomNavbar extends StatefulWidget {
  static int currentIndex = 0;
  final void Function() reload;
  const BottomNavbar({super.key, required this.reload});

  @override
  State<BottomNavbar> createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  var navbars = [
    {
      "icon": Icons.home,
      "icon_unselected": Icons.home_outlined,
    },
    {
      "icon": Icons.location_on,
      "icon_unselected": Icons.location_on_outlined,
    },
    {
      "icon": Icons.bookmark,
      "icon_unselected": Icons.bookmark_outline,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Positioned(
        left: 0,
        right: 0,
        bottom: 20,
        child: Container(
          margin: const EdgeInsets.only(right: 40, left: 40, bottom: 20),
          height: 75,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(50),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 10,
                spreadRadius: 5,
              ),
            ],
          ),
          child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: navbars.map((icon) {
                bool isSelected =
                    navbars.indexOf(icon) == BottomNavbar.currentIndex;
                return Material(
                  color: Colors.transparent,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        BottomNavbar.currentIndex = navbars.indexOf(icon);
                      });
                      widget.reload();
                    },
                    child: AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        margin: const EdgeInsets.only(
                            bottom: 0, left: 35, right: 35),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: isSelected
                                  ? Colors.white
                                  : Colors.transparent,
                              width: 3,
                            ),
                          ),
                        ),
                        padding: const EdgeInsets.only(bottom: 5),
                        child: Icon(
                          isSelected ? icon["icon"] : icon["icon_unselected"],
                          color: isSelected ? Colors.white : Colors.white,
                          size: 30,
                        )),
                  ),
                );
              }).toList()),
        ));
  }
}
