class MenuItem {
  final String id;
  final String title;
  final String icon;
  final String route;

  MenuItem({
    required this.id,
    required this.title,
    required this.icon,
    required this.route,
  });

  factory MenuItem.fromMap(Map<String, dynamic> map) {
    return MenuItem(
      id: map['id'] ?? '',
      title: map['title'] ?? '',
      icon: map['icon'] ?? '',
      route: map['route'] ?? '',
    );
  }
}
