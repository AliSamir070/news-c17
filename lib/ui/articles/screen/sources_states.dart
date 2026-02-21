import 'package:news_c17/model/sources_response/Source.dart';

sealed class SourcesStates{}

class LoadingState extends SourcesStates{}
class ErrorState extends SourcesStates{
  String message;
  ErrorState(this.message);
}
class SuccessState extends SourcesStates{
  List<Source> sources;
  SuccessState(this.sources);
}
