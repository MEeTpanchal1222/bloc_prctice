import 'package:bloc_prctice/list_handling_in_bloc/modal/Devloper_modal.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:faker/faker.dart';

part 'developer_event.dart';


class DeveloperBloc extends Bloc<DeveloperEvent, List<DeveloperModal>> {
  DeveloperBloc() : super([]) {
    on<AddDeveloper>(_addDeveloper);
    on<RemoveDeveloper>(_removeDeveloper);
  }

  void _addDeveloper(AddDeveloper event , Emitter emit){
    final faker = Faker();
    final developer = DeveloperModal(name: faker.person.name(), email: faker.internet.email());
    state.add(developer);
    emit(List.of(state));


    //emit([...state,developer]);
  }
  void _removeDeveloper(RemoveDeveloper event , Emitter emit){

    state.remove(event.developer);
    emit(List.of(state));
  }
}
