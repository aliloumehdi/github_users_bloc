import 'package:flutter/material.dart';
import 'package:github_users_bloc/bloc/theme.bloc.dart';
import 'package:github_users_bloc/ui/pages/counter.bloc.page.dart';
import 'package:github_users_bloc/ui/pages/counter.stateful.page.dart';
import 'package:github_users_bloc/ui/pages/git.users.page.dart';
import 'package:github_users_bloc/ui/pages/home.page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_users_bloc/ui/pages/qr.code.generator.page.dart';
class RootView extends StatelessWidget {
  const RootView({Key?key}):super(key: key);
  @override
  Widget build(BuildContext context) {
//     return MaterialApp(
//       // theme: ThemeData(
//       //     primarySwatch: Colors.teal,
//       //         textTheme:const TextTheme(
//       //           headline6: TextStyle(
//       //             color: Colors.red
//       //           )
//       //         )
//       // ),
//       theme: BlocBuilder<ThemeBloc,ThemeState>(
// builder: (context, state) {
//
// },
//       ),
//       routes: {
//         "/":(context)=>const HomePage(),
//         "/counter1":(context)=>const CounterStatefulPage(),
//         "/counter2":(context)=>const CounterBlocPage(),
//         "/users":(context)=>const GitUsersPage(),
//
//       },
//       initialRoute: "/",
//     );
  return BlocBuilder<ThemeBloc,ThemeState>(builder:(context, state) {
   return MaterialApp(
     theme: state.themeData,
           routes: {
        "/":(context)=>const HomePage(),
        "/counter1":(context)=>const CounterStatefulPage(),
        "/counter2":(context)=>const CounterBlocPage(),
        "/qrgenerator":(context)=>const QRCodeGeneratorPage(),
        "/users":(context)=>const GitUsersPage()
      },
      initialRoute: "/",
   ) ;
  });
  }
}
