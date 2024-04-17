import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget cardSmallPlace({
  required String image,
  required String title,
  required String location,
  required String rating,
  bool isDismiss = false,
}) {
  return Container(
    height: 120,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20),
    ),
    clipBehavior: Clip.antiAlias,
    child: Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              image,
              width: 100,
              height: 120,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                (title.length > 18) ? title.substring(0, 18) + "..." : title,
                style: const TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
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
                  Text(location,
                      style: const TextStyle(
                        fontFamily: 'poppins',
                        color: Color(0xff6F7789),
                        fontSize: 14,
                      ))
                ],
              ),
              const SizedBox(
                height: 2,
              ),
              Row(
                children: [
                  const Icon(
                    Icons.star_rate_rounded,
                    color: Color(0xffEE684A),
                    size: 20,
                  ),
                  Text(
                    rating,
                    style: const TextStyle(
                        fontFamily: 'poppins',
                        color: Color(0xff6F7789),
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  )
                ],
              ),
            ],
          )
        ],
      ),
    ),
  );
}
