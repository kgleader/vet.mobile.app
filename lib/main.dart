import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vet_mobile_app/blocs/auth_bloc.dart';
import 'package:vet_mobile_app/blocs/auth_event.dart';
import 'package:vet_mobile_app/blocs/menu_bloc.dart';
import 'package:vet_mobile_app/blocs/news_bloc.dart';
import 'screens/splash_screen.dart';
import 'screens/menu_screen.dart';
import 'screens/home_screen.dart';
import 'screens/login_screen.dart';
import 'screens/news_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // For development, we'll skip Firebase initialization
  // await Firebase.initializeApp();
  runApp(const VetApp());
}

class VetApp extends StatelessWidget {
  const VetApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (context) => AuthBloc()..add(AuthCheckRequested()),
        ),
        BlocProvider<MenuBloc>(
          create: (context) => MenuBloc(),
        ),
        BlocProvider<NewsBloc>(
          create: (context) => NewsBloc(),
        ),
      ],
      child: MaterialApp(
        title: 'Vet Mobile App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.green,
          fontFamily: 'Roboto',
          scaffoldBackgroundColor: Colors.white,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => const SplashScreen(),
          '/menu': (context) => const MenuScreen(),
          '/home': (context) => const HomeScreen(),
          '/login': (context) => const LoginScreen(),
          '/news': (context) => const NewsScreen(),
        },
      ),
    );
  }
}
