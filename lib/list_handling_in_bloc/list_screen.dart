import 'package:bloc_prctice/bloc_counter.dart';
import 'package:bloc_prctice/list_handling_in_bloc/Bloc/developer_bloc.dart';
import 'package:bloc_prctice/list_handling_in_bloc/modal/Devloper_modal.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class list_screen extends StatelessWidget {
  const list_screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
         title: Text('developer'),
        elevation: 10,
      ),
      body: BlocBuilder<DeveloperBloc, List<DeveloperModal>>(
  builder: (context, state) {
    return ListView.builder(
        itemCount: state.length,
        itemBuilder: (context,index){
        return ListTile(
          title: Text(state[index].name),
          subtitle: Text(state[index].email),
          trailing: IconButton(onPressed: () => context.read<DeveloperBloc>().add(RemoveDeveloper(developer: state[index])), icon: Icon(CupertinoIcons.delete)),
        );
      });
  },
),
      floatingActionButton: FloatingActionButton(onPressed: () => context.read<DeveloperBloc>().add(AddDeveloper()),tooltip: "add Meet",child: Icon(Icons.add),),
    );
  }
}
