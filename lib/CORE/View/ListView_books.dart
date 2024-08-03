import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_app_final_project/CORE/Data/Model/Books_model.dart';
import 'package:library_app_final_project/CORE/View/BookDetails.dart';

import '../Logic/library_cubit.dart';
import '../Logic/library_state.dart';

class ListviewBooks extends StatelessWidget {
  const ListviewBooks({super.key, required this.id2});
  final String id2;

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        backgroundColor: const Color(0xFF202323),
        appBar: AppBar(

          title: const Text('Programming',
            style: TextStyle(color: Colors.white,
                fontWeight: FontWeight.bold
            ),
          ),
          backgroundColor: const Color(0xFF202323),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios_outlined,
              size: 20,
            ),
            color: Colors.white,
          ),
        ),
        body:
        BlocProvider(
          create: (context) => BooksCubit()..getbook(id2),
          child: BlocBuilder<BooksCubit, BooksState>(
            builder: (context, state) {
              var cubit = BooksCubit.get(context);
              if (state is BooksLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is BooksLoaded) {
                return ListView.separated(
                  itemCount: cubit.books.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        height: 170,
                        width: 200,
                        color: Colors.transparent,
                        child: InkWell(

                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Bookdetails(id1:cubit.books[index].id!),
                              ),
                            );
                          },

                          child:
                          Row(
                            children: [
                              cubit.books[index].image!=null?
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),

                                child:Image.network(cubit.books[index].image),
                                  ):Container(height:230,width: 120,color: Colors.grey,),
                              SizedBox(width: 7,),
                              Expanded(
                                child:Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      cubit.books[index].title,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Text(
                                      cubit.books[index].publishDate,
                                      style: const TextStyle(
                                        color: Colors.grey,
                                      ),
                                    ),
                                    Text(
                                      cubit.books[index].author.join(', '), // Join the list of authors into a single string
                                      style: const TextStyle(
                                        color: Colors.grey,
                                      ),
                                    ),
                                    Text('Pages:${cubit.books[index].page}',style: TextStyle(color: Colors.grey),)
                                  ],
                                )
                              ),


                            ],
                          ),
                        ),
                      ),
                    );
                  }, separatorBuilder: (context, index) {
                  return SizedBox(height: 12,);
                },
                );
              } else if (state is BooksError) {
                return Center(child: Text('Error'));
              }
              return Center(child: Text('Press the button to fetch books'));
            },
          ),
        ),

      );
  }
}
