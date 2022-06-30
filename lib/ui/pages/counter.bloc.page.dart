import 'package:flutter/material.dart'; 
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_users_bloc/bloc/counter.bloc.dart';
import 'package:github_users_bloc/ui/themes/themes.dart';

class CounterBlocPage extends StatelessWidget {
  const CounterBlocPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Counter Bloc"),

      ),
      body: Center(
        child: BlocBuilder<CounterBloc,CounterState>
          (builder: (context, state) {
            if(state is CounterSuccessState||state is CounterInitialState){
              return Text(
                  "Counter value => ${state.counter}",
                style: Theme.of(context).textTheme.headline5,
              );
            }
           else if(state is CounterErrorState){
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                Text(
              "Counter value => ${state.counter}",
                style: Theme.of(context).textTheme.headline5,
              ),
            Text(state.errorMessage,
          style:CustomThemes.errorTextStyle
          )
                ],
              );
            }
           else{
              return const Text("data");
            }
        }),
      ),
      floatingActionButton:Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(onPressed: (){
context.read<CounterBloc>().add(DecrementCounter());

          },child:const Icon(Icons.remove),
          heroTag: "dec",
          ),
          const SizedBox(width: 6,),
          FloatingActionButton(onPressed: (){
            context.read<CounterBloc>().add(IncrementCounter());

          },child:const Icon(Icons.add),
            heroTag: "inc",
          )
        ],
      ) ,
    );
  }
}
