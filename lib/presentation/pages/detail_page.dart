import 'package:code_magic_test/models/author_model.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  final AuthorModel author;
  final String image;

  const DetailPage({Key? key, required this.image, required this.author})
      : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(color: Colors.white),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: 200.0,
                width: 200,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(widget.image),
                  ),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(20.0),
                  ),
                ),
              ),
              SizedBox(
                height: 50.0,
                width: 300,
                child: Center(
                  child: Text(
                    widget.author.name!,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 20.0,
                      decoration: TextDecoration.none,
                    ),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10.0),
                height: 300,
                width: 400,
                color: const Color(0xFF3D149C),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      widget.author.description!,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 30.0,
                        decoration: TextDecoration.none,
                      ),
                    ),
                    Text(
                      widget.author.bio!,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 13.0,
                        decoration: TextDecoration.none,
                      ),
                    ),
                  ],
                ),
              ),
              TextButton(
                style: ButtonStyle(
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.blue),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  'Go Back',
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                ),
              )
            ],
          )),
    );
  }
}
