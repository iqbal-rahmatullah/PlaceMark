import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:travel_indonesia_app/widgets/card_place.dart';
import 'package:travel_indonesia_app/widgets/card_small_place.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  var currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 70, bottom: 0, left: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Wonderful Indonesia",
            style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 28,
                fontWeight: FontWeight.w900),
          ),
          const Text(
            "Let’s Explore Together",
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Color(0xff6F7789),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: [
          //     const Text(
          //       "Top Place",
          //       style: TextStyle(
          //         fontFamily: 'poppins',
          //         fontSize: 20,
          //         fontWeight: FontWeight.w500,
          //       ),
          //     ),
          //     Padding(
          //       padding: const EdgeInsets.only(right: 5),
          //       child: TextButton(
          //         onPressed: () {},
          //         child: const Text("See All",
          //             style: TextStyle(
          //               fontFamily: 'poppins',
          //               fontSize: 14,
          //               fontWeight: FontWeight.w500,
          //               color: Color(0xff6F7789),
          //             )),
          //       ),
          //     ),
          //   ],
          // ),

          SizedBox(
            width: double.infinity,
            height: 240,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 2,
                itemBuilder: (context, index) {
                  return Row(
                    children: [
                      cardPlace("assets/images/semeru.jpg", "Gunung Semeru",
                          "Lumajang, Jawa Timur"),
                      const SizedBox(
                        width: 15,
                      )
                    ],
                  );
                }),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Top Place",
                style: TextStyle(
                  fontFamily: 'poppins',
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: TextButton(
                  onPressed: () {},
                  child: const Text("See All",
                      style: TextStyle(
                        fontFamily: 'poppins',
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff6F7789),
                      )),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
              child: ListView.builder(
                  padding: const EdgeInsets.only(right: 20, bottom: 0),
                  scrollDirection: Axis.vertical,
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        cardSmallPlace("assets/images/semeru.jpg",
                            "Gunung Semeru", "Denpasar, Bali"),
                        const SizedBox(
                          height: 15,
                        )
                      ],
                    );
                  }))
        ],
      ),
    );
  }
}
