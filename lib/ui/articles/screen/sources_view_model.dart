import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_c17/core/remote/api/api_manager.dart';
import 'package:news_c17/ui/articles/screen/sources_states.dart';

class SourcesViewModel extends Cubit<SourcesStates> {
  SourcesViewModel():super(LoadingState());

  getSources(String categoryId)async{
    try{
      // loading logic
      emit(LoadingState());
      var response = await ApiManager.getSources(categoryId);
      if(response.status!="error"){
        // success logic
        emit(SuccessState(response.sources??[]));
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