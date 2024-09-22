import 'package:flutter_bloc/flutter_bloc.dart';
class countercubit extends Cubit<int> {
  countercubit() : super(0);


  void incrementCounter() {
    emit(state + 1);
  }
}