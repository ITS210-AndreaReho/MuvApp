import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:muvapp3/src/widgets/card_media.dart';
import 'package:http/http.dart' as http;
import  'package:flutter/src/widgets/image.dart' as Image;

import '../data/movie_model.dart';
import 'DetailPage.dart';


class HomePage extends StatefulWidget{
  const HomePage({Key? key, required this.title}): super(key:key);

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  late Future<List<MovieModel>> futureCardMedia;

  @override
  void initState() {

    super.initState();

    getData();

  }
  getData() async {
    futureCardMedia = fetchCardMedia();
  }

  Future<List<MovieModel>> fetchCardMedia() async {
    final response = await http.get(Uri.parse('https://api.tvmaze.com/shows'));
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((e) =>  MovieModel.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load album');
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title:  Text("MuvApp", style: TextStyle(fontSize: 30),),
        backgroundColor: Colors.black,
      ),
      body: Container(

        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 2.0),
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(color: Color(0xFF171717)),
            left: BorderSide(color: Color(0xFF1E1E1E)),
            right: BorderSide(color: Color(0xFF151515)),
            bottom: BorderSide(color: Color(0xFF1E1E1E)),
          ),
          color: Color(0xFF2A2A2A),
        ),


        width: double.infinity,
        child: Center(
            child: FutureBuilder<List<MovieModel>>(

              future: futureCardMedia,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<MovieModel>? data = snapshot.data;
                  return ListView.builder(
                    itemCount: data!.length,
                    itemBuilder: (context, index) {
                      return CardMedia(

                          title:(data[index].name),
                          description: (data[index].summary),
                          id: (data[index].id),
                          image:(data[index].image.medium),
                          rating: (data[index].rating),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DetailPage(id: data[index].id)),
                            );

                          });

                    },
                  );
                } else if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                }
                return CircularProgressIndicator();
              },


            )




        ),




      ),

    );

  }


}



