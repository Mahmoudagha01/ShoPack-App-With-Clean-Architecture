import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shop_app/core/network/api_provider.dart';
import 'package:shop_app/core/network/api_provider_impl.dart';
import 'package:shop_app/core/network/network_info.dart';
import 'package:shop_app/features/forgotpass&verifyemail/data/datasources/forgotpassword_datasource.dart';
import 'package:shop_app/features/forgotpass&verifyemail/data/repositories/forgotpassword_repositoryimpl.dart';
import 'package:shop_app/features/forgotpass&verifyemail/domain/repositories/forgotpassword_repository.dart';
import 'package:shop_app/features/forgotpass&verifyemail/domain/usecases/forgotpassword_usecase.dart';
import 'package:shop_app/features/forgotpass&verifyemail/presentation/forgotpass&verifyemail_bloc/forgotpass&verifyemail_bloc.dart';
import 'package:shop_app/features/home/presentation/bloc/BottomNavigationBar_bloc.dart';
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
import 'package:shop_app/features/setpassword/data/datasources/Resetpassword_datasource.dart';
import 'package:shop_app/features/setpassword/data/repositories/resetpassword_repositoryimpl.dart';
import 'package:shop_app/features/setpassword/domain/repositories/resetPassword_repository.dart';
import 'package:shop_app/features/setpassword/domain/usecases/resetpassword_usecase.dart';
import 'package:shop_app/features/setpassword/presentation/bloc/reset_password_bloc.dart';
import 'package:shop_app/features/shop/data/datasources/products_datasource.dart';
import 'package:shop_app/features/shop/data/repositories/products_repositoryimpl.dart';
import 'package:shop_app/features/shop/domain/repositories/product_repository.dart';
import 'package:shop_app/features/shop/domain/usecases/getAllProducts_usecase.dart';
import 'package:shop_app/features/shop/presentation/bloc/products_bloc.dart';

GetIt sl = GetIt.instance;

Future<void> init() async {
  //BLoC
  sl.registerFactory(() => LoginBloc(sl()));
  sl.registerFactory(() => RegisterBloc(sl()));
  sl.registerFactory(() => ForgetpasswordAndeVerifyEmailBloc(sl()));
  sl.registerFactory(() => ResetPasswordBloc(sl()));
  sl.registerFactory(() => BottomNavigationBarBloc());
  sl.registerFactory(() => ProductsBloc(sl()));
  //Usecase
  sl.registerLazySingleton(() => LoginUsecase(sl()));
  sl.registerLazySingleton(() => RegisterUsecase(sl()));
  sl.registerLazySingleton(() => ForgotPassUsecase(sl()));
  sl.registerLazySingleton(() => ResetPasswordUseCase(sl()));
  sl.registerLazySingleton(() => GetAllProductsUsecase(sl()));
  //Repository
  sl.registerLazySingleton<LoginBaseRepository>(
      () => LoginRepositoryImpl(sl(), sl()));
  sl.registerLazySingleton<RegisterBaseRepository>(
      () => RegisterRepositoryImpl(sl(), sl()));
  sl.registerLazySingleton<ForgotPasswordRepo>(
      () => ForgotPasswordRepoImpl(sl(), sl()));
  sl.registerLazySingleton<ResetPasswordRepository>(
      () => ResetPasswordRepositoryImpl(sl(), sl()));
  sl.registerLazySingleton<ProductRepository>(
      () => ProductsRepositoryImpl(sl(), sl()));
  //DataSource
  sl.registerLazySingleton<LoginDatasource>(() => LoginDatasourceImpl(sl()));
  sl.registerLazySingleton<RegisterBaseDatasource>(
      () => RegisterDataSourceImpl(sl()));
  sl.registerLazySingleton<ForgetPasswordDataSource>(
      () => ForgetPasswordDataSourceImpl(sl()));
  sl.registerLazySingleton<ResetPasswordDatasource>(
      () => ResetPasswordDataSourceImpl(sl()));
  sl.registerLazySingleton<ProductsDatasource>(
      () => ProductsDatasourceImpl(sl()));
  //---Core---//
  //API Provider
  sl.registerLazySingleton<APIProvider>(() => APIProviderImpl());
  //Network Info
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));
  //InternetConnectionChecker
  sl.registerLazySingleton(() => InternetConnectionChecker());
  //SharedPreference
  //sl.registerLazySingleton<PreferenceHelper>(() => PreferenceHelper());
}
