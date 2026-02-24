import 'package:hive_ce/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:news_c17/core/remote/api/api_manager.dart';
import 'package:news_c17/data/datasource/sources_dao.dart';
import 'package:news_c17/data/model/sources_response/Sources_response.dart';
@Named("api")
@Injectable(as: SourcesDao)
class SourcesApiDaoImpl implements SourcesDao{
  ApiManager apiManager;
  SourcesApiDaoImpl(this.apiManager); // constructor injection
  @override
  Future<SourcesResponse> fetchSources(String categoryId) async{
    SourcesResponse sourcesResponse = await apiManager.getSources(categoryId);
    if(sourcesResponse.status!="error"){
      var sourcesBox = await Hive.openBox<SourcesResponse>("sources");
      await sourcesBox.put(categoryId, sourcesResponse);
      await sourcesBox.close();
    }
    return sourcesResponse;
  }

}