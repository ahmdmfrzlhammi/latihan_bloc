// import 'package:flutter/material.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
  
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       home: const MyHomePage(title: 'Flutter Demo Home Page'),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});

 

//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;

//   void _incrementCounter() {
//     setState(() {
      
//       _counter++;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
    
//     return Scaffold(
//       appBar: AppBar(
       
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        
//         title: Text(widget.title),
//       ),
//       body: Center(
       
//         child: Column(
          
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Text(
//               'You have pushed the button this many times:',
//             ),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.headlineMedium,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latihan_bloc/bloc/auth/auth_bloc.dart';
import 'package:latihan_bloc/bloc/bilangan_Primer/bilangan_primer_cubit.dart';
import 'package:latihan_bloc/bloc/ganjil_genap/ganjilgenap_cubit.dart';
import 'package:latihan_bloc/pages/login_page.dart';
// ignore: unused_import
import 'package:latihan_bloc/pages/smartbuilding.dart';
import 'counter_cubit.dart'; // Make sure the correct path is used here
// ignore: unused_import
import 'counter_page.dart'; // Make sure the correct path is used here
import 'visibility_cubit.dart'; // Import your VisibilityCubit

void main() => runApp(CounterApp());

class CounterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MultiBlocProvider(
        providers: [
          BlocProvider<CounterCubit>(
            create: (_) => CounterCubit(),
          ),
          BlocProvider<VisibilityCubit>(
            create: (_) => VisibilityCubit(),
          ),
          BlocProvider(
            create: (context) => GanjilgenapCubit(),
          ),
          BlocProvider(
            create: (context) => BilanganPrimerCubit(),
          ),
          BlocProvider(
            create: (context) => AuthBloc(),   
          )
        ],
        child:  LoginPage(),
      ),
    );
  }
}
