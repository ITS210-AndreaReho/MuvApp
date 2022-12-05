import 'package:flutter/material.dart';
import 'package:muvapp3/src/presentation/detailpage.dart';

class CardMedia extends StatelessWidget {
  final String title;
  final int id;
  final String image;
  final onTap;
  final String description;
  final String rating;

  const CardMedia({Key? key, required this.title, required this.description,required this.id, required this.image, required this.rating , required this.onTap,}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return InkWell(

      onTap: onTap,
      child: SizedBox(

        width: 200,
        height: 200,
        child: Card(

          color: Color(0xFFBFBFBF),

          child: Row(

            children: [
              Image.network(image , height: 200),
              Expanded(child: Column(children: [
                                                Padding(
                                                       padding: const EdgeInsets.all(10),
                                                       child: Column(
                                                        children: [
                                                           Text(title, style:      TextStyle(fontSize: 30,    ) ,overflow: TextOverflow.ellipsis, maxLines: 2),
                                                            Text(description.toString(), style: TextStyle(fontSize: 15),overflow: TextOverflow.ellipsis, maxLines: 2 ),
                                                            Text( "Rating: ${rating.toString()}", style: TextStyle(fontSize: 15),)
                                                ],
                                      )
                             ),
              ],))
            ],
          ),
        ),
      ),
    );
  }
}

