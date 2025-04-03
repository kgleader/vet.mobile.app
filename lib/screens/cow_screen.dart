import 'package:flutter/material.dart';

class CowScreen extends StatelessWidget {
  const CowScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Бодо мал'),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Text(
          'Бул экран бодо мал тууралуу маалыматты көрсөтөт.\n\n'
          'Туут, уруктандыруу, оорулар ж.б. темаларга бөлүнөт.',
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
