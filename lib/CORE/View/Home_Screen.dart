import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Logic/library_cubit.dart';
import '../Logic/library_state.dart';
import 'BookDetails.dart';
import 'ListView_books.dart';

class HomeScreen extends StatelessWidget {
  final List<String> imgList = [
    'assets/images/1-0١.png',
    'assets/images/2-0١.png',
    'assets/images/3-0١.png',
    'assets/images/4-0١.png',

  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(

      child: BlocProvider(
  create: (context) => BooksCubit()..foryoubooks(),
  child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF202323),

          title:  Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text('Novel ',style: TextStyle(fontSize: 30,color: Colors.white),),
              Text('Nook',style: TextStyle(fontSize: 30,color: Colors.grey),),
              SizedBox(width: 75,),
              Text('Hi,Yaseen',style: TextStyle(fontSize: 15,color: Colors.grey),),
              SizedBox(width: 5,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                  child: Icon(Icons.account_circle_outlined)
                ),
              )
            ],
          ),

        ),
          backgroundColor: const Color(0xFF202323),
        body:  Column(
          children: [

        CarouselSlider(
          options: CarouselOptions(
            viewportFraction: 1,
            height: 250.0,
            autoPlay: true, // Optional: to automatically play the carousel
          ),
          items: imgList.map((url) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      url,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
            );
          }).toList(),
        ),
            SizedBox(height: 16,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(children: [
                Text('Books Category',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 20),)
              ],),
            ),
            SizedBox(height: 5,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(

                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [

                    SizedBox(
                      height:40,
                      width: 120,
                      child: ElevatedButton(
                        onPressed:(){
                          Navigator.push(context,
                          MaterialPageRoute(builder: (context) => const ListviewBooks(id2: 'programming',)));
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF202323),
                            padding: const EdgeInsets.all(12),

                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            side: BorderSide(
                              color: Colors.white,
                              width: 2,
                            )
                        ),
                        child: const Text('Programming', style: TextStyle(fontSize: 11, color: Colors.white)),
                      ),
                    ),
                    SizedBox(width: 8,),
                    SizedBox(
                      height:40,
                      width: 100,
                      child: ElevatedButton(
                        onPressed:(){
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => const ListviewBooks(id2: 'science',)));
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF202323),
                            padding: const EdgeInsets.all(12),

                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            side: BorderSide(
                              color: Colors.white,
                              width: 2,
                            )
                        ),
                        child: const Text('Science', style: TextStyle(fontSize: 14, color: Colors.white)),
                      ),
                    ),
                    SizedBox(width: 8,),
                    SizedBox(
                      height:40,
                      width: 100,
                      child: ElevatedButton(
                        onPressed:(){
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => const ListviewBooks(id2: 'free-ebooks',)));
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF202323),
                            padding: const EdgeInsets.all(12),

                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            side: BorderSide(
                              color: Colors.white,
                              width: 2,
                            )
                        ),
                        child: const Text('Free books', style: TextStyle(fontSize: 13, color: Colors.white)),
                      ),
                    ),
                    SizedBox(width: 8,),
                    SizedBox(
                      height:40,
                      width: 100,
                      child: ElevatedButton(
                        onPressed:(){
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => const ListviewBooks(id2: 'business',)));
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF202323),
                            padding: const EdgeInsets.all(12),

                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            side: BorderSide(
                              color: Colors.white,
                              width: 2,
                            )
                        ),
                        child: const Text('Business', style: TextStyle(fontSize: 14, color: Colors.white)),
                      ),
                    ),

                  ],
                ),
              ),
            ),
            SizedBox(height: 5,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(children: [
                Text('Books For You',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 20),)
              ],),
            ),
            SizedBox(height: 5,),
            BlocBuilder<BooksCubit, BooksState>(
              builder: (context, state) {
                var cubit = BooksCubit.get(context);
                if (state is BooksLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is BooksLoaded) {
                  return Expanded(
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: cubit.books.length,
                      itemBuilder: (context, index) {
                        return
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Bookdetails(id1:cubit.books[index].id!),
                                    ),
                                  );
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                      children: [
                                        cubit.books[index].image!=null?
                                        ClipRRect(
                                          borderRadius: BorderRadius.circular(10),

                                          child:Image.network(cubit.books[index].image),
                                        ):Container(height:230,width: 120,color: Colors.grey,),

                                        Container(
                                               width: 120,
                                          child: Expanded(
                                            child: Text(
                                              cubit.books[index].title,
                                              style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ),

                                      ],
                                    ),
                                ),
                              );
                      }, separatorBuilder: (context, index) {
                      return SizedBox(width: 4,);
                    },
                    ),
                  );
                } else if (state is BooksError) {
                  return Center(child: Text('Error'));
                }
                return Center(child: Text('Press the button to fetch books'));
              },
            ),
          ],
        )
      
      ),
),
    );
  }
}
