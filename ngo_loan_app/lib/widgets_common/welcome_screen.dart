import 'package:ngo_app/const/const.dart';

Widget welcomeScreen({required String imagePath, required String text1, required String text2}) {
  return Container(
    decoration: const BoxDecoration(
      gradient: gradientBackground, // Your gradient constant
    ),
    child: Column(
      children: [
        Container(
          height: 504,
          width: 424,
          decoration: const BoxDecoration(
            color: white,
            boxShadow: [
              BoxShadow(
                color: Colors.black,
                offset: Offset(0, 0),
                blurRadius: 20.0,
                spreadRadius: 0.0,
              ),
            ],
          ),
          child: Image.asset(
            imagePath,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            4,
                (index) => Row(
              children: [
                Container(
                  height: 6,
                  width: 6.88,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
                if (index < 3) const SizedBox(width: 15),
              ],
            ),
          ),
        ),
        const SizedBox(height: 30),
        Text(
          text1,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 22,
            height: 10.5 / 32,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 25),
        Text(
          text2,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 22,
            height: 10.5 / 32,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    ),
  );
}
