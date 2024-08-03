import 'package:url_launcher/url_launcher.dart';

class BookModel {
  final String id;
  final String title;
  final String subTitle;
  final List<String> author;
  final String publishDate;
  final String language;
  final String image;
  final int page;
  final String type;
  final String web;
  final String desc;

  BookModel({
    required this.id,
    required this.title,
    required this.subTitle,
    required this.author,
    required this.publishDate,
    required this.language,
    required this.image,
    required this.page,
    required this.type,
    required this.web,
    required this.desc,
  });

  static Future<void> urllaunch(String web) async {
    final Uri url = Uri.parse(web);
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }
  factory BookModel.fromJson(Map<String, dynamic> json) {
    return BookModel(
      id: json['id'],
      title: json['volumeInfo']['title'] ?? '',
      subTitle: json['volumeInfo']['subtitle'] ?? '',
      author: json['volumeInfo']['authors'] != null ? List<String>.from(json['volumeInfo']['authors']) : [],
      publishDate: json['volumeInfo']['publishedDate'] ?? '',
      language: json['volumeInfo']['language'] ?? '',
      image: json['volumeInfo']['imageLinks'] != null ? json['volumeInfo']['imageLinks']['thumbnail'] ?? '' : '',
      page: json['volumeInfo']['pageCount'] ?? 0,
      type: json['volumeInfo']['printType'] ?? '',
      web: json['accessInfo']['webReaderLink'] ?? '',
      desc: json['volumeInfo']['description'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'subTitle': subTitle,
      'author': author,
      'publishDate': publishDate,
      'language': language,
      'image': image,
      'page': page,
      'type': type,
      'webView': web,
      'desc': desc,
    };
  }
}
