import 'package:flutter/material.dart';

class PopupMenuBtnMovies extends StatelessWidget {
  const PopupMenuBtnMovies({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 15,
      backgroundColor: Colors.white.withOpacity(0.8),
      child: PopupMenuButton(
        padding: const EdgeInsets.all(0),
        icon: const Icon(
          Icons.more_horiz_rounded,
          color: Colors.black,
        ),
        position: PopupMenuPosition.under,
        itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
          PopupMenuItem<String>(
            height: 25,
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 5,
            ),
            value: 'Adicionar a uma lista',
            child: Row(
              children: [
                const Icon(
                  Icons.list_rounded,
                  color: Colors.black,
                ),
                const SizedBox(width: 8),
                Text(
                  'Adicionar a uma lista',
                  style: TextStyle(
                    color: Colors.grey.shade600,
                  ),
                ),
              ],
            ),
          ),
          const PopupMenuDivider(),
          PopupMenuItem<String>(
            height: 25,
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 5,
            ),
            value: 'Adicionar aos favoritos',
            child: Row(
              children: [
                const Icon(
                  Icons.favorite,
                  color: Colors.black,
                ),
                const SizedBox(width: 8),
                Text(
                  'Adicionar aos favoritos',
                  style: TextStyle(
                    color: Colors.grey.shade600,
                  ),
                ),
              ],
            ),
          ),
          const PopupMenuDivider(),
          PopupMenuItem<String>(
            height: 25,
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 5,
            ),
            value: 'Lista de interesses',
            child: Row(
              children: [
                const Icon(
                  Icons.bookmark,
                  color: Colors.black,
                ),
                const SizedBox(width: 8),
                Text(
                  'Lista de interesses',
                  style: TextStyle(
                    color: Colors.grey.shade600,
                  ),
                ),
              ],
            ),
          ),
          const PopupMenuDivider(),
          PopupMenuItem<String>(
            height: 25,
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 5,
            ),
            value: 'Sua avaliação',
            child: Row(
              children: [
                const Icon(
                  Icons.star,
                  color: Colors.black,
                ),
                const SizedBox(width: 8),
                Text(
                  'Sua avaliação',
                  style: TextStyle(
                    color: Colors.grey.shade600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
