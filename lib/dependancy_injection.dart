import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shopack_user/core/network/payment_api_provider_impl.dart';
import 'package:shopack_user/core/theme/bloc/theme_bloc.dart';
import 'package:shopack_user/features/cart/data/datasource/placesAPI.dart';
import 'package:shopack_user/features/cart/presentation/bloc/cart_bloc.dart';
import 'package:shopack_user/features/cart/presentation/bloc/cubit/address_cubit.dart';
import 'package:shopack_user/features/cart/presentation/bloc/location_bloc.dart';
import 'package:shopack_user/features/favorite/presentation/bloc/favourite_bloc.dart';
import 'package:shopack_user/features/payment/data/datasources/payment_datasource.dart';
import 'package:shopack_user/features/payment/data/repositrories/payment_repository_impl.dart';
import 'package:shopack_user/features/payment/domain/repositories/payment_repository.dart';
import 'package:shopack_user/features/payment/domain/usecases/createNewOrder_Usecase.dart';
import 'package:shopack_user/features/payment/domain/usecases/getAllOrders.dart';
import 'package:shopack_user/features/payment/domain/usecases/requestAuth_Usecase.dart';
import 'package:shopack_user/features/payment/presentation/bloc/order_bloc.dart';
import 'package:shopack_user/features/payment/presentation/bloc/payment_bloc.dart';
import 'package:shopack_user/features/shop/domain/usecases/getAllReviews.dart';
import 'core/network/api_provider.dart';
import 'core/network/api_provider_impl.dart';
import 'core/network/network_info.dart';
import 'core/network/paymentApiProvider.dart';
import 'features/forgotpass&verifyemail/data/datasources/forgotpassword_datasource.dart';
import 'features/forgotpass&verifyemail/data/repositories/forgotpassword_repositoryimpl.dart';
import 'features/forgotpass&verifyemail/domain/repositories/forgotpassword_repository.dart';
import 'features/forgotpass&verifyemail/domain/usecases/forgotpassword_usecase.dart';
import 'features/forgotpass&verifyemail/presentation/forgotpass&verifyemail_bloc/forgotpass&verifyemail_bloc.dart';
import 'features/home/presentation/bloc/BottomNavigationBar_bloc.dart';
import 'features/login/data/datasources/login_datasource.dart';
import 'features/login/data/repositories/login_repostory_impl.dart';
import 'features/login/domin/repositories/login_repository.dart';
import 'features/login/domin/usecases/login_usecase.dart';
import 'features/login/presentation/bloc/login_bloc.dart';
import 'features/payment/domain/usecases/requestOrder_Usecase.dart';
import 'features/payment/domain/usecases/requestPayment_Usecase.dart';
import 'features/profile/data/datasources/profile_remote_datasource.dart';
import 'features/profile/data/repositories/profile_repository_impl.dart';
import 'features/profile/domain/repositories/profile_repository.dart';
import 'features/profile/domain/usecases/getUserDetail.dart';
import 'features/profile/domain/usecases/updatePassword.dart';
import 'features/profile/domain/usecases/updateProfile.dart';
import 'features/profile/presentation/bloc/profile_bloc.dart';
import 'features/profile/presentation/bloc/update_password_bloc.dart';
import 'features/register/data/datasources/register_datasource.dart';
import 'features/register/data/repositories/register_repository_impl.dart';
import 'features/register/domain/repositories/register_repository.dart';
import 'features/register/domain/usecases/register_usecase.dart';
import 'features/register/presentation/bloc/register_bloc.dart';
import 'features/setpassword/data/datasources/Resetpassword_datasource.dart';
import 'features/setpassword/data/repositories/resetpassword_repositoryimpl.dart';
import 'features/setpassword/domain/repositories/resetPassword_repository.dart';
import 'features/setpassword/domain/usecases/resetpassword_usecase.dart';
import 'features/setpassword/presentation/bloc/reset_password_bloc.dart';
import 'features/shop/data/datasources/products_datasource.dart';
import 'features/shop/data/repositories/products_repositoryimpl.dart';
import 'features/shop/domain/repositories/product_repository.dart';
import 'features/shop/domain/usecases/getAllProducts_usecase.dart';
import 'features/shop/domain/usecases/getSpecificProduct.dart';
import 'features/shop/domain/usecases/sendReview_usecase.dart';
import 'features/shop/presentation/bloc/products_bloc.dart';
import 'features/shop/presentation/bloc/send_review_bloc.dart';

GetIt injector = GetIt.instance;

Future<void> init() async {
  //BLoC
  injector.registerFactory(() => LoginBloc(injector()));
  injector.registerFactory(() => RegisterBloc(injector()));
  injector.registerFactory(() => ForgetpasswordAndeVerifyEmailBloc(injector()));
  injector.registerFactory(() => ResetPasswordBloc(injector()));
  injector.registerFactory(() => BottomNavigationBarBloc());
  injector.registerFactory(() => ProductsBloc(injector(), injector()));
  injector.registerFactory(() => ProfileBloc(injector(), injector()));
  injector.registerFactory(() => UpdatePasswordBloc(injector()));
  injector.registerFactory(() => SendReviewBloc(injector(), injector()));
  injector.registerFactory(() => FavouriteBloc());
  injector.registerFactory(() => CartBloc());
  injector.registerFactory(() => ThemeBloc());
  injector.registerFactory(() => AddressCubit(injector(), injector()));
  injector.registerFactory(() => LocationBloc(injector(), injector()));
  injector
      .registerFactory(() => PaymentBloc(injector(), injector(), injector()));
  injector.registerFactory(() => OrderBloc(injector(), injector()));
  //Usecase
  injector.registerLazySingleton(() => LoginUsecase(injector()));
  injector.registerLazySingleton(() => RegisterUsecase(injector()));
  injector.registerLazySingleton(() => ForgotPassUsecase(injector()));
  injector.registerLazySingleton(() => ResetPasswordUseCase(injector()));
  injector.registerLazySingleton(() => GetAllProductsUsecase(injector()));
  injector.registerLazySingleton(() => GetSpecificProductUseCase(injector()));
  injector.registerLazySingleton(() => GetUserDetails(injector()));
  injector.registerLazySingleton(() => UpdateUserDetailUsecase(injector()));
  injector.registerLazySingleton(() => UpdatePasswordUsecase(injector()));
  injector.registerLazySingleton(() => GetReviewsUsecase(injector()));
  injector.registerLazySingleton(() => SendReviewUsecase(injector()));
  injector.registerLazySingleton(() => RequestAuthUsecase(injector()));
  injector.registerLazySingleton(() => RequestOrderUsecase(injector()));
  injector.registerLazySingleton(() => RequestPaymentUsecase(injector()));
  injector.registerLazySingleton(() => CreateNewOrderUsecase(injector()));
  injector.registerLazySingleton(() => GetAllOrderesUsecase(injector()));
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
  injector.registerLazySingleton<ProfileRepository>(
      () => ProfileRepositoryImpl(injector(), injector()));
  injector.registerLazySingleton<PaymentRepository>(
      () => PaymentRepositoryImpl(injector(), injector()));

  //DataSource
  injector.registerLazySingleton<LoginDatasource>(
      () => LoginDatasourceImpl(injector()));
  injector.registerLazySingleton<RegisterBaseDatasource>(
      () => RegisterDataSourceImpl(injector()));
  injector.registerLazySingleton<ForgetPasswordDataSource>(
      () => ForgetPasswordDataSourceImpl(injector()));
  injector.registerLazySingleton<ResetPasswordDatasource>(
      () => ResetPasswordDataSourceImpl(injector()));
  injector.registerLazySingleton<ProductsDatasource>(
      () => ProductsDatasourceImpl(injector()));
  injector.registerLazySingleton<ProfileDatasource>(
      () => ProfileDataSourceImpl(injector()));
  injector
      .registerLazySingleton<PlacesDataSource>(() => PlacesDatasourceImpl());
  injector.registerLazySingleton<PaymentDataSource>(
      () => PaymentDataSourceImpl(injector(), injector()));

  //---Core---//
  //API Provider
  injector.registerLazySingleton<APIProvider>(() => APIProviderImpl());
  injector.registerLazySingleton<PaymentAPIProvider>(
      () => PaymentAPIProviderImpl());
  //Network Info
  injector
      .registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(injector()));
  //InternetConnectionChecker
  injector.registerLazySingleton(() => InternetConnectionChecker());

  //SharedPreference
  //injector.registerLazySingleton<PreferenceHelper>(() => PreferenceHelper());
}
