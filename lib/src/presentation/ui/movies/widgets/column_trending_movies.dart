import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../domain/entities/movie_entity.dart';
import 'popup_menu_btn_movies.dart';

class ColumnTrendingMovies extends StatelessWidget {
  const ColumnTrendingMovies({
    Key? key,
    required this.movie,
  }) : super(key: key);

  final MovieEntity movie;

  getColorCircularProgressIndicator() {
    if (movie.voteAverage <= 7) {
      return const Color.fromARGB(255, 218, 205, 88);
    }
    return const Color.fromARGB(255, 102, 201, 105);
  }

  String formatDate(String date) {
    List<String> temp = date.split(' ');
    temp = temp[0].split('-');
    DateTime? dateRelease = DateTime.tryParse(date);
    if (dateRelease != null) {
      String month = DateFormat.MMM('pt_BR').format(dateRelease).toString();
      return temp.length == 3 ? ('${temp[2]} de $month de ${temp[0]}') : date;
    } else {
      return 'Data desconhecida';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          clipBehavior: Clip.none,
          alignment: AlignmentDirectional.topCenter,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                'https://image.tmdb.org/t/p/w500/${movie.posterPath}',
                scale: 2.7,
              ),
            ),
            const Positioned(
              right: 10,
              top: 10,
              child: PopupMenuBtnMovies(),
            ),
            Positioned(
              bottom: -25,
              left: 15,
              child: Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  CircleAvatar(
                    radius: 27,
                    backgroundColor: const Color.fromARGB(255, 22, 31, 22),
                    child: SizedBox(
                      height: 45,
                      width: 45,
                      child: CircularProgressIndicator(
                        value: (movie.voteAverage / 10),
                        backgroundColor: const Color.fromARGB(255, 31, 44, 31),
                        color: getColorCircularProgressIndicator(),
                        strokeWidth: 3,
                      ),
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        (movie.voteAverage * 10).toStringAsFixed(0),
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Text(
                        '%',
                        style: TextStyle(
                          fontSize: 10,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 30),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              movie.title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            Text(
              formatDate(movie.releaseDate),
              style: const TextStyle(
                fontSize: 15,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
