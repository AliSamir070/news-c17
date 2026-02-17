import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_c17/core/remote/api/api_manager.dart';
import 'package:news_c17/ui/articles/widget/article_item.dart';
import 'package:news_c17/ui/articles/widget/articles_view_model.dart';
import 'package:provider/provider.dart';

import '../../../model/articles_response/Article.dart';

class ArticlesList extends StatelessWidget {
  String sourceId;
  ArticlesList(this.sourceId);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => ArticlesViewModel()..getArticles(sourceId),
        child: Consumer<ArticlesViewModel>(
          builder: (context, viewModel, child) {
            if(viewModel.isLoading){
              return Center(child: CircularProgressIndicator(),);
            }else if(viewModel.errorMessage!=null){
              return SizedBox(
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(viewModel.errorMessage??"",style: Theme.of(context).textTheme.headlineMedium,),
                    ElevatedButton(onPressed: () {
                      viewModel.getArticles(sourceId);
                    }, child: Text("Try Again"))
                  ],
                ),
              );
            }
            List<Article> articles = viewModel.articlesList??[];
            return Padding(
              padding: REdgeInsets.all(16),
              child: ListView.separated(
                  itemBuilder: (context, index) => ArticleItem(
                    article: articles[index],
                  ),
                  separatorBuilder: (context, index) => SizedBox(height: 16.h,),
                  itemCount: articles.length
              ),
            );
        },),
    )

      /*FutureBuilder(
      future: ApiManager.getArticles(sourceId),
      builder: (context, asyncSnapshot) {
        if(asyncSnapshot.connectionState == ConnectionState.waiting){
          // loading state
          return Center(child: CircularProgressIndicator(),);
        }
        if(asyncSnapshot.hasError){
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(asyncSnapshot.error.toString()),
              ElevatedButton(onPressed: () {

              }, child: Text("Try Again"))
            ],
          );
        }
        var response = asyncSnapshot.data;
        List<Article> articles = response?.articles??[];
        return Padding(
          padding: REdgeInsets.all(16),
          child: ListView.separated(
              itemBuilder: (context, index) => ArticleItem(
                article: articles[index],
              ),
              separatorBuilder: (context, index) => SizedBox(height: 16.h,),
              itemCount: articles.length
          ),
        );
      }
    )*/;
  }
}
