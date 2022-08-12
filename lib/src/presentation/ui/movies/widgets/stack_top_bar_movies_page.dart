import 'package:flutter/material.dart';

class StackTopBarMoviesPage extends StatelessWidget {
  const StackTopBarMoviesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        Image.network(
          'https://images2.alphacoders.com/807/807567.jpg',
          color: const Color.fromARGB(255, 59, 127, 182).withOpacity(0.8),
          colorBlendMode: BlendMode.modulate,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Bem-vindo(a).',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 25,
                ),
              ),
              const Text(
                'Milhões de Filmes, Séries e Pessoas para Descobrir. Explore já.',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                  fontSize: 17,
                ),
              ),
              const SizedBox(height: 15),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Busque por um Filme, Série ou Pessoa...',
                  filled: true,
                  fillColor: Colors.white,
                  suffixIcon: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 22,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      gradient: const LinearGradient(
                        colors: [
                          Color.fromARGB(255, 96, 197, 187),
                          Color.fromARGB(255, 4, 180, 227),
                        ],
                      ),
                    ),
                    child: const Text(
                      'Pesquisar',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
