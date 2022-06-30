
import 'package:flutter/material.dart';

class DrawerItem extends StatelessWidget {
  final String title;
  final IconData leading;
  final IconData trailing;
  final Function onAction;
  const DrawerItem({Key?key,required this.title,required this.leading,required this.trailing,required this.onAction}):super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title,style: Theme.of(context).textTheme.headline5,),
      leading: Icon(leading,color: Theme.of(context).primaryColor),
      trailing: Icon(trailing,color: Theme.of(context).primaryColor),
      onTap: ()=>onAction(),

    );
  }
}
