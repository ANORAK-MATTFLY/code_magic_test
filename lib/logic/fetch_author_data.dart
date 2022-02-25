import 'package:code_magic_test/models/author_model.dart';
import 'package:dio/dio.dart';

class FetchAuthors {
  static List<String> images = [];

  getAuthors() async {
    String authorsListLink = "https://quotable.io/authors";
    final response = await Dio().get(authorsListLink);
    return response;
  }

  List<AuthorModel> serializeApiData(dynamic response) {
    List<AuthorModel> serializedAuthorsList = [];
    response.forEach((author) {
      final serializedAuthor = AuthorModel.fromApiData(author);

      final authorImagesListLink =
          "https://images.quotable.dev/profile/400/${serializedAuthor.slug}.jpg";

      images.add(authorImagesListLink);

      serializedAuthorsList.add(serializedAuthor);
    });
    return serializedAuthorsList;
  }
}
