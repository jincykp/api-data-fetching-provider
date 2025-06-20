import 'package:flutter/material.dart';
import 'package:studentapp/model/data_model.dart';

class UserDetail extends StatelessWidget {
  final DataModel user;

  const UserDetail({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(user.name)),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Card(
          child: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              ListTile(
                leading: const Icon(Icons.person),
                title: Text(user.name),
              ),
              ListTile(
                leading: const Icon(Icons.email),
                title: Text(user.email),
              ),
              ListTile(
                leading: const Icon(Icons.location_on),
                title: Text('${user.street}, ${user.city}'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
