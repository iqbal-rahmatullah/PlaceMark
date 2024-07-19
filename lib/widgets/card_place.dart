import 'package:flutter/material.dart';

Widget cardPlace(
    {required String image,
    required String title,
    required String location,
    required String rate}) {
  return Container(
    width: 260,
    height: 225,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20),
    ),
    clipBehavior: Clip.antiAlias,
    child: Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              image,
              fit: BoxFit.cover,
              width: double.infinity,
              height: 150,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.star_rate_rounded,
                    color: Color(0xffEE684A),
                    size: 20,
                  ),
                  Text(
                    rate,
                    style: const TextStyle(
                      fontFamily: 'poppins',
                      color: Color(0xff6F7789),
                    ),
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
              Text(location,
                  style: const TextStyle(
                    fontFamily: 'poppins',
                    color: Color(0xff6F7789),
                    fontSize: 14,
                  ))
            ],
          )
        ],
      ),
    ),
  );
}
