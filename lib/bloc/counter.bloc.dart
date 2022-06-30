
import 'package:bloc/bloc.dart';


//EVENT
abstract class CounterEvent{}
class IncrementCounter extends CounterEvent{

}
class DecrementCounter extends CounterEvent{

}

//STATE
abstract class CounterState{
  final int counter;
  const CounterState(
      {
        required this.counter
      }
      );

}
class CounterSuccessState extends CounterState{
  CounterSuccessState({required super.counter});

}
class CounterErrorState extends CounterState{
  final String errorMessage;

  CounterErrorState({required super.counter,required this.errorMessage});

}
class CounterInitialState extends CounterState{
  CounterInitialState():super(counter: 0);



}
//BLOC
class CounterBloc extends Bloc<CounterEvent,CounterState>{

   CounterBloc( ):super(CounterInitialState()) {

    on((IncrementCounter event,emit)  {
      if(state.counter<10){
        int  counterValue= state.counter+1;
        emit(CounterSuccessState(counter:counterValue));
      }
      else{
        emit(CounterErrorState(counter: state.counter, errorMessage: 'Counter value cannot exceed 10'));
      }
    });
    on((DecrementCounter event,emit)  {
      if(state.counter>0){
        int  counterValue= state.counter-1;
        emit(CounterSuccessState(counter:counterValue));
      }
      else{
        emit(CounterErrorState(counter: state.counter, errorMessage: "Counter value can't be less than 0"));
      }
    });
  }
}
