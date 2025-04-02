abstract class MenuEvent {}

class MenuItemSelected extends MenuEvent {
  final String title;
  MenuItemSelected(this.title);
}
