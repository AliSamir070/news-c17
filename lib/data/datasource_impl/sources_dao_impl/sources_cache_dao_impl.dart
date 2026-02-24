import 'package:hive_ce/hive_ce.dart';
import 'package:injectable/injectable.dart';
import 'package:news_c17/data/datasource/sources_dao.dart';
import 'package:news_c17/data/model/sources_response/Sources_response.dart';
@Named("cache")
@Injectable(as: SourcesDao)
class SourcesCacheDaoImpl implements SourcesDao{
  @override
  Future<SourcesResponse> fetchSources(String categoryId) async{
    var sourcesBox = await Hive.openBox<SourcesResponse>("sources");
    SourcesResponse response = sourcesBox.get(categoryId)??SourcesResponse(
      sources: []
    );
    await sourcesBox.close();
    return response;
  }

}