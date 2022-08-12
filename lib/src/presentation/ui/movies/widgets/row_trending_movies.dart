import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../riverpod/movies/movies_provider.dart';


class RowTrendingMovies extends StatefulHookConsumerWidget {
  const RowTrendingMovies({Key? key}) : super(key: key);

  @override
  ConsumerState<RowTrendingMovies> createState() => _RowTrendingMoviesState();
}

class _RowTrendingMoviesState extends ConsumerState<RowTrendingMovies> {
  bool isPressedDay = true;
  bool isPressedWeek = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                MaterialButton(
                  onPressed: () {
                    ref.read(moviesNotifierProvider.notifier).getAllTrendingMovies('day');
                    setState(() {
                      isPressedDay = !isPressedDay;
                      isPressedWeek = false;
                    });
                  },
                  elevation: 0,
                  color: isPressedDay ? const Color.fromARGB(255, 24, 66, 100) : Colors.white,
                  textColor: isPressedDay ? Colors.white : const Color.fromARGB(255, 24, 66, 100),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 5,
                  ),
                  shape: isPressedDay
                      ? OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        )
                      : OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(20),
                        ),
                  child: const Text('Dia'),
                ),
                const Spacer(),
                MaterialButton(
                  onPressed: () {
                    ref.read(moviesNotifierProvider.notifier).getAllTrendingMovies('week');
                    setState(() {
                      isPressedWeek = !isPressedWeek;
                      isPressedDay = false;
                    });
                  },
                  elevation: 0,
                  color: isPressedWeek ? const Color.fromARGB(255, 24, 66, 100) : Colors.white,
                  textColor: isPressedWeek ? Colors.white : const Color.fromARGB(255, 24, 66, 100),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 5,
                  ),
                  shape: isPressedWeek
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
    );
  }
}
