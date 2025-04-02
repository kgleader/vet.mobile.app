import 'package:flutter_bloc/flutter_bloc.dart';
import 'menu_event.dart';
import 'menu_state.dart';

class MenuBloc extends Bloc<MenuEvent, MenuState> {
  MenuBloc() : super(MenuInitial()) {
    on<MenuItemSelected>((event, emit) async {
      emit(MenuLoading());

      // Мисалы үчүн: title боюнча текст кайтарып жатабыз
      await Future.delayed(Duration(seconds: 1)); // API же база сыяктуу

      String content = "${event.title} боюнча маалымат бул жерде болот.";

      emit(MenuLoaded(content));
    });
  }
}
