import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_app_final_project/CORE/Logic/library_cubit.dart';
import 'package:library_app_final_project/CORE/Logic/library_state.dart';
import 'package:library_app_final_project/CORE/Data/Model/Books_model.dart';
import 'package:url_launcher/url_launcher.dart'; // Add this import if not already present

class Bookdetails extends StatelessWidget {
  Bookdetails({super.key, required this.id1});

  final String id1;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BooksCubit()..getbook(id1),
      child: Scaffold(
        backgroundColor: const Color(0xFF202323),
        appBar: AppBar(
          title: Text('Book Details', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          backgroundColor: const Color(0xFF202323),
          elevation: 0,
          leading: Icon(Icons.arrow_back, color: Colors.white),
        ),
        body: BlocBuilder<BooksCubit, BooksState>(
          builder: (context, state) {
            var cubit = BooksCubit.get(context);
            if (state is BooksLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is BooksLoaded) {
              var book = cubit.books[0];
              return SingleChildScrollView(
                physics: ScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          book.image!,
                          width: 300,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(height: 16),
                      Text(book.title!, style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              'By: ${book.author.join(', ')}',
                              style: TextStyle(fontSize: 16, color: Colors.grey),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              'Date: ${book.publishDate}',
                              style: TextStyle(fontSize: 16, color: Colors.grey),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              'Pages: ${book.page}',
                              style: TextStyle(fontSize: 16, color: Colors.grey),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                      const Row(
                        children: [
                          Icon(Icons.star, color: Colors.yellow, size: 24),
                          Icon(Icons.star, color: Colors.yellow, size: 24),
                          Icon(Icons.star, color: Colors.yellow, size: 24),
                          Icon(Icons.star, color: Colors.yellow, size: 24),
                          Icon(Icons.star_half, color: Colors.yellow, size: 24),
                          SizedBox(width: 8),
                          Text('4.7', style: TextStyle(fontSize: 16, color: Colors.white)),
                        ],
                      ),
                      SizedBox(height: 16),
                      Text(book.desc!, style: TextStyle(fontSize: 16, color: Color(0xff949393))),
                      SizedBox(height: 16),
                      Container(
                        width: double.infinity, // Set width to expand to full width
                        height: 50, // Set a fixed height for the button
                        child: ElevatedButton(
                          onPressed: () => BookModel.urllaunch(book.web),
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: Text('Buy Now', style: TextStyle(fontSize: 16, color: Color(0xFF202323))),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            } else if (state is BooksError) {
              return Center(child: Text('Error: ${state.message}'));
            }
            return Center(child: Text('Something went wrong!'));
          },
        ),
      ),
    );
  }
}
