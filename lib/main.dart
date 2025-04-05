import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vet_mobile_app/blocs/auth_bloc.dart';
import 'package:vet_mobile_app/blocs/auth_event.dart';
import 'package:vet_mobile_app/blocs/menu_bloc.dart';
import 'package:vet_mobile_app/blocs/news_bloc.dart';
import 'package:vet_mobile_app/screens/splash_screen.dart';
import 'package:vet_mobile_app/screens/menu_screen.dart';
import 'package:vet_mobile_app/screens/home_screen.dart';
import 'package:vet_mobile_app/screens/login_screen.dart';
import 'package:vet_mobile_app/screens/news_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "YOUR-API-KEY",
      authDomain: "YOUR-AUTH-DOMAIN",
      projectId: "YOUR-PROJECT-ID",
      storageBucket: "YOUR-STORAGE-BUCKET",
      messagingSenderId: "YOUR-SENDER-ID",
      appId: "YOUR-APP-ID"
    ),
  );
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
          primaryColor: const Color(0xFF67AC5B),
          colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF67AC5B)),
          useMaterial3: true,
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
