import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studentapp/screens/user_fullview.dart';
import 'package:studentapp/services/data_services.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<UserProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text("Users")),
      body: provider.isLoading
          ? const Center(child: CircularProgressIndicator())
          : provider.error != null
          ? Center(
              child: Text(
                provider.error!,
                style: const TextStyle(color: Colors.red),
              ),
            )
          : ListView.builder(
              itemCount: provider.users.length,
              itemBuilder: (context, index) {
                final user = provider.users[index];
                return ListTile(
                  title: Text(user.name),
                  subtitle: Text(user.email),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => UserDetail(user: user)),
                    );
                  },
                );
              },
            ),
    );
  }
}
