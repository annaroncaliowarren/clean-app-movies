import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../riverpod/movies/movies_provider.dart';
import 'column_trending_movies.dart';
import 'stack_top_bar_movies_page.dart';

class BodyMoviesPage extends StatefulHookConsumerWidget {
  const BodyMoviesPage({Key? key}) : super(key: key);

  @override
  ConsumerState<BodyMoviesPage> createState() => _BodyMoviesPageState();
}

class _BodyMoviesPageState extends ConsumerState<BodyMoviesPage> {
  @override
  Widget build(BuildContext context) {
    final movies = ref.watch(moviesNotifierProvider);
    bool isPressed = false;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const StackTopBarMoviesPage(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text(
                'Os Mais Populares',
                style: TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 24, 66, 100),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.05,
                width: MediaQuery.of(context).size.width * 0.45,
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color.fromARGB(255, 24, 66, 100),
                    width: 1.5,
                  ),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          isPressed = !isPressed;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        primary: isPressed ? const Color.fromARGB(255, 24, 66, 100) : Colors.white,
                        textStyle: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      child: const Text('Dia'),
                    ),
                    const Spacer(),
                    MaterialButton(
                      onPressed: () {
                        //ref.read(moviesNotifierProvider.notifier).getAllTrendingMovies('week');
                      },
                      elevation: 0,
                      color: isPressed ? const Color.fromARGB(255, 24, 66, 100) : Colors.white,
                      textColor: isPressed ? Colors.white : const Color.fromARGB(255, 24, 66, 100),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 5,
                      ),
                      shape: isPressed
                          ? OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            )
                          : OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(20),
                            ),
                      child: const Text('Semana'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
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
