import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:glow_me/core/di/app_locator.dart';
import 'package:glow_me/core/sharedPrefrances/shred_pref_cache.dart';
import 'package:glow_me/core/stripe_payment/stripe_key.dart';
import 'package:glow_me/core/utils/func/check_state_changes.dart';
import 'package:glow_me/core/utils/provider/cart.dart';
import 'package:glow_me/core/utils/provider/wishlist.dart';
import 'package:glow_me/features/auth/presentation/views/controller/cubit/login/login_cubit.dart';
import 'package:glow_me/features/auth/presentation/views/controller/cubit/register/register_cubit.dart';
import 'package:glow_me/features/auth/presentation/views/controller/cubit/resetpassord/reset_password_cubit.dart';
import 'package:glow_me/features/home/presentation/controller/product/product_cubit.dart';
import 'package:glow_me/features/home/presentation/controller/product_type/type_of_product_cubit.dart';
import 'package:glow_me/features/search/presentation/controller/cubit/search_cubit.dart';
import 'package:glow_me/features/splash/presentation/views/splash_screen.dart';
import 'package:glow_me/firebase_options.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await SharedPrefCache.initialSharedPref();
  checkStateChanges();
  setup();
  Stripe.publishableKey = StripeKey.publishableKey;
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Cart()),
        ChangeNotifierProvider(create: (_) => Wishlist()),
      ],
      child: const GlowMe(),
    ),
  );
}

class GlowMe extends StatelessWidget {
  const GlowMe({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt.get<ProductCubit>()..fetchProduct(),
        ),
        BlocProvider(create: (context) => getIt.get<TypeOfProductCubit>()),
        BlocProvider(create: (context) => getIt.get<SearchCubit>()),
        BlocProvider(create: (context) => getIt.get<RegisterCubit>()),
        BlocProvider(create: (context) => getIt.get<LoginCubit>()),
        BlocProvider(create: (context) => getIt.get<ResetPasswordCubit>()),
      ],
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Glow Me',
            theme: ThemeData(scaffoldBackgroundColor: Colors.white),
            home: child,
          );
        },
        child: SplashScreen(),
      ),
    );
  }
}
