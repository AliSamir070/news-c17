import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:news_c17/core/remote/api/api_manager.dart';
import 'package:news_c17/data/datasource/sources_dao.dart';
import 'package:news_c17/data/datasource_impl/sources_dao_impl/sources_api_dao_impl.dart';
import 'package:news_c17/data/repository_impl/sources_repo_impl.dart';
import 'package:news_c17/repository/sources_repo.dart';
import 'package:news_c17/ui/articles/screen/sources_states.dart';

@injectable
class SourcesViewModel extends Cubit<SourcesStates> {
  SourcesViewModel(this.sourcesRepo):super(LoadingState());
  SourcesRepo sourcesRepo;
  getSources(String categoryId)async{
    try{
      // loading logic
      emit(LoadingState());
      var response = await sourcesRepo.fetchSources(categoryId);
      if(response.status!="error"){
        // success logic
        emit(SuccessState(response.sources??[]));
      }else{
        // server error logic
        emit(ErrorState(response.message??""));
      }
    }catch(e){
      // runtime error logic
      print(e.toString());
      emit(ErrorState("No Internet Connection"));
    }
  }
}