import 'package:flutter/material.dart';
import 'package:themoviedb/theme/options.dart';
import 'package:themoviedb/widgets/auth/auth_widgets.dart';
import 'package:themoviedb/widgets/main_screen/main_screen_widget.dart';
import 'package:themoviedb/widgets/movie_details/movie_details_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kino-kz',
      theme: ThemeData(
        appBarTheme: AppBarTheme(backgroundColor: AppColors.background),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
            backgroundColor: AppColors.background,
            selectedItemColor: AppColors.whiteColor,
            unselectedItemColor: AppColors.greyColor),
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/auth': (context) => AuthWidget(),
        '/main_screen': (context) => MainScreenWidget(),
        '/main_screen/movie_details': (context) {
          final arguments = ModalRoute.of(context)?.settings.arguments;
          if (arguments is int) {
            return MovieDetailsWidget(movieId: arguments);
          } else {
            return MovieDetailsWidget(movieId: 0);
          }
        }
      },
      initialRoute: '/auth',
      debugShowCheckedModeBanner: false,
    );
  }
}
