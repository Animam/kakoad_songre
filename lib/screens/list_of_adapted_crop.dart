import 'dart:convert';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:kakoad_songre/colors.dart';
import 'package:kakoad_songre/screens/firebase_api.dart';
import 'package:kakoad_songre/screens/firebase_img_file.dart';
import 'package:path/path.dart';

class ListAdaptedCrops extends StatefulWidget {
  late Map data;

  ListAdaptedCrops({Key? key, required this.data});

  @override
  State<ListAdaptedCrops> createState() => _ListAdaptedCropsState();
}

class _ListAdaptedCropsState extends State<ListAdaptedCrops> {
  late List<FirebaseImageFile> futureImage = widget.data["images"];
  List name_imagePath = [];
  @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   //futureImage = widget.data["images"];
  // }

  @override
  Widget build(BuildContext context) {
    List _adatedCrops = widget.data["culture_apte"].toString().split(",");

    // futureImage.then((value)
    // {
    //   print(futureImage);
    //   //setState(() {
    //     for(var i = 0; i < value.length; i++)
    //     {
    //       var x = value[i].url.toString().split("/").last;
    //       print("-------------------"+x);
    //       _.add(value[i].url);
    //     }
    //   //});
    // });

    // futureImage.then((value)
    // {
    //   for(var i = 0; i < value.length; i++)
    //   {
    //     var x = value[i].url.toString().split("/").last;
    //     // x = culture_image%2Fsesame.jpg?alt=media&token=5865c5df-05ea-4d6d-bcba-2ba055b664e2
    //     x = x.toString().split("%2F").last;
    //     // x = sesame.jpg?alt=media&token=5865c5df-05ea-4d6d-bcba-2ba055b664e2
    //     x = x.toString().split("?").first;
    //     // x = sesame.jpg
    //     x = x.toString().split(".").first;
    //     print(x);
    //     _.add({x: value[i].url});
    //   }
    // });

    int defaultImageIndex = 0;
    for (var i = 0; i < futureImage.length; i++) {
      var x = futureImage[i].url.toString().split("/").last;
      // x = culture_image%2Fsesame.jpg?alt=media&token=5865c5df-05ea-4d6d-bcba-2ba055b664e2
      x = x.toString().split("%2F").last;
      // x = sesame.jpg?alt=media&token=5865c5df-05ea-4d6d-bcba-2ba055b664e2
      x = x.toString().split("?").first;
      // x = sesame.jpg
      x = x.toString().split(".").first;
      if(x=="default")
      {
        defaultImageIndex = i;
      }
      name_imagePath.add({x: futureImage[i].url});
    }

    return Scaffold(
        appBar: AppBar(
          backgroundColor: GREEN,
          title: Text('Liste des cultures adaptées'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              // FutureBuilder<ListResult>(
              // future: futureImage,
              // builder: (context, snapshotImage){
              //   if(snapshotImage.hasData){
              //     final image = snapshotImage.data!.items;
              //     var fileImg;
              //     return ListView.builder(
              //       itemCount: image.length,
              //         itemBuilder: (context, i){
              //         var  file_image = image[i];
              //         return Card(
              //           child: ListTile(
              //             title: Text(file_image.name),
              //             // trailing: IconButton(onPressed: (){}, icon: Icon(Icons.)),
              //           ),
              //         );
              //         });
              //   }
              //
              // }),
              // ListView.builder(
              //   itemCount: images.length,
              //     itemBuilder: (context,i){
              //     if(snapshot.hasData){
              //       final image = images[i];
              //       return builFile(context,image);
              //     }
              //     else{
              //       return Center(child: CircularProgressIndicator(),);
              //     }
              //
              //     }),
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: _adatedCrops.length,
                itemBuilder: (context, index) {
                  var culture = _adatedCrops[index].toString().split("|");
                  String culture_name = culture.last.split(" ").last.toString().toLowerCase();
                  int lookedindex = -1;
                  var _url = "";
                  for(var item in name_imagePath)
                  {
                    var i = name_imagePath.indexOf(item);
                    print("${Uri.decodeFull(item.keys.toList()[0].toString().toLowerCase())} --- ${culture_name}");
                    if(Uri.decodeFull(item.keys.toList()[0].toString().toLowerCase()).contains(culture_name))
                    {
                      lookedindex = i;
                    }
                  }
                  if(lookedindex==-1)
                  {
                    _url = name_imagePath[defaultImageIndex]["default"];
                  }
                  else
                  {
                    _url = name_imagePath[lookedindex].values.toList()[0];
                  }


                  return GestureDetector(
                    onTap: () {
                      print("Parfait Anicet");
                    },
                    child: Card(
                      elevation: 5,
                      margin: EdgeInsets.all(10),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            SizedBox(child: Image.network(_url,width: 100,height: 80,)),
                            Column(
                              children: [
                                Text(
                                  culture.elementAt(0),
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                                Text(
                                  "apte a (aux)" + culture.elementAt(1),
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              )
            ],
          ),
        ));
  }

  Widget builFile(BuildContext context, FirebaseImageFile file) => ListTile(
        title: Text(
          file.name,
          style: TextStyle(fontSize: 20),
        ),
      );
}

/*
class ListImage extends StatefulWidget {
  const ListImage({Key? key}) : super(key: key);

  @override
  State<ListImage> createState() => _ListImageState();
}

class _ListImageState extends State<ListImage> {
  late Future<ListResult> futureImage;
  @override
  Widget build(BuildContext context) {
    futureImage = FirebaseStorage.instance.ref("/culture_images").listAll();
    return FutureBuilder<ListResult>(future: futureImage, builder: builder);
  }
}
*/
