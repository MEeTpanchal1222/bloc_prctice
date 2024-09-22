import 'package:bloc_prctice/cubit_counter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc_counter.dart';
import 'bloc_observer.dart';

void main() {
  Bloc.observer= myObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => countercubit()),
        BlocProvider(create: (context) => Conterbloc()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(

          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  //final cubit = countercubit();
  //final _bloc = Conterbloc();
  // void dispose () {
  //   _bloc.close();
  //   super.dispose();
  // }



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text(widget.title),
      ),
      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            BlocBuilder<Conterbloc, int>(
              //bloc: _bloc,
              builder: (context, State) {
                return
                Text(
                  '${State}',
                  style: Theme
                      .of(context)
                      .textTheme
                      .headlineMedium,
                );
              }
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          FloatingActionButton(
            onPressed: () {
              final bloc  = context.read<Conterbloc>();
              bloc.add(CounterIncrement());
             // _bloc.add(CounterIncrement());
            },
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),

          FloatingActionButton(
            onPressed: () {
              final bloc  = context.read<Conterbloc>();
              bloc.add(CounterDecrement());
              //_bloc.add(CounterDecrement());
            },
            tooltip: 'Decrement',
            child: const Icon(Icons.minimize),
          ),
        ],
      ),
    );
  }
}

// dependency injection (di) in flutter is a design that allows you to inject dependency (like services , cl;asses , or objects)
//into your code rather than creating them directly within the class