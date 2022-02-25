import 'package:code_magic_test/logic/fetch_author_data.dart';

import 'package:flutter/material.dart';

import 'detail_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final authors = FetchAuthors().getAuthors();
  final fetchAuthors = FetchAuthors();
// serializeApiData
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      color: Colors.white,
      child: FutureBuilder<dynamic>(
        future: authors,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: Text("Loading..."),
            );
          } else {
            final data = snapshot.data.data["results"];
            final serializeAuthors = fetchAuthors.serializeApiData(data);
            return Center(
              child: GridView.builder(
                shrinkWrap: true,
                itemCount: data.length,
                itemBuilder: (context, index) {
                  final image = FetchAuthors.images[index];
                  final author = serializeAuthors[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              DetailPage(image: image, author: author),
                        ),
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.all(10.0),
                      height: 150.0,
                      width: 150.0,
                      decoration: const BoxDecoration(
                        color: Color(0xFF3D149C),
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CircleAvatar(
                            backgroundImage: NetworkImage(image),
                            maxRadius: 40.0,
                          ),
                          Text(
                            author.name!,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12.0,
                              decoration: TextDecoration.none,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
              ),
            );
          }
        },
      ),
    );
  }
}
