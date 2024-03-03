import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../../core/constants.dart';
import '../../../../../core/error/failures.dart';
import '../../models/article/article_model.dart';

class NewsApiService {
  final Dio dio;

  NewsApiService(this.dio);

  Future<Either<Failure, List<Article>>> getArticles(
    String? query,
    String? sources,
    String? domains,
    DateTime? from,
    DateTime? to,
    String? language,
  ) async {
    var url =
        'https://newsapi.org/v2/everything?q=$query&sources=$sources&domains=$domains&from=${from?.toString()}&to=${to?.toString()}&language=$language&apiKey=$apiKey';

    try {
      final response = await dio.get(url);
      if (response.statusCode == 200) {
        final result = response.data;
        List<Article> articles = (result['articles'] as List<Article>);
        return Right(articles);
      } else if (response.statusCode == 404) {
        return Left(NotFoundFailure());
      } else {
        return const Left(ServerFailure(message: 'Server failure'));
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 404) {
        return Left(NotFoundFailure());
      } else {
        return const Left(ServerFailure(message: 'Server failure'));
      }
    } catch (_) {
      return const Left(ServerFailure(message: 'Server failure'));
    }
  }
}
