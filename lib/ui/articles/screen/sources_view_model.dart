import 'package:flutter/material.dart';
import 'package:news_c17/core/remote/api/api_manager.dart';
import 'package:news_c17/model/sources_response/Source.dart';

class SourcesViewModel extends ChangeNotifier{
  bool isLoading = false;
  String? errorMessage;
  List<Source>? sourcesList;
  getSources(String categoryId)async{
    errorMessage = null;
    sourcesList = null;
    // loading state
   isLoading = true;
   notifyListeners();
    try{
      var response =  await ApiManager.getSources(categoryId);
      isLoading = false;

      if(response.status!="error"){
        // success state
        sourcesList = response.sources;
      }else{
        // server error
        errorMessage = response.message;
      }
      notifyListeners();
    }catch(e){
      // exception error
      isLoading = false;
      errorMessage = "No Internet Connection";
      notifyListeners();
    }
  }
}