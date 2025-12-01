// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:electrum/core/db/secure_storage/secure_storage.dart' as _i242;
import 'package:electrum/core/service_locator/service_locator.dart' as _i233;
import 'package:electrum/core/session_handler/mocked/session_handler_mocked_impl.dart'
    as _i415;
import 'package:electrum/core/session_handler/mocked/session_mocked_mapper.dart'
    as _i179;
import 'package:electrum/core/session_handler/session.dart' as _i700;
import 'package:electrum/features/auth/data/datasources/auth_local_dts.dart'
    as _i464;
import 'package:electrum/features/auth/data/datasources/auth_network_dts.dart'
    as _i541;
import 'package:electrum/features/auth/data/datasources/local/auth_local_dts_impl.dart'
    as _i86;
import 'package:electrum/features/auth/data/datasources/local/mapper/user_entity_local_mapper.dart'
    as _i874;
import 'package:electrum/features/auth/data/datasources/remote/mocked/auth_mocked_network_dts.dart'
    as _i891;
import 'package:electrum/features/auth/data/repositories/auth_repo_impl.dart'
    as _i920;
import 'package:electrum/features/auth/domain/repositories/auth_repo.dart'
    as _i914;
import 'package:electrum/features/auth/domain/usecases/login_usecase.dart'
    as _i132;
import 'package:electrum/features/auth/domain/usecases/logout_usecase.dart'
    as _i410;
import 'package:electrum/features/auth/domain/usecases/register_usecase.dart'
    as _i741;
import 'package:electrum/features/auth/presentation/cubits/login/login_cubit.dart'
    as _i903;
import 'package:electrum/features/auth/presentation/cubits/logout/logout_cubit.dart'
    as _i377;
import 'package:electrum/features/auth/presentation/cubits/register/register_cubit.dart'
    as _i657;
import 'package:electrum/features/bike/data/datasources/bike_interest_network_dts.dart'
    as _i221;
import 'package:electrum/features/bike/data/datasources/bike_network_dts.dart'
    as _i328;
import 'package:electrum/features/bike/data/datasources/remote/mocked/bike_interest_mocked_network_dts.dart'
    as _i865;
import 'package:electrum/features/bike/data/datasources/remote/mocked/bike_mocked_network_dts.dart'
    as _i1073;
import 'package:electrum/features/bike/data/repositories/bike_interest_repo_impl.dart'
    as _i585;
import 'package:electrum/features/bike/data/repositories/bike_repo_impl.dart'
    as _i718;
import 'package:electrum/features/bike/domain/repositories/bike_interest_repo.dart'
    as _i427;
import 'package:electrum/features/bike/domain/repositories/bike_repo.dart'
    as _i802;
import 'package:electrum/features/bike/domain/usecases/get_bike_by_id_usecase.dart'
    as _i324;
import 'package:electrum/features/bike/domain/usecases/get_bikes_usecase.dart'
    as _i776;
import 'package:electrum/features/bike/domain/usecases/submit_bike_interest_usecase.dart'
    as _i730;
import 'package:electrum/features/bike/presentation/cubits/bike_detail/bike_detail_cubit.dart'
    as _i385;
import 'package:electrum/features/bike/presentation/cubits/bike_interest_form/bike_interest_form_cubit.dart'
    as _i299;
import 'package:electrum/features/bike/presentation/cubits/bike_list/bike_list_cubit.dart'
    as _i634;
import 'package:electrum/features/package/data/datasources/package_network_dts.dart'
    as _i884;
import 'package:electrum/features/package/data/datasources/remote/mocked/package_mocked_network_dts.dart'
    as _i108;
import 'package:electrum/features/package/data/repositories/package_repo_impl.dart'
    as _i115;
import 'package:electrum/features/package/domain/repositories/package_repo.dart'
    as _i369;
import 'package:electrum/features/package/domain/usecases/get_packages_usecase.dart'
    as _i999;
import 'package:electrum/features/package/presentation/cubits/package_list/package_list_cubit.dart'
    as _i755;
import 'package:electrum/features/promotion/data/datasources/promotion_network_dts.dart'
    as _i906;
import 'package:electrum/features/promotion/data/datasources/remote/mocked/promotion_mocked_network_dts.dart'
    as _i495;
import 'package:electrum/features/promotion/data/repositories/promotion_repo_impl.dart'
    as _i14;
import 'package:electrum/features/promotion/domain/repositories/promotion_repo.dart'
    as _i76;
import 'package:electrum/features/promotion/domain/usecases/get_promotions_usecase.dart'
    as _i1036;
import 'package:electrum/features/promotion/presentation/cubits/promotion_list/promotion_list_cubit.dart'
    as _i467;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i558;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

const String _mocked = 'mocked';

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final coreModule = _$CoreModule();
    gh.factory<_i558.FlutterSecureStorage>(
      () => coreModule.getFlutterSecureStorage(),
    );
    gh.factory<_i179.SessionMockedMapper>(() => _i179.SessionMockedMapper());
    gh.factory<_i874.UserEntityLocalMapper>(
      () => _i874.UserEntityLocalMapper(),
    );
    gh.lazySingleton<_i242.SecureStorage>(
      () => _i242.SecureStorageImpl(gh<_i558.FlutterSecureStorage>()),
    );
    gh.factory<_i464.AuthLocalDts>(
      () => _i86.AuthLocalDtsImpl(
        gh<_i242.SecureStorage>(),
        gh<_i874.UserEntityLocalMapper>(),
      ),
    );
    gh.lazySingleton<_i891.AuthMockDB>(
      () => _i891.AuthMockDB(),
      registerFor: {_mocked},
    );
    gh.lazySingleton<_i865.BikeInterestMockDB>(
      () => _i865.BikeInterestMockDB(),
      registerFor: {_mocked},
    );
    gh.lazySingleton<_i1073.BikeMockDB>(
      () => _i1073.BikeMockDB(),
      registerFor: {_mocked},
    );
    gh.lazySingleton<_i108.PackageMockDB>(
      () => _i108.PackageMockDB(),
      registerFor: {_mocked},
    );
    gh.lazySingleton<_i495.PromotionMockDB>(
      () => _i495.PromotionMockDB(),
      registerFor: {_mocked},
    );
    gh.lazySingleton<_i700.SessionHandler>(
      () => _i415.SessionHandlerMockedImpl(
        gh<_i242.SecureStorage>(),
        gh<_i179.SessionMockedMapper>(),
      ),
      registerFor: {_mocked},
    );
    gh.factory<_i328.BikeNetworkDts>(
      () => _i1073.BikeMockedNetworkDts(
        gh<_i1073.BikeMockDB>(),
        gh<_i865.BikeInterestMockDB>(),
        gh<_i700.SessionHandler>(),
      ),
      registerFor: {_mocked},
    );
    gh.factory<_i884.PackageNetworkDts>(
      () => _i108.PackageMockedNetworkDts(gh<_i108.PackageMockDB>()),
      registerFor: {_mocked},
    );
    gh.factory<_i541.AuthNetworkDts>(
      () => _i891.AuthMockedNetworkDts(gh<_i891.AuthMockDB>()),
      registerFor: {_mocked},
    );
    gh.factory<_i906.PromotionNetworkDts>(
      () => _i495.PromotionMockedNetworkDts(gh<_i495.PromotionMockDB>()),
      registerFor: {_mocked},
    );
    gh.factory<_i221.BikeInterestNetworkDts>(
      () => _i865.BikeInterestMockedNetworkDts(
        gh<_i865.BikeInterestMockDB>(),
        gh<_i700.SessionHandler>(),
      ),
      registerFor: {_mocked},
    );
    gh.factory<_i427.BikeInterestRepo>(
      () => _i585.BikeInterestRepoImpl(gh<_i221.BikeInterestNetworkDts>()),
    );
    gh.factory<_i802.BikeRepo>(
      () => _i718.BikeRepoImpl(gh<_i328.BikeNetworkDts>()),
    );
    gh.factory<_i369.PackageRepo>(
      () => _i115.PackageRepoImpl(gh<_i884.PackageNetworkDts>()),
    );
    gh.factory<_i914.AuthRepo>(
      () => _i920.AuthRepoImpl(
        gh<_i541.AuthNetworkDts>(),
        gh<_i464.AuthLocalDts>(),
        gh<_i700.SessionHandler>(),
      ),
    );
    gh.factory<_i324.GetBikeByIdUsecase>(
      () => _i324.GetBikeByIdUsecase(
        gh<_i700.SessionHandler>(),
        gh<_i802.BikeRepo>(),
      ),
    );
    gh.factory<_i776.GetBikesUsecase>(
      () => _i776.GetBikesUsecase(
        gh<_i700.SessionHandler>(),
        gh<_i802.BikeRepo>(),
      ),
    );
    gh.factory<_i76.PromotionRepo>(
      () => _i14.PromotionRepoImpl(gh<_i906.PromotionNetworkDts>()),
    );
    gh.factory<_i730.SubmitBikeInterestUsecase>(
      () => _i730.SubmitBikeInterestUsecase(
        gh<_i700.SessionHandler>(),
        gh<_i427.BikeInterestRepo>(),
      ),
    );
    gh.factory<_i999.GetPackagesUsecase>(
      () => _i999.GetPackagesUsecase(
        gh<_i700.SessionHandler>(),
        gh<_i369.PackageRepo>(),
      ),
    );
    gh.factory<_i132.LoginUsecase>(
      () =>
          _i132.LoginUsecase(gh<_i700.SessionHandler>(), gh<_i914.AuthRepo>()),
    );
    gh.factory<_i410.LogoutUsecase>(
      () =>
          _i410.LogoutUsecase(gh<_i700.SessionHandler>(), gh<_i914.AuthRepo>()),
    );
    gh.factory<_i741.RegisterUsecase>(
      () => _i741.RegisterUsecase(
        gh<_i700.SessionHandler>(),
        gh<_i914.AuthRepo>(),
      ),
    );
    gh.factory<_i299.BikeInterestFormCubit>(
      () => _i299.BikeInterestFormCubit(
        gh<_i730.SubmitBikeInterestUsecase>(),
        gh<_i324.GetBikeByIdUsecase>(),
      ),
    );
    gh.factory<_i903.LoginCubit>(
      () => _i903.LoginCubit(gh<_i132.LoginUsecase>()),
    );
    gh.factory<_i634.BikeListCubit>(
      () => _i634.BikeListCubit(gh<_i776.GetBikesUsecase>()),
    );
    gh.factory<_i755.PackageListCubit>(
      () => _i755.PackageListCubit(gh<_i999.GetPackagesUsecase>()),
    );
    gh.factory<_i1036.GetPromotionsUsecase>(
      () => _i1036.GetPromotionsUsecase(
        gh<_i700.SessionHandler>(),
        gh<_i76.PromotionRepo>(),
      ),
    );
    gh.factory<_i377.LogoutCubit>(
      () => _i377.LogoutCubit(gh<_i410.LogoutUsecase>()),
    );
    gh.factory<_i657.RegisterCubit>(
      () => _i657.RegisterCubit(gh<_i741.RegisterUsecase>()),
    );
    gh.factory<_i385.BikeDetailCubit>(
      () => _i385.BikeDetailCubit(gh<_i324.GetBikeByIdUsecase>()),
    );
    gh.factory<_i467.PromotionListCubit>(
      () => _i467.PromotionListCubit(gh<_i1036.GetPromotionsUsecase>()),
    );
    return this;
  }
}

class _$CoreModule extends _i233.CoreModule {}
