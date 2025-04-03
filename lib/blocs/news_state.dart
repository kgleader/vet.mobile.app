import 'package:vet_mobile_app/models/news_model.dart';

abstract class NewsState {}

class NewsInitial extends NewsState {}

class NewsLoading extends NewsState {}

class NewsLoaded extends NewsState {
  final List<NewsModel> newsList;
  
  NewsLoaded(this.newsList);
}

class NewsDetailLoaded extends NewsState {
  final NewsModel newsDetail;
  
  NewsDetailLoaded(this.newsDetail);
}

class NewsError extends NewsState {
  final String message;
  
  NewsError(this.message);
}
