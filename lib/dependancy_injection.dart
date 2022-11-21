import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shop_app/core/network/api_provider.dart';
import 'package:shop_app/core/network/api_provider_impl.dart';
import 'package:shop_app/core/network/network_info.dart';
import 'package:shop_app/features/login/data/datasources/login_datasource.dart';
import 'package:shop_app/features/login/data/repositories/login_repostory_impl.dart';
import 'package:shop_app/features/login/domin/repositories/login_repository.dart';
import 'package:shop_app/features/login/domin/usecases/login_usecase.dart';
import 'package:shop_app/features/login/presentation/bloc/login_bloc.dart';

GetIt sl = GetIt.instance;

Future<void> init() async {
  //---Login---//
  //BLoC
  sl.registerFactory(() => LoginBloc(sl()));

  //Usecase
  sl.registerLazySingleton(() => LoginUsecase(sl()));
  //Repository
  sl.registerLazySingleton<LoginBaseRepository>(
      () => LoginRepositoryImpl(sl(), sl()));
  //DataSource
  sl.registerLazySingleton<LoginDatasource>(() => LoginDatasourceImpl(sl()));
  //---Core---//
  //API Provider
  sl.registerLazySingleton<APIProvider>(() => APIProviderImpl());
  //Network Info
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));
  //InternetConnectionChecker
  sl.registerLazySingleton(() => InternetConnectionChecker());
}
