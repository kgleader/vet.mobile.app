import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vet_mobile_app/blocs/auth_bloc.dart';
import 'package:vet_mobile_app/blocs/auth_state.dart';
import 'package:vet_mobile_app/screens/menu_screen.dart';
import 'package:vet_mobile_app/screens/news_screen.dart';
import 'package:vet_mobile_app/screens/login_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Ветеринардык Тиркеме',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: CircleAvatar(
              backgroundColor: Colors.green,
              radius: 18,
              backgroundImage: AssetImage('assets/icons/logo.png'),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildUserGreeting(),
              const SizedBox(height: 24),
              _buildMenuButton(),
              const SizedBox(height: 24),
              _buildSectionTitle('Акыркы жаңылыктар'),
              const SizedBox(height: 16),
              _buildNewsPreview(),
              const SizedBox(height: 24),
              _buildSectionTitle('Ветеринардык кеңештер'),
              const SizedBox(height: 16),
              _buildVetAdvice(),
              const SizedBox(height: 24),
              _buildSectionTitle('Байланышуу'),
              const SizedBox(height: 16),
              _buildContactCards(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildNavItem(0, Icons.home, 'Башкы'),
              _buildNavItem(1, Icons.list_alt_outlined, 'Жаңылыктар'),
              _buildNavItem(2, Icons.person, 'Профиль'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildUserGreeting() {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        String greeting = 'Саламатсызбы!';
        String userName = 'Колдонуучу';

        if (state is AuthAuthenticated && state.name != null) {
          userName = state.name!;
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              greeting,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              userName,
              style: const TextStyle(fontSize: 18, color: Colors.black87),
            ),
          ],
        );
      },
    );
  }

  Widget _buildMenuButton() {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const MenuScreen()),
        );
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.green.withOpacity(0.3),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.menu, color: Colors.white),
            SizedBox(width: 8),
            Text(
              'Менюну ачуу',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        TextButton(
          onPressed: () {
            if (title == 'Акыркы жаңылыктар') {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const NewsScreen()),
              );
            }
          },
          style: TextButton.styleFrom(
            foregroundColor: Colors.green,
            padding: EdgeInsets.zero,
            minimumSize: const Size(50, 30),
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          child: const Row(
            children: [
              Text('Баарын көрүү'),
              SizedBox(width: 4),
              Icon(Icons.arrow_forward, size: 16),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildNewsPreview() {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const NewsScreen()),
          );
        },
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                'https://images.unsplash.com/photo-1605152276897-4f618f831968',
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    height: 200,
                    color: Colors.grey.shade200,
                    child: const Center(
                      child: Icon(Icons.image_not_supported, size: 50),
                    ),
                  );
                },
              ),
            ),
            Container(
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.transparent, Colors.black.withOpacity(0.7)],
                ),
              ),
            ),
            Positioned(
              bottom: 16,
              left: 16,
              right: 16,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Жаңы ветеринардык вакцина иштелип чыкты',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Бодо малдар үчүн жаңы вакцина иштелип чыкты.',
                    style: TextStyle(color: Colors.white, fontSize: 14),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(
                        Icons.calendar_today,
                        size: 14,
                        color: Colors.white,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        '02.04.2025',
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.8),
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildVetAdvice() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.green.shade50,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.green.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Icon(Icons.lightbulb, color: Colors.green),
              SizedBox(width: 8),
              Text(
                'Күндүн кеңеши',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          const Text(
            'Малдарды туура тоюттандыруу алардын ден соолугуна жана өндүрүмдүүлүгүнө түздөн-түз таасир этет. Күнүнө 2-3 жолу тоюттандыруу сунушталат.',
            style: TextStyle(fontSize: 14, height: 1.5),
          ),
          const SizedBox(height: 12),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {
                // Navigate to advice details
              },
              style: TextButton.styleFrom(
                foregroundColor: Colors.green,
                padding: EdgeInsets.zero,
                minimumSize: const Size(50, 30),
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              child: const Text('Толугураак'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContactCards() {
    return Row(
      children: [
        Expanded(
          child: _buildContactCard('Chat', Icons.chat, Colors.green.shade700),
        ),
        const SizedBox(width: 16),
        Expanded(child: _buildContactCard('Telegram', Icons.send, Colors.blue)),
      ],
    );
  }

  Widget _buildContactCard(String title, IconData icon, Color color) {
    return InkWell(
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('$title аркылуу байланышуу'),
            backgroundColor: color,
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20),
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: color.withOpacity(0.3)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: color, size: 36),
            const SizedBox(height: 8),
            Text(
              title,
              style: TextStyle(color: color, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(int index, IconData icon, String label) {
    final isSelected = _currentIndex == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          _currentIndex = index;
        });

        if (index == 1) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const NewsScreen()),
          );
        } else if (index == 2) {
          // Check if user is authenticated
          final authState = context.read<AuthBloc>().state;
          if (authState is AuthUnauthenticated) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const LoginScreen()),
            );
          } else {
            // Navigate to profile screen
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Профиль экраны азырынча жок'),
                backgroundColor: Colors.green,
              ),
            );
          }
        }
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          isSelected
              ? CircleAvatar(
                backgroundColor: Colors.white,
                radius: 25,
                child: Icon(icon, color: Colors.green, size: 26),
              )
              : Icon(icon, color: Colors.white, size: 26),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.white.withOpacity(0.7),
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
