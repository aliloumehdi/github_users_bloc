

import 'package:flutter/material.dart';
import 'package:github_users_bloc/ui/widgets/main.drawer.widget.dart';

class CounterStatefulPage extends StatefulWidget {
  const CounterStatefulPage({Key?key}):super(key: key);

  @override
   State<CounterStatefulPage> createState()=>_CounterStatefulPage();


}

class _CounterStatefulPage extends State<CounterStatefulPage>{
  int counter=0;
  String errorMessage="";
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      drawer:const MainDrawer(),
      appBar: AppBar(
        title:const Text("Counter stateful"),

      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Counter value => $counter",style: Theme.of(context).textTheme.headline5),
            (errorMessage!='')?Text(" $errorMessage",style: TextStyle(color: Colors.red,fontSize: 22))
                :
                Text("")
          ],
        )

      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(onPressed: (){

            setState(() {
              if(counter>0){
                --counter;
                errorMessage="";
              }
              else{
                errorMessage="Counter value can not be less than 0";
              }
            });

          },child:const Icon(Icons.remove),),
          const   SizedBox(
            width: 8,
          ),
          FloatingActionButton(onPressed: (){
            setState(() {
              if(counter<10){
                ++counter;
                errorMessage="";
              }
              else{
                errorMessage="Counter value can not exceed 10";
              }
            });

          },child:const Icon(Icons.add),)
        ],
      ),
    );
  }

}