import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:clean_code_ruan/presentation/providers/user_provider.dart';

class UserScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("User")),
      body: Consumer<UserProvider>(
        builder: (context, userProvider, child) {
          if (userProvider.isLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (userProvider.errorMessage != null) {
            return Center(child: Text('Error: ${userProvider.errorMessage}'));
          } else if (userProvider.user != null) {
            return Center(child: Text('User: ${userProvider.user!.name}'));
          } else {
            return Center(child: Text('No user data'));
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // For demonstration, load a user with a fixed ID.
          Provider.of<UserProvider>(context, listen: false).loadUser('123');
        },
        child: Icon(Icons.download),
      ),
    );
  }
}
