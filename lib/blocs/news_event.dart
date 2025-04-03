abstract class NewsEvent {}

class FetchNewsRequested extends NewsEvent {}

class FetchNewsDetailRequested extends NewsEvent {
  final String newsId;
  
  FetchNewsDetailRequested(this.newsId);
}
