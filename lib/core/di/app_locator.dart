import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:glow_me/core/api/api_services.dart';
import 'package:glow_me/features/auth/presentation/data/repo/login_repo_imple.dart';
import 'package:glow_me/features/auth/presentation/data/repo/register_repo_imple.dart';
import 'package:glow_me/features/auth/presentation/data/repo/reset_password_repo_imple.dart';
import 'package:glow_me/features/auth/presentation/views/controller/cubit/login/login_cubit.dart';
import 'package:glow_me/features/auth/presentation/views/controller/cubit/register/register_cubit.dart';
import 'package:glow_me/features/auth/presentation/views/controller/cubit/resetpassord/reset_password_cubit.dart';
import 'package:glow_me/features/home/data/repo/get_product_by_type/get_product_by_type_repo_imple.dart';
import 'package:glow_me/features/home/data/repo/product/product_repo_imple.dart';
import 'package:glow_me/features/home/presentation/controller/product/product_cubit.dart';
import 'package:glow_me/features/home/presentation/controller/product_type/type_of_product_cubit.dart';
import 'package:glow_me/features/search/data/repo/search_repo_imple.dart';
import 'package:glow_me/features/search/presentation/controller/cubit/search_cubit.dart';

final getIt = GetIt.instance;
void setup() {
  getIt.registerSingleton<ApiServices>(ApiServices(dio: Dio()));
  getIt.registerSingleton<ProductRepoImple>(
    ProductRepoImple(apiServices: getIt.get<ApiServices>()),
  );
  getIt.registerSingleton<ProductCubit>(
    ProductCubit(productRepoImple: getIt.get<ProductRepoImple>()),
  );
  getIt.registerSingleton<GetProductByTypeRepoImple>(
    GetProductByTypeRepoImple(apiServices: getIt.get<ApiServices>()),
  );
  getIt.registerSingleton<TypeOfProductCubit>(
    TypeOfProductCubit(
      getProductByTypeRepoImple: getIt.get<GetProductByTypeRepoImple>(),
    ),
  );
  getIt.registerSingleton<SearchRepoImple>(
    SearchRepoImple(apiServices: getIt.get<ApiServices>()),
  );
  getIt.registerFactory<SearchCubit>(
    () => SearchCubit(searchRepoImple: getIt.get<SearchRepoImple>()),
  );
  getIt.registerSingleton<RegisterRepoImple>(
    RegisterRepoImple(firebaseAuth: FirebaseAuth.instance),
  );
  getIt.registerSingleton<RegisterCubit>(
    RegisterCubit(registerRepoImple: getIt.get<RegisterRepoImple>()),
  );
  getIt.registerSingleton<LoginRepoImple>(
    LoginRepoImple(firebaseAuth: FirebaseAuth.instance),
  );
  getIt.registerSingleton<LoginCubit>(
    LoginCubit(loginRepoImple: getIt.get<LoginRepoImple>()),
  );
  getIt.registerSingleton<ResetPasswordRepoImple>(
    ResetPasswordRepoImple(firebaseAuth: FirebaseAuth.instance),
  );
  getIt.registerSingleton<ResetPasswordCubit>(
    ResetPasswordCubit(
      resetPasswordRepoImple: getIt.get<ResetPasswordRepoImple>(),
    ),
  );
}
