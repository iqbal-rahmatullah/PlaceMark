import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          "assets/images/semeru.jpg",
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
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Gunung Semeru",
                      style: TextStyle(
                          fontFamily: 'poppins',
                          fontSize: 22,
                          fontWeight: FontWeight.w700),
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.star_rate_rounded,
                          color: Color(0xffEE684A),
                          size: 20,
                        ),
                        Text(
                          "4.8",
                          style: TextStyle(
                              fontFamily: 'poppins',
                              color: Color(0xff6F7789),
                              fontSize: 14,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.location_on,
                      color: Color(0xffEE684A),
                      size: 20,
                    ),
                    Text("Malang, Jawa Timur",
                        style: TextStyle(
                          fontFamily: 'poppins',
                          color: Color(0xff6F7789),
                          fontSize: 14,
                        ))
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Divider(),
                SizedBox(
                  height: 5,
                ),
                Text("Description",
                    style: TextStyle(
                        fontFamily: 'poppins',
                        fontSize: 18,
                        fontWeight: FontWeight.w700)),
                SizedBox(
                  height: 3,
                ),
                Text(
                  "Gunung Semeru adalah gunung berapi tertinggi di Pulau Jawa, Indonesia, dengan ketinggian 3.676 meter di atas permukaan laut. Gunung ini merupakan bagian dari Taman Nasional Bromo Tengger Semeru dan terletak di Kabupaten Lumajang, Kabupaten Malang, dan Kabupaten Probolinggo di Jawa Timur. Gunung Semeru sering kali disebut sebagai Mahameru atau Semeru oleh masyarakat Jawa, dan merupakan salah satu tujuan pendakian populer di Indonesia. Gunung ini terkenal dengan pemandangan alamnya yang indah, serta puncaknya yang sering kali diselimuti oleh asap dari kawah yang aktif.",
                  style: TextStyle(
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
        )
      ],
    );
  }
}
