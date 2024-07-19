import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:travel_indonesia_app/controllers/destination_controller.dart';
import 'package:travel_indonesia_app/pages/detail_page.dart';
import 'package:travel_indonesia_app/pages/provinsi_page.dart';
import 'package:travel_indonesia_app/utils/api.dart';
import 'package:travel_indonesia_app/utils/provinsi.dart';
import 'package:travel_indonesia_app/widgets/card_small_place.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final Key _formKey = GlobalKey<FormState>();
  var provinsi = Provinsi().allProvinsi;
  DestinationController destinationController =
      DestinationController(http.Client());
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 60, bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 30, left: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Eksplor Wisata Indonesia",
                  style: TextStyle(
                    fontFamily: "poppins",
                    fontSize: 24,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const Text(
                  "Temukan wisaya terbaik yang ada di Indonesia",
                  style: TextStyle(
                    fontFamily: "poppins",
                    fontSize: 14,
                    color: Color(0xff6F7789),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Form(
                  key: _formKey,
                  child: TextFormField(
                    controller: searchController,
                    onChanged: (value) {
                      setState(() {});
                    },
                    decoration: InputDecoration(
                      hintText: "Cari tempat wisata",
                      hintStyle: const TextStyle(color: Color(0xff6F7789)),
                      suffixIcon: const Icon(Icons.search),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(
                          color: Colors.grey,
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(
                          color: Color(0xffDFDFDF),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            padding: const EdgeInsets.only(left: 32),
            height: 100,
            child: ListView.builder(
                itemCount: provinsi.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ProvinsiPage(
                                  nama: provinsi[index]['nama'],
                                ),
                              ));
                        },
                        child: Column(
                          children: [
                            ClipOval(
                              child: Image.asset(
                                'assets/images/provinsi/${provinsi[index]['banner']}',
                                fit: BoxFit.cover,
                                width: 60,
                                height: 60,
                              ),
                            ),
                            const SizedBox(
                              height: 6,
                            ),
                            Text(
                              provinsi[index]['nama'],
                              style: const TextStyle(
                                  fontFamily: 'poppins',
                                  fontSize: 12,
                                  color: Colors.black),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      )
                    ],
                  );
                }),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Available place ",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'poppins'),
                ),
                const SizedBox(
                  height: 15,
                ),
                SizedBox(
                    height: 500,
                    child: FutureBuilder(
                      future: (searchController.text.isEmpty)
                          ? destinationController.all()
                          : destinationController.search(searchController.text),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        } else if (!snapshot.hasData) {
                          return const Center(
                            child: Padding(
                              padding: EdgeInsets.only(bottom: 40),
                              child: Text("Data tidak ditemukan"),
                            ),
                          );
                        } else {
                          return ListView.builder(
                              padding: EdgeInsets.zero,
                              scrollDirection: Axis.vertical,
                              itemCount: snapshot.data!.length,
                              itemBuilder: (context, index) {
                                return Column(
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
                                            location:
                                                snapshot.data![index].location,
                                            description: snapshot
                                                .data![index].description,
                                          );
                                        }));
                                      },
                                      child: cardSmallPlace(
                                          image: apiData.getImagePath(
                                              snapshot.data![index].cover),
                                          location:
                                              snapshot.data![index].location,
                                          rating: snapshot.data![index].rate
                                              .toString(),
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
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
