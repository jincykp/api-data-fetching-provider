class DataModel {
  final int id;
  final String name;
  final String email;
  final String street;
  final String city;

  DataModel({
    required this.id,
    required this.name,
    required this.email,
    required this.street,
    required this.city,
  });

  factory DataModel.fromJson(Map<String, dynamic> json) {
    return DataModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      street: json['address']['street'],
      city: json['address']['city'],
    );
  }
}
