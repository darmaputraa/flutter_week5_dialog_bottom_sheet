import 'package:flutter/material.dart';
// import 'package:flutter_week5_dialog_bottom_sheet/bottom_sheet.dart';
// import 'package:flutter_week5_dialog_bottom_sheet/bottom_sheet.dart';

class FlutterGallery extends StatefulWidget {
  const FlutterGallery({Key? key}) : super(key: key);

  @override
  State<FlutterGallery> createState() => _FlutterGalleryState();
}

class _FlutterGalleryState extends State<FlutterGallery> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(206, 0, 0, 0),
        appBar: AppBar(
            title: const Text('Flutter Gallery'),
            titleTextStyle: const TextStyle(
                fontSize: 32, fontWeight: FontWeight.w800, color: Colors.black),
            centerTitle: true,
            backgroundColor: Colors.amber[300],
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(32),
                  bottomRight: Radius.circular(32)),
            )),
        body: GridView.builder(
            padding: const EdgeInsets.all(18.0),
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 12.0,
              crossAxisSpacing: 12.0,
              mainAxisExtent: 200.0,
            ),
            itemCount: 12,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  // confirmationBottomSheet(context, index);
                  confirmationShowDialog(context, index);
                },
                child: Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(20.0)),
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: Image.network(
                          "https://picsum.photos/id/$index/200/300",
                          loadingBuilder: (context, widget, event) {
                            if (event == null) {
                              return widget;
                            } else {
                              return const SizedBox(
                                height: 1.0,
                                width: 1.0,
                                child: CircularProgressIndicator(),
                              );
                            }
                          },
                          errorBuilder: (context, object, error) {
                            return const Icon(Icons.error);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }));
  }

  /// Show Dialog
  Future<dynamic> confirmationShowDialog(BuildContext context, int index) {
    return showDialog(
        context: context,
        builder: (context) {
          return Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: 300,
                height: 400,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: Colors.white.withOpacity(0.8)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: Image.network(
                            "https://picsum.photos/id/$index/200/300")),
                    TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text(
                          '<<Go Back',
                          style: TextStyle(fontSize: 26, color: Colors.black),
                        ))
                  ],
                ),
              ),
            ],
          );
        });
  }

  /// Bottom Sheets
  // Future<dynamic> confirmationBottomSheet(BuildContext context, int index) {
  //   return showModalBottomSheet(
  //       context: context,
  //       backgroundColor: Colors.transparent,
  //       builder: (context) {
  //         return Container(
  //             decoration: const BoxDecoration(
  //                 color: Colors.amber,
  //                 borderRadius: BorderRadius.only(
  //                     topLeft: Radius.circular(20),
  //                     topRight: Radius.circular(20))),
  //             child: Column(
  //               mainAxisAlignment: MainAxisAlignment.center,
  //               children: [
  //                 ClipRRect(
  //                   borderRadius: BorderRadius.circular(20.0),
  //                   child: Image.network(
  //                       "https://picsum.photos/id/$index/200/300"),
  //                 ),
  //               ],
  //             ));
  //       });
  // }
}
