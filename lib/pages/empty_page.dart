import 'package:flutter/widgets.dart';

class EmptyPage extends StatelessWidget {
  const EmptyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const SizedBox(
            height: 100,
          ),
          Image.asset('assets/images/empty_illustration.png'),
          const SizedBox(
            height: 15,
          ),
          const Text(
            "Belum ada tempat yang disimpan",
            style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 20,
                fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            "Temukan tempat wisata terbaik di Indonesia",
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 14,
              color: Color(0xff6F7789),
            ),
          )
        ],
      ),
    );
  }
}
