import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../riverpod/movies/movies_provider.dart';
import 'column_trending_movies.dart';
import 'row_trending_movies.dart';
import 'stack_top_bar_movies_page.dart';

class BodyMoviesPage extends HookConsumerWidget {
  const BodyMoviesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final movies = ref.watch(moviesNotifierProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const StackTopBarMoviesPage(),
        const RowTrendingMovies(),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.47,
          child: Visibility(
            visible: movies.isNotEmpty,
            replacement: const Center(child: CircularProgressIndicator()),
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.5,
              ),
              padding: const EdgeInsets.all(10),
              itemCount: movies.length,
              itemBuilder: (context, index) {
                return ColumnTrendingMovies(movie: movies[index]);
              },
            ),
          ),
        ),
      ],
    );
  }
}
