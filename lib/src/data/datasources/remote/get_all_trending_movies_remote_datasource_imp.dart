import 'package:dio/dio.dart';

import '../../../domain/entities/movie_entity.dart';
import '../../dtos/movie_dto.dart';
import '../get_all_trending_movies_datasource.dart';

class GetAllTrendingMoviesRemoteDatasourceImp implements GetAllTrendingMoviesDatasource {
  final Dio _dio;
  GetAllTrendingMoviesRemoteDatasourceImp(this._dio);

  @override
  Future<List<MovieEntity>> getAllTrendingMovies(String timeWindow) async {
    List<MovieEntity> movies = [];

    final response = await _dio.get(
      'https://api.themoviedb.org/3/trending/movie/$timeWindow',
      queryParameters: {
        'api_key': '22f80af5a87b181d8f12f5ae97db1ec2',
        'language': 'pt-BR',
      },
    );

    movies = List.from(
      response.data.map(
        (movie) {
          return MovieDto.fromMap(movie);
        },
      ),
    );

    return movies;
  }
}
