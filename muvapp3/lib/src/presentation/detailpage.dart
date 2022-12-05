import 'dart:convert';
import  'package:flutter/src/widgets/image.dart' as Image;
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../data/movie_model.dart';


class DetailPage extends StatefulWidget {

  late final int id;
  DetailPage({Key? key,required this.id }) : super(key: key);
  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {

  late Future<MovieModel> futureCardMedia;

  getData() async {
    futureCardMedia = fetchCardMedia();
  }

  Future<MovieModel> fetchCardMedia() async {
    final response = await http.get(Uri.parse('https://api.tvmaze.com/shows/${widget.id}'));
    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      return MovieModel.fromJson(jsonResponse);
    } else {
      throw Exception('Failed to load album');
    }
  }

  @override
  Widget build(BuildContext context) {
    getData();

  return FutureBuilder<MovieModel>(
      future: futureCardMedia,
      builder: (context,snapshot){
        if(snapshot.hasData){
                 return Scaffold(
                    appBar: AppBar(
                      title:  Text(snapshot.data!.name),
                      backgroundColor: Colors.black,
                   ),

                     body:  Container(
                       color: Colors.black,

                       child: Center(child:

                          Column(


                            children: [
                              Image.Image.network(snapshot.data!.image.original.toString(), height: 300),
                              Padding(
                                padding: const EdgeInsets.all(20),
                                child: Text(snapshot.data!.summary,overflow: TextOverflow.ellipsis, maxLines: 10, style: const TextStyle(fontSize: 20,color: Colors.white), ),
                              ),
                              Spacer(),
                                  Padding(
                                    padding: const EdgeInsets.all(20),
                                    child: Column(
                                      children: [
                                        Text("Info:", style: const TextStyle(fontSize: 20,color: Colors.white),),
                                        Text("    Status: ${snapshot.data!.status}", style: const TextStyle(color: Colors.white, fontSize: 20 ), ),
                                        Text("Rating: ${snapshot.data!.rating.toString()}", style: const TextStyle(fontSize: 20, color: Colors.white), ),
                                      ],
                                    ),
                                  ),
                            ],
                         )
                       ),
                     )
                 );
        }else{
          return const Center(child: CircularProgressIndicator());
        };
      }
    );
  }
  }
