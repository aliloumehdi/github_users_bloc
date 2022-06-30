



import 'package:flutter/material.dart';
import 'package:github_users_bloc/ui/widgets/main.drawer.header.widget.dart';
import 'package:github_users_bloc/ui/widgets/drawer.item.widget.dart';
class MainDrawer extends StatelessWidget {
  const MainDrawer({Key?key}):super(key: key);

  @override
  Widget build(BuildContext context) {
    List<dynamic>menus=[
      { "title":"Home","leading": Icons.home,"trailing": Icons.arrow_forward,"route":"/"},
      { "title":"Counter Stateful","leading": Icons.event,"trailing": Icons.arrow_forward,"route":"/counter1"},
      { "title":"Counter Bloc","leading": Icons.timer,"trailing": Icons.arrow_forward,"route":"/counter2"},
      { "title":"Git users","leading": Icons.person,"trailing": Icons.arrow_forward,"route":"/users"},
      { "title":"QRCode generator","leading": Icons.qr_code_2_outlined,"trailing": Icons.arrow_forward,"route":"/qrgenerator"}
    ];
    return Drawer(
      child:Column(

        children: [
         const  MainDrawerHeader(),
      Expanded(child:
      ListView.separated(
          itemBuilder: (context, index)  {
            return DrawerItem(

           title:menus[index]['title'],
  leading: menus[index]['leading'],
    trailing: menus[index]['trailing'],
   onAction: () {
     Navigator.pop(context);
     Navigator.pushNamed(context, menus[index]['route']);
   }
      );
          },
          separatorBuilder: (context, index) {
            return const Divider(height: 6 );
          },
          itemCount: menus.length
      )

//         (
//         children: [
//
// DrawerItem(
//   title:"Home",
// leading: Icons.home,
//   trailing: Icons.arrow_forward,
//   onAction: (){
//     Navigator.pop(context);
//    Navigator.pushNamed(context, "/'") ;
//   }
// )
//         ],
//       ))
      )
        ],
      ),
    );
  }
}
