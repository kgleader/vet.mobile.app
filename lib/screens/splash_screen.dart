import 'package:flutter/material.dart';
import 'menu_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const MenuScreen()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40),
              Center(
                child: CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.green,
                  child: Image.asset(
                    'assets/icons/logo.png',
                    width: 50,
                    height: 50,
                    errorBuilder: (context, error, stackTrace) {
                      return const Icon(
                        Icons.pets,
                        size: 40,
                        color: Colors.white,
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(height: 40),
              const Text(
                "Кош келиңиз!",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
              const SizedBox(height: 15),
              const Text(
                "Мал жаныбарларды асыроону биз менен баштаңыз.",
                style: TextStyle(fontSize: 16, color: Colors.black87),
              ),
              const Spacer(),
              Center(
                child: Image.asset(
                  'assets/images/cow.png',
                  height: 250,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      height: 250,
                      width: double.infinity,
                      // ignore: deprecated_member_use
                      color: Colors.green.withOpacity(0.1),
                      child: const Icon(
                        Icons.pets,
                        size: 80,
                        color: Colors.green,
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 20),
              const Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
