import 'package:code_magic_test/data.dart';
import 'package:code_magic_test/logic/fetch_author_data.dart';
import 'package:code_magic_test/models/author_model.dart';
import 'package:dio/dio.dart';
import 'package:mockito/annotations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'data_fetching_test.mocks.dart';

@GenerateMocks([FetchAuthors])
void main() {
  test("Should return an array of authors.", () async {
    final fetchAuthors = MockFetchAuthors();
    RequestOptions resOpt = RequestOptions(path: '');
    final res = Response(data: rawAuthorList, requestOptions: resOpt);
    when(fetchAuthors.getAuthors()).thenAnswer((_) async => res);
    expect(fetchAuthors.getAuthors(), isNotNull);
  });

  test("Should return an array of UserModel.", () async {
    final fetchAuthors = MockFetchAuthors();
    RequestOptions resOpt = RequestOptions(path: '');
    final res = Response(data: rawAuthorList, requestOptions: resOpt);
    List<AuthorModel> list = fetchAuthors.serializeApiData(res);

    expect(list, serializedAuthorsList);
  });
}
