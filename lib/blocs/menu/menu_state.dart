import 'package:equatable/equatable.dart';
import 'package:vet_mobile_app/models/menu_item.dart';

abstract class MenuState extends Equatable {
  const MenuState();

  @override
  List<Object> get props => [];
}

class MenuInitial extends MenuState {}

class MenuLoading extends MenuState {}

class MenuLoaded extends MenuState {
  final List<MenuItem> items;

  const MenuLoaded(this.items);

  @override
  List<Object> get props => [items];
}

class MenuError extends MenuState {
  final String message;

  const MenuError(this.message);

  @override
  List<Object> get props => [message];
}
