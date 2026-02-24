import 'package:injectable/injectable.dart';
import 'package:news_c17/data/datasource/articles_dao.dart';
import 'package:news_c17/data/model/articles_response/Articles_response.dart';
import 'package:news_c17/repository/articles_repo.dart';
@Injectable(as: ArticlesRepo)
class ArticlesRepoImpl implements ArticlesRepo{
  ArticlesDao articlesDao;
  ArticlesRepoImpl(this.articlesDao);
  @override
  Future<ArticlesResponse> fetchArticles(String sourceId) {
    return articlesDao.fetchArticles(sourceId);
  }

}