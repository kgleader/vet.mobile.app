import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vet_mobile_app/blocs/auth_bloc.dart';
import 'package:vet_mobile_app/blocs/auth_state.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          if (state is AuthAuthenticated) {
            return _buildWelcomeContent(context, state.name ?? 'Колдонуучу');
          } else {
            return _buildWelcomeContent(context, 'Колдонуучу');
          }
        },
      ),
    );
  }

  Widget _buildWelcomeContent(BuildContext context, String userName) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 40),
            Center(
              child: CircleAvatar(
                radius: 60,
                backgroundColor: Colors.green,
                child: Image.asset(
                  'assets/icons/logo.png',
                  width: 80,
                  height: 80,
                  errorBuilder: (context, error, stackTrace) {
                    print("Logo image error: $error");
                    return const Icon(
                      Icons.pets,
                      size: 60,
                      color: Colors.white,
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 40),
            Text(
              'Кош келиңиз, $userName!',
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            const Text(
              'Мал жаныбарларды асыроо боюнча маалыматтарды жана кеңештерди алуу үчүн бул тиркемени колдонуңуз.',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black87,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 60),
            Image.asset(
              'assets/images/cow.png',
              height: 200,
              errorBuilder: (context, error, stackTrace) {
                print("Cow image error: $error");
                return const Icon(
                  Icons.image_not_supported,
                  size: 100,
                  color: Colors.grey,
                );
              },
            ),
            const Spacer(),
            BlocBuilder<AuthBloc, AuthState>(
              builder: (context, state) {
                if (state is AuthAuthenticated) {
                  return ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacementNamed('/home');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      'Баштоо',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  );
                } else {
                  return Column(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacementNamed('/login');
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: const Text(
                          'Кирүү',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      OutlinedButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacementNamed('/home');
                        },
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(color: Colors.green, width: 2),
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: const Text(
                          'Каттоосуз улантуу',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  );
                }
              },
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
