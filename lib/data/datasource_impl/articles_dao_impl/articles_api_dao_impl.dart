import 'package:injectable/injectable.dart';
import 'package:news_c17/core/remote/api/api_manager.dart';
import 'package:news_c17/data/datasource/articles_dao.dart';
import 'package:news_c17/data/model/articles_response/Articles_response.dart';
@Injectable(as: ArticlesDao)
class ArticlesApiDaoImpl implements ArticlesDao{
  ApiManager apiManager;
  ArticlesApiDaoImpl(this.apiManager);
  @override
  Future<ArticlesResponse> fetchArticles(String sourceId) {
    return apiManager.getArticles(sourceId);
  }

}