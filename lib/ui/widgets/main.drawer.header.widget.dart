import 'package:flutter/material.dart';



class MainDrawerHeader extends StatelessWidget {
  const MainDrawerHeader({Key?key}):super(key: key);

  @override
  Widget build(BuildContext context) {

    return          DrawerHeader(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.white,Theme.of(context).primaryColor]
            )
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children:  [
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage("images/profile.png"),
            ),
            IconButton(onPressed:(){}, icon:  Icon(Icons.settings))
          ],
        )
    );
  }
}
