import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travel_indonesia_app/controllers/destination_controller.dart';
import 'package:http/http.dart' as http;
import 'package:travel_indonesia_app/pages/detail_page.dart';
import 'package:travel_indonesia_app/utils/api.dart';
import 'package:travel_indonesia_app/widgets/card_small_place.dart';

class ProvinsiPage extends StatefulWidget {
  final String nama;
  const ProvinsiPage({super.key, required this.nama});

  @override
  State<ProvinsiPage> createState() => _ProvinsiPageState();
}

class _ProvinsiPageState extends State<ProvinsiPage> {
  final DestinationController destinationController =
      DestinationController(http.Client());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF6F6F6),
      appBar: AppBar(
        title: Text(widget.nama),
      ),
      body: Padding(
        padding:
            const EdgeInsets.only(right: 30, left: 30, top: 15, bottom: 10),
        child: FutureBuilder(
            future: destinationController.searchByProvinsi(widget.nama),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else {
                if (snapshot.data == null || snapshot.data!.isEmpty) {
                  return Center(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/images/empty_provinsi_page.png'),
                      const SizedBox(
                        height: 15,
                      ),
                      const Text(
                        "Belum ada data wisata di provinsi ini.",
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 14,
                          color: Color(0xff6F7789),
                        ),
                      ),
                      const SizedBox(
                        height: 165,
                      ),
                    ],
                  ));
                }
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return DetailPage(
                                image: apiData
                                    .getImagePath(snapshot.data![index].cover),
                                title: snapshot.data![index].name,
                                rate: snapshot.data![index].rate.toString(),
                                location: snapshot.data![index].location,
                                description: snapshot.data![index].description,
                              );
                            }));
                          },
                          child: cardSmallPlace(
                              image: apiData
                                  .getImagePath(snapshot.data![index].cover),
                              location: snapshot.data![index].location,
                              rating: snapshot.data![index].rate.toString(),
                              title: snapshot.data![index].name),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    );
                  },
                );
              }
            }),
      ),
    );
  }
}
