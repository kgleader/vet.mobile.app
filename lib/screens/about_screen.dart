import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vet_mobile_app/blocs/menu_bloc.dart';
import 'package:vet_mobile_app/blocs/menu_state.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<MenuBloc, MenuState>(
        builder: (context, state) {
          if (state is MenuLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is MenuLoaded) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(state.content),
            );
          }
          return Center(child: Text("Мазмун табылган жок"));
        },
      ),
    );
  }
}
