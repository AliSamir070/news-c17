import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_c17/ui/articles/widget/articles_states.dart';

import '../../../core/remote/api/api_manager.dart';

class ArticlesViewModel extends Cubit<ArticlesStates>{
  ArticlesViewModel():super(LoadingState());

  getArticles(String sourceId)async{
    try{
      // loading logic
      emit(LoadingState());
      var response = await ApiManager.getArticles(sourceId);
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