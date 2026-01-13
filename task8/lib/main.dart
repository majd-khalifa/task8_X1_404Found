import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task8/core/constants/app_font.dart';
import 'package:task8/core/constants/app_route.dart';
import 'package:task8/core/services/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final sharedPrefsService = SharedPreferencesService();
  await sharedPrefsService.init();
  final dio = Dio(
    BaseOptions(
      baseUrl: ConstantData.baseUrl,
      headers: {
        'Accept': 'application/json',
        if (ConstantData.usertoken != null)
          'Authorization': 'Bearer ${ConstantData.usertoken}',
      },
    ),
  );


  final apiService = ApiService(dio);
  final authApi = AuthApi(apiService, sharedPrefsService);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  final AuthApi authApi;
  const MyApp({super.key, required this.authApi});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 852),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (_) => AuthCubit(authApi),
            ),
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            onGenerateRoute: AppRoutes.generateRoute,
            initialRoute: AppRoutes.login,
            theme: ThemeData(
              fontFamily: AppFont.beVietnamPro,
              scaffoldBackgroundColor: Colors.black,
              textTheme: const TextTheme(
                bodyMedium: TextStyle(color: Colors.white),
                bodySmall: TextStyle(color: Colors.white70),
              ),
            ),
          ),
        );
      },
    );
  }
}