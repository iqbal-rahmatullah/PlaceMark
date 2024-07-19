import 'package:flutter/material.dart';
import 'package:travel_indonesia_app/controllers/bookmark_controller.dart';
import 'package:travel_indonesia_app/models/bookmark.dart';

class DetailPage extends StatefulWidget {
  final String image;
  final String title;
  final String location;
  final String rate;
  final String description;

  const DetailPage(
      {super.key,
      required this.image,
      required this.title,
      required this.location,
      required this.rate,
      required this.description});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  final BookmarkController bookmarkController = BookmarkController();
  bool isBookmarked = false;

  @override
  void initState() {
    super.initState();
    checkBookmark();
  }

  void checkBookmark() async {
    List<Bookmark> bookmarks = await bookmarkController.getAll();
    setState(() {
      isBookmarked = bookmarks.any((bookmark) => bookmark.name == widget.title);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.network(
            widget.image,
            fit: BoxFit.cover,
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.6,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.5,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.title,
                        style: const TextStyle(
                            fontFamily: 'poppins',
                            fontSize: 22,
                            fontWeight: FontWeight.w700),
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.star_rate_rounded,
                            color: Color(0xffEE684A),
                            size: 20,
                          ),
                          Text(
                            widget.rate,
                            style: const TextStyle(
                                fontFamily: 'poppins',
                                color: Color(0xff6F7789),
                                fontSize: 14,
                                fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.location_on,
                        color: Color(0xffEE684A),
                        size: 20,
                      ),
                      Text(widget.location,
                          style: const TextStyle(
                            fontFamily: 'poppins',
                            color: Color(0xff6F7789),
                            fontSize: 14,
                          ))
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Divider(),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text("Description",
                      style: TextStyle(
                          fontFamily: 'poppins',
                          fontSize: 18,
                          fontWeight: FontWeight.w700)),
                  const SizedBox(
                    height: 3,
                  ),
                  Text(
                    widget.description,
                    style: const TextStyle(
                      fontFamily: 'poppins',
                      color: Color(0xff6F7789),
                      fontSize: 14,
                    ),
                  )
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(vertical: 25, horizontal: 40),
              child: FloatingActionButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                backgroundColor:
                    isBookmarked ? Colors.grey : const Color(0xffF36D72),
                onPressed: isBookmarked
                    ? null
                    : () {
                        bookmarkController.addBookmark(Bookmark(
                          id: 0,
                          name: widget.title,
                          cover: widget.image,
                          rate: double.parse(widget.rate),
                          location: widget.location,
                          description: widget.description,
                        ));

                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            backgroundColor: Colors.green,
                            content: Text("Saved to your trip"),
                            duration: Duration(seconds: 1),
                          ),
                        );
                        setState(() {
                          isBookmarked = true;
                        });
                      },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      (isBookmarked)
                          ? Icons.bookmark_added
                          : Icons.bookmark_add,
                      color: Colors.white,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      (isBookmarked) ? "Telah tersimpan" : "Save to your trip",
                      style: const TextStyle(
                        fontFamily: 'poppins',
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 35),
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back_ios),
                  iconSize: 18,
                  splashColor: Colors.grey,
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
