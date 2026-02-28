import 'package:injectable/injectable.dart';
import 'package:news_c17/core/remote/api/internet_checker.dart';
import 'package:news_c17/data/datasource/sources_dao.dart';
import 'package:news_c17/data/model/sources_response/Sources_response.dart';
import 'package:news_c17/repository/sources_repo.dart';
@Injectable(as: SourcesRepo)
class SourcesRepoImpl implements SourcesRepo{
  SourcesDao apiSourcesDao;
  SourcesDao cacheSourcesDao;
  SourcesRepoImpl(@Named("api")this.apiSourcesDao,@Named("cache")this.cacheSourcesDao);
  @override
  Future<SourcesResponse> fetchSources(String categoryId) async{
    bool isConnected = await InternetChecker.checkConnection();
    if(isConnected){
      return apiSourcesDao.fetchSources(categoryId);
    }else{
      return cacheSourcesDao.fetchSources(categoryId);
    }
  }

}