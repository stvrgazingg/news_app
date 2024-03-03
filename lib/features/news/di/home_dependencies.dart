import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../data/repositories/news_article_repository_impl.dart';
import '../data/services/remote/news_api_service.dart';
import '../domain/repositories/news_article_repository.dart';
import '../domain/usecases/get_articles.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  // Dio
  sl.registerSingleton<Dio>(Dio());

  sl.registerSingleton<NewsApiService>(NewsApiService(sl()));

  sl.registerSingleton<NewsArticleRepository>(NewsArticleRepositoryImpl(sl()));

  sl.registerSingleton<GetArticlesUseCase>(GetArticlesUseCase(sl()));
}
