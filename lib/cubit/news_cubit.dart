import 'package:flutter_bloc/flutter_bloc.dart';

import '../objects/news_model.dart';
import '../services/news_service.dart';
import '../widgets/news.dart';

part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  late List<NewsModel> news;

  NewsCubit() : super(LoadingState()) {
    getData();
  }

  getData() async {
    news = await NewsService().getNews(categoryOption: categoryOption);
    emit(LoadedState(news: news));
  }
}
