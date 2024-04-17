import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:travel_indonesia_app/controllers/bookmark_controller.dart';
import 'package:travel_indonesia_app/controllers/destination_controller.dart';
import 'package:travel_indonesia_app/pages/detail_page.dart';
import 'package:travel_indonesia_app/utils/api.dart';
import 'package:travel_indonesia_app/widgets/card_place.dart';
import 'package:travel_indonesia_app/widgets/card_small_place.dart';
import 'package:http/http.dart' as http;

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  var currentIndex = 0;
  var httpClient = http.Client();

  BookmarkController bookmarkController = BookmarkController();

  @override
  void initState() {
    // bookmarkController.clearBookmark();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    DestinationController destinationController =
        DestinationController(httpClient);
    return Padding(
      padding: const EdgeInsets.only(top: 70, bottom: 0, left: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Opacity(
                opacity: 0.15,
                child: Image.asset(
                  'assets/images/main_illustration.png',
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Wonderful Indonesia",
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 28,
                        fontWeight: FontWeight.w800),
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
                  SizedBox(
                    width: double.infinity,
                    height: 240,
                    child: FutureBuilder(
                        future: destinationController.top(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          } else {
                            return ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: snapshot.data!.length,
                                itemBuilder: (context, index) {
                                  return Row(
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.push(context,
                                              MaterialPageRoute(
                                                  builder: (context) {
                                            return DetailPage(
                                              image: apiData.getImagePath(
                                                  snapshot.data![index].cover),
                                              title: snapshot.data![index].name,
                                              rate: snapshot.data![index].rate
                                                  .toString(),
                                              location: snapshot
                                                  .data![index].location,
                                              description: snapshot
                                                  .data![index].description,
                                            );
                                          }));
                                        },
                                        child: cardPlace(
                                          image: apiData.getImagePath(
                                              snapshot.data![index].cover),
                                          location:
                                              snapshot.data![index].location,
                                          rate: snapshot.data![index].rate
                                              .toString(),
                                          title: snapshot.data![index].name,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 15,
                                      )
                                    ],
                                  );
                                });
                          }
                        }),
                  )
                ],
              )
            ],
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
            child: FutureBuilder(
              future: destinationController.all(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return ListView.builder(
                      padding: const EdgeInsets.only(right: 20, bottom: 0),
                      scrollDirection: Axis.vertical,
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return DetailPage(
                                    image: apiData.getImagePath(
                                        snapshot.data![index].cover),
                                    title: snapshot.data![index].name,
                                    rate: snapshot.data![index].rate.toString(),
                                    location: snapshot.data![index].location,
                                    description:
                                        snapshot.data![index].description,
                                  );
                                }));
                              },
                              child: cardSmallPlace(
                                  image: apiData.getImagePath(
                                      snapshot.data![index].cover),
                                  location: snapshot.data![index].location,
                                  rating: snapshot.data![index].rate.toString(),
                                  title: snapshot.data![index].name),
                            ),
                            const SizedBox(
                              height: 15,
                            )
                          ],
                        );
                      });
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
