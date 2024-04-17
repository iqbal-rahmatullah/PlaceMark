import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:travel_indonesia_app/controllers/bookmark_controller.dart';
import 'package:travel_indonesia_app/controllers/destination_controller.dart';
import 'package:travel_indonesia_app/models/bookmark.dart';
import 'package:travel_indonesia_app/pages/detail_page.dart';
import 'package:travel_indonesia_app/pages/empty_page.dart';
import 'package:travel_indonesia_app/utils/api.dart';
import 'package:travel_indonesia_app/widgets/card_place.dart';
import 'package:travel_indonesia_app/widgets/card_small_place.dart';
import 'package:http/http.dart' as http;

class SavePage extends StatefulWidget {
  const SavePage({super.key});

  @override
  State<SavePage> createState() => _SavePageState();
}

class _SavePageState extends State<SavePage> {
  final BookmarkController bookmarkController = BookmarkController();

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 70, bottom: 10),
        child: Padding(
          padding: const EdgeInsets.only(right: 30, left: 30),
          child: FutureBuilder(
              future: bookmarkController.getAll(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return ValueListenableBuilder(
                      valueListenable:
                          Hive.box<Bookmark>('bookmark').listenable(),
                      builder: (
                        context,
                        Box<Bookmark> box,
                        _,
                      ) {
                        var bookmarks = box.values.toList();
                        if (box.isEmpty) {
                          return const EmptyPage();
                        }
                        return Stack(children: [
                          Opacity(
                            opacity: 0.2,
                            child: Image.asset(
                              // height: double.infinity,
                              'assets/images/bg_savepage.png',
                              // fit: BoxFit.fitHeight,
                            ),
                          ),
                          Column(
                            children: [
                              Container(
                                width: 225,
                                height: 200,
                                decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 227, 139, 142),
                                  borderRadius: BorderRadius.circular(80),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      offset: const Offset(0.0, 2.0),
                                      blurRadius: 10.0,
                                      spreadRadius: 2.0,
                                    ),
                                  ],
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      'assets/images/illustration_saved.webp',
                                      width: 130,
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text("${bookmarks.length} lokasi tersimpan",
                                        style: const TextStyle(
                                          fontFamily: 'Poppins',
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        )),
                                    const SizedBox(
                                      height: 15,
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 25,
                              ),
                              SizedBox(
                                height: 600,
                                child: ListView.builder(
                                    padding: const EdgeInsets.only(
                                        right: 20, bottom: 0),
                                    scrollDirection: Axis.vertical,
                                    itemCount: bookmarks.length,
                                    itemBuilder: (context, index) {
                                      return Column(
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              Navigator.push(context,
                                                  MaterialPageRoute(
                                                      builder: (context) {
                                                return DetailPage(
                                                  image: bookmarks[index].cover,
                                                  title: bookmarks[index].name,
                                                  rate: bookmarks[index]
                                                      .rate
                                                      .toString(),
                                                  location:
                                                      bookmarks[index].location,
                                                  description: bookmarks[index]
                                                      .description,
                                                );
                                              }));
                                            },
                                            child: Slidable(
                                              endActionPane: ActionPane(
                                                dismissible: DismissiblePane(
                                                    onDismissed: () {
                                                  bookmarkController
                                                      .deleteBookmark(
                                                          bookmarks[index].id);
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                    const SnackBar(
                                                      backgroundColor:
                                                          Colors.red,
                                                      content: Text(
                                                          "Delete trip successfully"),
                                                      duration:
                                                          Duration(seconds: 1),
                                                    ),
                                                  );
                                                }),
                                                motion: const ScrollMotion(),
                                                children: [
                                                  SlidableAction(
                                                    onPressed: (context) {
                                                      bookmarkController
                                                          .deleteBookmark(
                                                              bookmarks[index]
                                                                  .id);
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(
                                                        const SnackBar(
                                                          backgroundColor:
                                                              Colors.red,
                                                          content: Text(
                                                              "Delete trip successfully"),
                                                          duration: Duration(
                                                              seconds: 1),
                                                        ),
                                                      );
                                                    },
                                                    backgroundColor:
                                                        const Color(0xFFFE4A49),
                                                    foregroundColor:
                                                        Colors.white,
                                                    icon: Icons.delete,
                                                    label: 'Delete',
                                                  )
                                                ],
                                              ),
                                              key:
                                                  ValueKey(bookmarks[index].id),
                                              child: cardSmallPlace(
                                                image: bookmarks[index].cover,
                                                location:
                                                    bookmarks[index].location,
                                                rating: bookmarks[index]
                                                    .rate
                                                    .toString(),
                                                title: bookmarks[index].name,
                                                isDismiss: true,
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 15,
                                          )
                                        ],
                                      );
                                    }),
                              )
                            ],
                          ),
                        ]);
                      });
                }
              }),
        ));
  }
}
