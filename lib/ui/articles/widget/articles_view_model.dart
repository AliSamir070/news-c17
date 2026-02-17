import 'package:flutter/material.dart';
import 'package:news_c17/core/remote/api/api_manager.dart';

import '../../../model/articles_response/Article.dart';

class ArticlesViewModel extends ChangeNotifier{
  bool isLoading = false;
  String? errorMessage;
  List<Article>? articlesList;
  getArticles(String sourceId)async{
   try{
     // loading logic
     errorMessage = null;
     articlesList = null;
     isLoading = true;
     notifyListeners();
     var response = await ApiManager.getArticles(sourceId);
     isLoading = false;
     if(response.status!="error"){
       // success logic
       articlesList = response.articles;
     }else{
       // server error logic
       errorMessage = response.message;
     }
     notifyListeners();
   }catch(e){
     // runtime error logic
     isLoading = false;
     errorMessage = "No Internet Connection";
     notifyListeners();
   }
  }
}