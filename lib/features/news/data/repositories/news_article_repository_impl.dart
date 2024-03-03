import 'package:dartz/dartz.dart';
import 'package:news_app/core/error/failures.dart';
import '../../domain/repositories/news_article_repository.dart';
import '../models/article/article_model.dart';
import '../services/remote/news_api_service.dart';

class NewsArticleRepositoryImpl implements NewsArticleRepository {
  final NewsApiService newsApiService;

  NewsArticleRepositoryImpl(this.newsApiService);

  @override
  Future<Either<Failure, List<Article>>> getArticles(
    String? query,
    String? sources,
    String? domains,
    DateTime? from,
    DateTime? to,
    String? language,
  ) async {
    try {
      final articles = await newsApiService.getArticles(
        query,
        sources,
        domains,
        from,
        to,
        language,
      );
      return Right(articles as List<Article>);
    } catch (e) {
      // If there's an error, return a specific failure type
      return Left(ServerFailure(message: e.toString()));
    }
  }
}
