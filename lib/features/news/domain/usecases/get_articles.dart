import '../../../../core/usecases/usecase.dart';
import '../../data/models/article/article_model.dart';
import '../../domain/repositories/news_article_repository.dart';

class GetArticlesUseCase implements UseCase<List<Article>, GetArticlesParams> {
  final NewsArticleRepository repository;

  GetArticlesUseCase(this.repository);

  @override
  Future<List<Article>> call({GetArticlesParams? params}) async {
    return await repository
        .getArticles(
          params?.query,
          params?.sources,
          params?.domains,
          params?.from,
          params?.to,
          params?.language,
        )
        .then((either) => either.fold(
              (failure) => throw failure,
              (articles) => articles,
            ));
  }
}

class GetArticlesParams {
  final String? query;
  final String? sources;
  final String? domains;
  final DateTime? from;
  final DateTime? to;
  final String? language;

  GetArticlesParams({
    this.query,
    this.sources,
    this.domains,
    this.from,
    this.to,
    this.language,
  });
}
