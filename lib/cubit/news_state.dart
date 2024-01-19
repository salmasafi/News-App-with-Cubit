part of 'news_cubit.dart';

class NewsState {}

class LoadingState extends NewsState {}

class LoadedState extends NewsState {
  List<NewsModel> news;
  LoadedState({required this.news});
}
