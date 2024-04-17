import 'package:flutter/material.dart';

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
                    borderRadius: BorderRadius.circular(50)),
                backgroundColor: const Color(0xffF36D72),
                onPressed: () {},
                child: const Text(
                  "Save to your trip",
                  style: TextStyle(
                      fontFamily: 'poppins',
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
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
