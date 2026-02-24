import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:news_c17/data/datasource/articles_dao.dart';
import 'package:news_c17/data/datasource_impl/articles_dao_impl/articles_api_dao_impl.dart';
import 'package:news_c17/data/repository_impl/articles_repo_impl.dart';
import 'package:news_c17/repository/articles_repo.dart';
import 'package:news_c17/ui/articles/widget/articles_states.dart';

import '../../../core/remote/api/api_manager.dart';
@injectable
class ArticlesViewModel extends Cubit<ArticlesStates>{
  ArticlesViewModel(this.articlesRepo):super(LoadingState());
  ArticlesRepo articlesRepo;
  getArticles(String sourceId)async{
    try{
      // loading logic
      emit(LoadingState());
      var response = await articlesRepo.fetchArticles(sourceId);
      if(response.status!="error"){
        // success logic
        emit(SuccessState(response.articles??[]));
      }else{
        // server error logic
        emit(ErrorState(response.message??""));
      }
    }catch(e){
      // runtime error logic
      emit(ErrorState("No Internet Connection"));
    }
  }
}