import 'package:flutter/cupertino.dart';

class SavePage extends StatefulWidget {
  const SavePage({super.key});

  @override
  State<SavePage> createState() => _SavePageState();
}

class _SavePageState extends State<SavePage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 60, right: 30, left: 30, bottom: 10),
      child: Center(
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
      ),
    );
  }
}
