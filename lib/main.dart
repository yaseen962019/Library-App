import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_app_final_project/CORE/View/Welcome_Screen.dart';

import 'CORE/Logic/library_cubit.dart';
import 'CORE/View/BookDetails.dart';
import 'CORE/View/Home_Screen.dart';
import 'CORE/View/ListView_books.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<BooksCubit>(
          create: (context) => BooksCubit(),
        ),
        // Add other providers here
      ],
      child:  MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Library App',
        home:WelcomeScreen()
      ),
    );
  }
}