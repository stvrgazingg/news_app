import 'package:dio/src/dio_exception.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/features/news/presentation/bloc/article/remote/remote_article_event.dart';
import 'package:news_app/features/news/presentation/bloc/article/remote/remote_article_state.dart';
import '../../../../data/models/article/article_model.dart';
import '../../../../domain/usecases/get_articles.dart';

class RemoteArticlesBloc
    extends Bloc<RemoteArticlesEvent, RemoteArticlesState> {
  final GetArticlesUseCase _getArticleUseCase;

  RemoteArticlesBloc(this._getArticleUseCase)
      : super(const RemoteArticlesLoading()) {
    on<GetArticles>((event, emit) => onGetArticles(event, emit));
  }

  void onGetArticles(
      GetArticles event, Emitter<RemoteArticlesState> emit) async {
    final dataState = await _getArticleUseCase(params: event.params);

    dataState.fold(
      (failure) => emit(RemoteArticlesError(failure)),
      (articles) {
        if (articles.isNotEmpty) {
          emit(RemoteArticlesDone(articles));
        } else {
          emit(RemoteArticlesError('No articles.' as DioException));
        }
      } as void Function(dynamic failure) Function(
          void Function(dynamic failure) previousValue, Article element),
    );
  }
}
