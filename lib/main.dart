import 'package:bloc_prctice/cubit_counter.dart';
import 'package:bloc_prctice/cubit_score.dart';
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
        BlocProvider(create: (context)=> Ratingcubit()),
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

            // BlocBuilder<Ratingcubit, RatingState>(
            //   //bloc: _bloc,
            //     buildWhen: (previous,current)=> previous.blocscore != current.blocscore,
            //     builder: (context, State) {
            //       return
            //         Text(
            //           '${State.blocscore}',
            //           style: Theme
            //               .of(context)
            //               .textTheme
            //               .headlineMedium,
            //         );
            //     }
            // ),
            // BlocBuilder<Ratingcubit, RatingState>(
            //   //bloc: _bloc,
            //   buildWhen: (previous,current)=> previous.cubitscore != current.cubitscore,
            //     builder: (context, State) {
            //       return
            //         Text(
            //           '${State.cubitscore}',
            //           style: Theme
            //               .of(context)
            //               .textTheme
            //               .headlineMedium,
            //         );
            //     }
            // ),
            BlocSelector<Ratingcubit,RatingState,int>(selector: (state) => state.blocscore, builder: (context, State) {
          return
            Text(
              '${State}',
              style: Theme
                  .of(context)
                  .textTheme
                  .headlineMedium,
            );
        }),
            BlocSelector<Ratingcubit,RatingState,int>(selector: (state) => state.cubitscore, builder: (context, State) {
              return
                Text(
                  '${State}',
                  style: Theme
                      .of(context)
                      .textTheme
                      .headlineMedium,
                );
            }),
            // BlocListener<Ratingcubit,RatingState>(listener: (context,state){
            //   if(state.blocscore == 5) {
            //    const snackbar = SnackBar(content: Text('bloc wins'));
            //    ScaffoldMessenger.of(context).showSnackBar(snackbar);
            //   }
            // },
            //   child: Text('Bloc vs Cubit'),
            //   listenWhen: (previous, current) => current.blocscore == 5,
            //
            // )
            BlocConsumer<Ratingcubit,RatingState>(
              listenWhen: (previous, current) => current.blocscore == 5 ||current.cubitscore == 5  ,
              listener: (context,state){
              // if(state.blocscore == 5) {
              //   const snackbar = SnackBar(content: Text('bloc wins'));
              //   ScaffoldMessenger.of(context).showSnackBar(snackbar);
              // }
              final snackbar = SnackBar(content: Text(state.blocscore == 5?'bloc wins':'cubit wins'));
              ScaffoldMessenger.of(context).showSnackBar(snackbar);
            },
              builder: (context,state){
                return Text('Bloc vs Cubit');}


            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          FloatingActionButton(
            onPressed: () {
              // final bloc  = context.read<Conterbloc>();
              // bloc.add(CounterIncrement());

              context.read<Ratingcubit>().upvoteBloc();


             // _bloc.add(CounterIncrement());
            },
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),

          FloatingActionButton(
            onPressed: () {
              // final bloc  = context.read<Conterbloc>();
              // bloc.add(CounterDecrement());


          context.read<Ratingcubit>().upvoteCubit();




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