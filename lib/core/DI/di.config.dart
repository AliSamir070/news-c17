// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../data/datasource/articles_dao.dart' as _i851;
import '../../data/datasource/sources_dao.dart' as _i166;
import '../../data/datasource_impl/articles_dao_impl/articles_api_dao_impl.dart'
    as _i746;
import '../../data/datasource_impl/sources_dao_impl/sources_api_dao_impl.dart'
    as _i638;
import '../../data/datasource_impl/sources_dao_impl/sources_cache_dao_impl.dart'
    as _i947;
import '../../data/repository_impl/articles_repo_impl.dart' as _i902;
import '../../data/repository_impl/sources_repo_impl.dart' as _i805;
import '../../repository/articles_repo.dart' as _i707;
import '../../repository/sources_repo.dart' as _i396;
import '../../ui/articles/screen/sources_view_model.dart' as _i83;
import '../../ui/articles/widget/articles_view_model.dart' as _i556;
import '../remote/api/api_manager.dart' as _i384;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.lazySingleton<_i384.ApiManager>(() => _i384.ApiManager());
    gh.factory<_i166.SourcesDao>(
      () => _i947.SourcesCacheDaoImpl(),
      instanceName: 'cache',
    );
    gh.factory<_i851.ArticlesDao>(
      () => _i746.ArticlesApiDaoImpl(gh<_i384.ApiManager>()),
    );
    gh.factory<_i166.SourcesDao>(
      () => _i638.SourcesApiDaoImpl(gh<_i384.ApiManager>()),
      instanceName: 'api',
    );
    gh.factory<_i707.ArticlesRepo>(
      () => _i902.ArticlesRepoImpl(gh<_i851.ArticlesDao>()),
    );
    gh.factory<_i396.SourcesRepo>(
      () => _i805.SourcesRepoImpl(
        gh<_i166.SourcesDao>(instanceName: 'api'),
        gh<_i166.SourcesDao>(instanceName: 'cache'),
      ),
    );
    gh.factory<_i83.SourcesViewModel>(
      () => _i83.SourcesViewModel(gh<_i396.SourcesRepo>()),
    );
    gh.factory<_i556.ArticlesViewModel>(
      () => _i556.ArticlesViewModel(gh<_i707.ArticlesRepo>()),
    );
    return this;
  }
}
