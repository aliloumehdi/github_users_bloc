

import 'package:flutter/material.dart';
import 'package:github_users_bloc/ui/widgets/main.drawer.widget.dart';

class GitUsersPage extends StatelessWidget {
  const GitUsersPage({Key?key}):super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title:const Text("Git Users"),

      ),
      body:const Center(
        child:  Text("Git Users"),
      ),
    );
  }
}