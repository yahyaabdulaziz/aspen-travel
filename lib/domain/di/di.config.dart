// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:connectivity_plus/connectivity_plus.dart' as _i895;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../data/repo/main_repo/data_source/main_online_ds_impl.dart'
    as _i275;
import '../../data/repo/main_repo/main_repo_impl.dart' as _i929;
import '../../presentation/ui/main_screen/tabs/home_tab/home_tab_viewmodel.dart'
    as _i767;
import '../../presentation/ui/product_details/cart_view_model.dart' as _i250;
import '../repo/main_repo/data_source/main_online_ds.dart' as _i340;
import '../repo/main_repo/main_repo.dart' as _i289;
import '../usecases/add_to_cart_use_case.dart' as _i274;
import '../usecases/get_locations_use_case.dart' as _i621;
import '../usecases/get_popular_product_use_case.dart' as _i630;
import '../usecases/get_recommeded_product_use_case.dart' as _i276;
import '../usecases/remove_from_cart_use_case.dart' as _i618;
import 'app_module.dart' as _i460;

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
    final appModule = _$AppModule();
    gh.factory<_i895.Connectivity>(() => appModule.getConnectivity());
    gh.factory<_i340.MainOnlineDS>(() => _i275.MainOnlineDSImpl());
    gh.factory<_i289.MainRepo>(
        () => _i929.MainRepoImpl(gh<_i340.MainOnlineDS>()));
    gh.factory<_i274.AddToCartUseCase>(
        () => _i274.AddToCartUseCase(gh<_i289.MainRepo>()));
    gh.factory<_i621.GetLocationsUseCase>(
        () => _i621.GetLocationsUseCase(gh<_i289.MainRepo>()));
    gh.factory<_i630.GetPopularProductUseCase>(
        () => _i630.GetPopularProductUseCase(gh<_i289.MainRepo>()));
    gh.factory<_i276.GetRecommendedProductUseCase>(
        () => _i276.GetRecommendedProductUseCase(gh<_i289.MainRepo>()));
    gh.factory<_i618.RemoveFromCartUseCase>(
        () => _i618.RemoveFromCartUseCase(gh<_i289.MainRepo>()));
    gh.factory<_i250.CartViewModel>(() => _i250.CartViewModel(
          gh<_i274.AddToCartUseCase>(),
          gh<_i618.RemoveFromCartUseCase>(),
        ));
    gh.factory<_i767.HomeTabViewModel>(() => _i767.HomeTabViewModel(
          gh<_i621.GetLocationsUseCase>(),
          gh<_i630.GetPopularProductUseCase>(),
          gh<_i276.GetRecommendedProductUseCase>(),
        ));
    return this;
  }
}

class _$AppModule extends _i460.AppModule {}
