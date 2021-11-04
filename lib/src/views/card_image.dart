import 'package:flutter/material.dart';
import 'package:unsplash_client/unsplash_client.dart';

class CardImageView extends StatelessWidget
{
  const CardImageView(
    {Key? key,
    required this.image
  }) : super(key: key);

  final Photo image;

  @override
  Widget build(BuildContext context)
  {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black87,
            offset: Offset(0.0, 5.0),
            blurRadius: 2.5
          )
        ]
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [    
            Container(
              child: FadeInImage(
                placeholder: AssetImage('assets/activity_indicator.gif'),
                image: NetworkImage('${image.urls.small}'),
                fadeInDuration: Duration(milliseconds: 200),
              )
            ),
            Opacity(
              opacity: .9,
              child: Container(
                padding: EdgeInsets.only(left: 10.0),
                height: 60.0,
                color: Colors.black,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Likes: " + image.likes.toString(), style: TextStyle(color: Colors.white, fontSize: 18.0),),
                    Text("\Descargas: " + image.downloads.toString(), style: TextStyle(color: Colors.white, fontSize: 18.0),),
                    MaterialButton(
                      onPressed: ()
                      {
                        Navigator.pushNamed(
                          context,
                          '/image',
                          arguments:
                          {
                            'updatedAt': image.updatedAt,
                            'width': image.width,
                            'height': image.height,
                            'id': image.id,
                            'likes': image.likes,
                            'downloads': image.downloads,
                            'location': image.location?.name,
                            'souce': image.source,
                            'url': image.urls.small,
                          }
                        );
                      },
                      child: Icon(Icons.chevron_right, color: Colors.white,),
                    )
                  ],
                ),
              )
            )
          ]
        ),
      )
    );
  }
}