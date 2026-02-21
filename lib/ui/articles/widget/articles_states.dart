import 'package:news_c17/model/articles_response/Article.dart';

sealed class ArticlesStates {}

class LoadingState extends ArticlesStates{}
class SuccessState extends ArticlesStates{
  List<Article> articles;
  SuccessState(this.articles);
}
class ErrorState extends ArticlesStates{
  String message;
  ErrorState(this.message);
}