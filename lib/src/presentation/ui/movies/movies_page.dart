import 'package:flutter/material.dart';

import 'widgets/app_bar_movies_page.dart';
import 'widgets/body_movies_page.dart';

class MoviesPage extends StatelessWidget {
  const MoviesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppBarMoviesPage(),
      body: SingleChildScrollView(
        child: BodyMoviesPage(),
      ),
    );
  }
}

