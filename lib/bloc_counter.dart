
import 'dart:developer';

import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

//selad class : restricts inhertance to within the same file.
//base Event
sealed class Counter {}
//Event
final class CounterIncrement extends Counter {}
final class CounterDecrement extends Counter {}

class Conterbloc extends Bloc<Counter,int> {
  Conterbloc() : super(0){
    on<CounterIncrement>(_incrementCounter
        // (event, emit){
        //   emit(state + 1);
        // }
        );

    on<CounterDecrement> (_decrementCounter);
  }
  void _incrementCounter(CounterIncrement event,Emitter emit) {
    emit(state + 1);
    if (state >=5){
      addError(Exception('cannot incres value more then 5'));
    }
  }

  void _decrementCounter(CounterDecrement event,Emitter emit) {
    emit(state - 1);
  }
 //@override
  // void onChange(Change<int> change) {
  //   super.onChange(change);
  //   log('${change.runtimeType} :$change' );
  // }
 // @override
 //  void onError(Object error, StackTrace stackTrace) {
 //    super.onError(error, stackTrace);
 //    log('error:$error - stacktree:$stackTrace');
 //  }

  // @override
  // void onTransition(Transition<Counter, int> transition) {
  //   super.onTransition(transition);
  //   log('$runtimeType $transition');
  // }

  // @override
  // void onEvent(Counter event) {
  //   super.onEvent(event);
  //   log('$runtimeType $event');
  // }
}