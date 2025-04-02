import 'package:flutter/material.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  final List<Map<String, dynamic>> menuItems = const [
    {"title": "Биз жөнүндө", "icon": Icons.info},
    {"title": "Туют", "icon": Icons.grass},
    {"title": "Уруктандыруу", "icon": Icons.male},
    {"title": "Оору", "icon": Icons.vaccines},
    {"title": "Бодо мал", "icon": Icons.agriculture},
    {"title": "Кой эчкилер", "icon": Icons.pets},
    {"title": "Жылкылыр", "icon": Icons.holiday_village},
    {"title": "Тоок", "icon": Icons.egg},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Меню")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: GridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
          children:
              menuItems.map((item) {
                return GestureDetector(
                  onTap: () {
                    // Navigator.push(...) - ар бир кнопкага башка экран кийин кошобуз
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(item['icon'], size: 40, color: Colors.white),
                        const SizedBox(height: 10),
                        Text(
                          item['title'],
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            Icon(Icons.home, color: Colors.green),
            Icon(Icons.list_alt_outlined, color: Colors.green),
            Icon(Icons.medical_services_outlined, color: Colors.green),
            Icon(Icons.phone, color: Colors.green),
          ],
        ),
      ),
    );
  }
}
