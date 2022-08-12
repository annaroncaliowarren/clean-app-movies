import 'package:flutter/material.dart';

import 'gradient_text_home.dart';

class AppBarMoviesPage extends StatelessWidget implements PreferredSizeWidget {
  const AppBarMoviesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const GradientText(
            'TMDB',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
              letterSpacing: 1.5,
            ),
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 93, 196, 185),
                Color.fromARGB(255, 4, 180, 227),
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.13,
            height: MediaQuery.of(context).size.height * 0.027,
            margin: const EdgeInsets.only(left: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: const LinearGradient(
                colors: [
                  Color.fromARGB(255, 93, 196, 185),
                  Color.fromARGB(255, 4, 180, 227),
                ],
              ),
            ),
          ),
          const Spacer(),
          const Text(
            'Filmes',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 15,
              color: Colors.white,
            ),
          ),
          const Spacer(),
          const Text(
            'Séries',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 15,
              color: Colors.white,
            ),
          ),
          const Spacer(),
          const Text(
            'Pessoas',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 15,
              color: Colors.white,
            ),
          ),
          const Spacer(),
          const Text(
            'Mais',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 15,
              color: Colors.white,
            ),
          ),
        ],
      ),
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => const Size(double.maxFinite, 56);
}
