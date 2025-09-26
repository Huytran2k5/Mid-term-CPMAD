// Danh sách các loại trà sữa phổ biến
const List<String> milkTeaTypes = [
  'Classic Milk Tea',
  'Matcha Milk Tea',
  'Chocolate Milk Tea',
  'Thai Green Milk Tea',
  'Taro Milk Tea',
  'Black Tea Milk Tea',
  'Oolong Milk Tea',
  'Strawberry Milk Tea',
  'Mint Milk Tea',
  'Cheese Milk Tea',
];

class MyUser {
  final String uid;

  MyUser({required this.uid});
}

class UserData {
  final String uid;
  final String name;
  final String milkTeaType;
  final List<String> toppings;

  UserData({
    required this.uid,
    required this.name,
    required this.milkTeaType,
    required this.toppings,
  });
}
