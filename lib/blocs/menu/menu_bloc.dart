import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:vet_mobile_app/blocs/menu/menu_event.dart';
import 'package:vet_mobile_app/blocs/menu/menu_state.dart';
import 'package:vet_mobile_app/models/menu_item.dart';

class MenuBloc extends Bloc<MenuEvent, MenuState> {
  final FirebaseFirestore _firestore;

  MenuBloc({FirebaseFirestore? firestore})
      : _firestore = firestore ?? FirebaseFirestore.instance,
        super(MenuInitial()) {
    on<LoadMenu>(_onLoadMenu);
  }

  Future<void> _onLoadMenu(LoadMenu event, Emitter<MenuState> emit) async {
    try {
      emit(MenuLoading());
      
      final snapshot = await _firestore.collection('menu_items').orderBy('order').get();
      final items = snapshot.docs.map((doc) => MenuItem.fromMap(doc.data())).toList();
      
      emit(MenuLoaded(items));
    } catch (e) {
      emit(MenuError(e.toString()));
    }
  }
}
