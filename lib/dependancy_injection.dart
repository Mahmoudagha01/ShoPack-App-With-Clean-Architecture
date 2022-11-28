import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shop_app/core/network/api_provider.dart';
import 'package:shop_app/core/network/api_provider_impl.dart';
import 'package:shop_app/core/network/network_info.dart';
import 'package:shop_app/features/forgotpass&verifyemail/data/datasources/forgotpassword_datasource.dart';
import 'package:shop_app/features/forgotpass&verifyemail/data/repositories/forgotpassword_repositoryimpl.dart';
import 'package:shop_app/features/forgotpass&verifyemail/domain/repositories/forgotpassword_repository.dart';
import 'package:shop_app/features/forgotpass&verifyemail/domain/usecases/forgotpassword_usecase.dart';
import 'package:shop_app/features/forgotpass&verifyemail/presentation/forgotpassword_bloc/forgetpassword_bloc.dart';
import 'package:shop_app/features/login/data/datasources/login_datasource.dart';
import 'package:shop_app/features/login/data/repositories/login_repostory_impl.dart';
import 'package:shop_app/features/login/domin/repositories/login_repository.dart';
import 'package:shop_app/features/login/domin/usecases/login_usecase.dart';
import 'package:shop_app/features/login/presentation/bloc/login_bloc.dart';
import 'package:shop_app/features/register/data/datasources/register_datasource.dart';
import 'package:shop_app/features/register/data/repositories/register_repository_impl.dart';
import 'package:shop_app/features/register/domain/repositories/register_repository.dart';
import 'package:shop_app/features/register/domain/usecases/register_usecase.dart';
import 'package:shop_app/features/register/presentation/bloc/register_bloc.dart';

GetIt sl = GetIt.instance;

Future<void> init() async {
  
  //BLoC
  sl.registerFactory(() => LoginBloc(sl()));
  sl.registerFactory(() => RegisterBloc(sl()));
  sl.registerFactory(() => ForgetpasswordBloc(sl()));
  //Usecase
  sl.registerLazySingleton(() => LoginUsecase(sl()));
  sl.registerLazySingleton(() => RegisterUsecase(sl()));
  sl.registerLazySingleton(() => ForgotPassUsecase(sl()));
  //Repository
  sl.registerLazySingleton<LoginBaseRepository>(
      () => LoginRepositoryImpl(sl(), sl()));
  sl.registerLazySingleton<RegisterBaseRepository>(
      () => RegisterRepositoryImpl(sl(), sl()));
  sl.registerLazySingleton<ForgotPasswordRepo>(
      () => ForgotPasswordRepoImpl(sl(), sl()));
  //DataSource
  sl.registerLazySingleton<LoginDatasource>(() => LoginDatasourceImpl(sl()));
  sl.registerLazySingleton<RegisterBaseDatasource>(
      () => RegisterDataSourceImpl(sl()));
  sl.registerLazySingleton<ForgetPasswordDataSource>(
      () => ForgetPasswordDataSourceImpl(sl()));
  //---Core---//
  //API Provider
  sl.registerLazySingleton<APIProvider>(() => APIProviderImpl());
  //Network Info
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));
  //InternetConnectionChecker
  sl.registerLazySingleton(() => InternetConnectionChecker());
}
