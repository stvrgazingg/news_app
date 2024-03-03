import 'package:news_app/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import '../../data/models/article/article_model.dart';

abstract class NewsArticleRepository {
  Future<Either<Failure, List<Article>>> getArticles(
    String? query,
    String? sources,
    String? domains,
    DateTime? from,
    DateTime? to,
    String? language,
  );
}
