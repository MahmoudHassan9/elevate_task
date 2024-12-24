// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../features/products_screen/data/api/api_manager.dart' as _i386;
import '../../features/products_screen/data/datasource_contract/products_datasource_contract.dart'
    as _i887;
import '../../features/products_screen/data/datasource_impl/products_datasource_impl.dart'
    as _i303;
import '../../features/products_screen/data/repo_impl/products_repo_impl.dart'
    as _i646;
import '../../features/products_screen/domain/repo_contract/products_repo_contract.dart'
    as _i23;
import '../../features/products_screen/domain/usecase/get_products_use_case.dart'
    as _i575;
import '../../features/products_screen/presentaion/viewModel/cubit/products_cubit.dart'
    as _i201;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i386.ApiManager>(() => _i386.ApiManager());
    gh.factory<_i887.ProductsDatasource>(
        () => _i303.ProductsDatasourceImpl(apiManager: gh<_i386.ApiManager>()));
    gh.factory<_i23.ProductsRepo>(() =>
        _i646.ProductsRepoImpl(datasource: gh<_i887.ProductsDatasource>()));
    gh.factory<_i575.GetProductsUseCase>(
        () => _i575.GetProductsUseCase(repo: gh<_i23.ProductsRepo>()));
    gh.factory<_i201.ProductsCubit>(
        () => _i201.ProductsCubit(useCase: gh<_i575.GetProductsUseCase>()));
    return this;
  }
}
