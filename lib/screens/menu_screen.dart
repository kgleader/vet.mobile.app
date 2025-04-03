import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vet_mobile_app/blocs/menu_bloc.dart';
import 'package:vet_mobile_app/blocs/menu_event.dart';
import 'about_screen.dart';
import 'cow_screen.dart';
import 'news_screen.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Calculate screen width to determine item size
    final screenWidth = MediaQuery.of(context).size.width;
    // Make items smaller by using a fixed size rather than calculating from screen width
    final itemSize = 120.0; // Fixed smaller size
    
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: 30,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF01A560), size: 18),
          onPressed: () => Navigator.pushReplacementNamed(context, '/'),
        ),
        title: const Text(
          "Меню",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 16),
        ),
        centerTitle: true,
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 16),
            child: CircleAvatar(
              backgroundColor: Colors.grey[100],
              radius: 12,
              child: const Icon(Icons.person_outline, color: Color(0xFF01A560), size: 16),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 1.0,
          ),
          itemCount: 8,
          itemBuilder: (context, index) {
            switch (index) {
              case 0:
                return _buildMenuItem(
                  context,
                  "Биз жөнүндө",
                  Icons.article_outlined,
                  itemSize,
                  () => _onItemTap(context, "Биз жөнүндө", "about")
                );
              case 1:
                return _buildMenuItem(
                  context,
                  "Тоют",
                  Icons.grass,
                  itemSize,
                  () => _onItemTap(context, "Тоют", "feed")
                );
              case 2:
                return _buildMenuItem(
                  context,
                  "Урукташтыруу",
                  Icons.male,
                  itemSize,
                  () => _onItemTap(context, "Урукташтыруу", "breeding")
                );
              case 3:
                return _buildMenuItem(
                  context,
                  "Оору",
                  Icons.medical_services_outlined,
                  itemSize,
                  () => _onItemTap(context, "Оору", "disease")
                );
              case 4:
                return _buildMenuItem(
                  context,
                  "Бодо мал",
                  Icons.pets,
                  itemSize,
                  () => _onItemTap(context, "Бодо мал", "cow_screen")
                );
              case 5:
                return _buildMenuItem(
                  context,
                  "Кой эчкилер",
                  Icons.pets,
                  itemSize,
                  () => _onItemTap(context, "Кой эчкилер", "goat_screen")
                );
              case 6:
                return _buildMenuItem(
                  context,
                  "Жылкылар",
                  Icons.pets,
                  itemSize,
                  () => _onItemTap(context, "Жылкылар", "horse_screen")
                );
              case 7:
                return _buildMenuItem(
                  context,
                  "Тоок",
                  Icons.pets,
                  itemSize,
                  () => _onItemTap(context, "Тоок", "chicken_screen")
                );
              default:
                return const SizedBox.shrink();
            }
          },
        ),
      ),
      bottomNavigationBar: Container(
        height: 50,
        decoration: const BoxDecoration(
          color: Color(0xFF01A560),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildNavItem(Icons.home, true, () {
              Navigator.pushReplacementNamed(context, '/home');
            }),
            _buildNavItem(Icons.article_outlined, false, () {
              Navigator.pushNamed(context, '/news');
            }),
            _buildNavItem(Icons.calendar_month, false, () {
              // Navigate to calendar screen
            }),
            _buildNavItem(Icons.phone, false, () {
              // Navigate to contacts screen
            }),
          ],
        ),
      ),
    );
  }

  void _onItemTap(BuildContext context, String title, String screen) {
    print('Menu item tapped: $title, screen: $screen');
    context.read<MenuBloc>().add(MenuItemSelected(title));

    switch (screen) {
      case "about":
        print('Navigating to AboutScreen');
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const AboutScreen()),
        );
        break;
      case "cow_screen":
        print('Navigating to CowScreen');
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const CowScreen()),
        );
        break;
      case "news":
        print('Navigating to NewsScreen');
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const NewsScreen()),
        );
        break;
      default:
        print('Navigating to DetailScreen for $title');
        // Create a generic detail screen for items that don't have specific screens yet
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => DetailScreen(title: title, screen: screen),
          ),
        );
    }
  }

  Widget _buildMenuItem(BuildContext context, String title, IconData icon, double size, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: const Color(0xFF01A560),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Icon(
                icon,
                color: const Color(0xFF01A560),
                size: 18,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(IconData icon, bool isSelected, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          isSelected
              ? Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(icon, color: const Color(0xFF01A560), size: 16),
                )
              : Icon(icon, color: Colors.white, size: 16),
          const SizedBox(height: 2),
        ],
      ),
    );
  }
}

// Generic detail screen for menu items that don't have specific screens yet
class DetailScreen extends StatelessWidget {
  final String title;
  final String screen;

  const DetailScreen({
    super.key,
    required this.title,
    required this.screen,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF01A560)),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(title, style: const TextStyle(color: Colors.black)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Center(
              child: Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: const Color(0xFF01A560),
                  borderRadius: BorderRadius.circular(40),
                ),
                child: const Icon(
                  Icons.pets,
                  size: 40,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 30),
            Center(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Бул бөлүм азыр иштелип жатат. Жакында маалыматтар кошулат.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            const Text(
              'Бул бөлүмдө төмөнкү маалыматтар болот:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            _buildBulletPoint('Негизги маалыматтар'),
            _buildBulletPoint('Кеңештер жана сунуштар'),
            _buildBulletPoint('Сүрөттөр жана видеолор'),
            _buildBulletPoint('Эксперттердин пикирлери'),
            const SizedBox(height: 30),
            const Divider(color: Color(0xFF01A560)),
            const SizedBox(height: 20),
            const Text(
              'Кошумча маалымат алуу үчүн, биздин адистер менен байланышыңыз:',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildContactButton(Icons.chat, 'WhatsApp'),
                _buildContactButton(Icons.send, 'Telegram'),
                _buildContactButton(Icons.phone, 'Телефон'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBulletPoint(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('• ', style: TextStyle(fontSize: 16, color: Color(0xFF01A560))),
          Expanded(
            child: Text(text, style: const TextStyle(fontSize: 16)),
          ),
        ],
      ),
    );
  }

  Widget _buildContactButton(IconData icon, String label) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: const Color(0xFF01A560),
          radius: 25,
          child: Icon(icon, color: Colors.white),
        ),
        const SizedBox(height: 8),
        Text(label, style: const TextStyle(fontSize: 12)),
      ],
    );
  }
}
