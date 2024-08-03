// books_cubit.dart
import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';
import '../Data/Model/Books_model.dart';
import 'library_state.dart';

class BooksCubit extends Cubit<BooksState> {
  BooksCubit() : super(BooksInitial());
  static BooksCubit get(context){
    return BlocProvider.of(context);
  }
  List<BookModel> books = [];
  void getbook(String id2) async {
    emit(BooksLoading());
    try {
      var url = Uri.parse('https://www.googleapis.com/books/v1/volumes?q=${id2}');
      var response = await http.get(url);
      if (response.statusCode == 200) {
        var Data = jsonDecode(response.body);
        for (var element in Data['items']) {
          books.add(BookModel.fromJson(element));
        }
        emit(BooksLoaded(books));
      } else {
        emit(BooksError('Failed to fetch data'));
      }
    } catch (e) {
      emit(BooksError(e.toString()));
    }
  }
  List<BookModel> programming_ = [];
  void foryoubooks() async {
    emit(BooksLoading());
    try {
      var url = Uri.parse('https://www.googleapis.com/books/v1/volumes?q=programming#');
      var response = await http.get(url);
      if (response.statusCode == 200) {
        var Data = jsonDecode(response.body);
        for (var element in Data['items']) {
          books.add(BookModel.fromJson(element));
        }
        emit(BooksLoaded(books));
      } else {
        emit(BooksError('Failed to fetch data'));
      }
    } catch (e) {
      emit(BooksError(e.toString()));
    }
  }

  void getdetails(String id1) async {
    emit(BooksLoading());
    try {
      var url = Uri.parse('https://www.googleapis.com/books/v1/volumes/$id1');
      var response = await http.get(url);
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        books.clear();
        books.add(BookModel.fromJson(data));
        emit(BooksLoaded(books));
      } else {
        emit(BooksError('Failed to fetch data'));
      }
    } catch (e) {
      emit(BooksError(e.toString()));
    }
  }


}
