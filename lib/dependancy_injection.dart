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

GetIt injector = GetIt.instance;

Future<void> init() async {
  //BLoC
  injector.registerFactory(() => LoginBloc(injector()));
  injector.registerFactory(() => RegisterBloc(injector()));
  injector.registerFactory(() => ForgetpasswordAndeVerifyEmailBloc(injector()));
  injector.registerFactory(() => ResetPasswordBloc(injector()));
  injector.registerFactory(() => BottomNavigationBarBloc());
  injector.registerFactory(() => ProductsBloc(injector()));
  //Usecase
  injector.registerLazySingleton(() => LoginUsecase(injector()));
  injector.registerLazySingleton(() => RegisterUsecase(injector()));
  injector.registerLazySingleton(() => ForgotPassUsecase(injector()));
  injector.registerLazySingleton(() => ResetPasswordUseCase(injector()));
  injector.registerLazySingleton(() => GetAllProductsUsecase(injector()));
  //Repository
  injector.registerLazySingleton<LoginBaseRepository>(
      () => LoginRepositoryImpl(injector(), injector()));
  injector.registerLazySingleton<RegisterBaseRepository>(
      () => RegisterRepositoryImpl(injector(), injector()));
  injector.registerLazySingleton<ForgotPasswordRepo>(
      () => ForgotPasswordRepoImpl(injector(), injector()));
  injector.registerLazySingleton<ResetPasswordRepository>(
      () => ResetPasswordRepositoryImpl(injector(), injector()));
  injector.registerLazySingleton<ProductRepository>(
      () => ProductsRepositoryImpl(injector(), injector()));
  //DataSource
  injector.registerLazySingleton<LoginDatasource>(() => LoginDatasourceImpl(injector()));
  injector.registerLazySingleton<RegisterBaseDatasource>(
      () => RegisterDataSourceImpl(injector()));
  injector.registerLazySingleton<ForgetPasswordDataSource>(
      () => ForgetPasswordDataSourceImpl(injector()));
  injector.registerLazySingleton<ResetPasswordDatasource>(
      () => ResetPasswordDataSourceImpl(injector()));
  injector.registerLazySingleton<ProductsDatasource>(
      () => ProductsDatasourceImpl(injector()));
  //---Core---//
  //API Provider
  injector.registerLazySingleton<APIProvider>(() => APIProviderImpl());
  //Network Info
  injector.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(injector()));
  //InternetConnectionChecker
  injector.registerLazySingleton(() => InternetConnectionChecker());
  //SharedPreference
  //injector.registerLazySingleton<PreferenceHelper>(() => PreferenceHelper());
}
