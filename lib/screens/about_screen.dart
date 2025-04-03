import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Биз жөнүндө'),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Text(
          'Бул экран "Биз жөнүндө" бөлүмүнө арналган.\n\n'
          'Бул колдонмо фермерлер үчүн, мал жандыктарды кароо жана дарылоо боюнча маалыматты камтыйт.',
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
