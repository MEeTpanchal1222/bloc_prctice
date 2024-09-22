import 'dart:developer';

import 'package:bloc/bloc.dart';

class myObserver extends BlocObserver{
  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    log('${bloc.runtimeType}',name: 'created');
  }
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    log('${change.runtimeType} :$change' );
  }
}


