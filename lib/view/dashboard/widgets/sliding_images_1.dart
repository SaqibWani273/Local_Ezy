import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:mca_project/constants/sliding_images.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SlidingImagesWidget extends StatefulWidget {
  const SlidingImagesWidget({
    super.key,
  });

  @override
  State<SlidingImagesWidget> createState() => _SlidingImagesWidgetState();
}

class _SlidingImagesWidgetState extends State<SlidingImagesWidget> {
  var currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Stack(alignment: Alignment.center, children: [
        CarouselSlider(
          options: CarouselOptions(
            aspectRatio: 16 / 12,
            // height: MediaQuery.of(context).size.height * 0.3,
            viewportFraction: 1.0,
            onPageChanged: (index, reason) => setState(() {
              currentIndex = index;
            }),
          ),
          items: slidingImages
              .map(
                (imageUrl) => SizedBox(
                  width: double.infinity,
                  child:
                      // SvgPicture.asset(
                      //   imageUrl,
                      //   // semanticsLabel: 'Acme Logo'
                      // ),
                      Image.asset(
                    imageUrl,
                    width: double.infinity,
                    fit: BoxFit.fill,
                    frameBuilder:
                        (context, child, frame, wasSynchronouslyLoaded) {
                      if (frame == null) {
                        return Container(
                          color: Colors.grey.withOpacity(0.5),
                        );
                      }
                      return child;
                    },
                  ),
                ),
              )
              .toList(),
        ),
        Positioned(
          bottom: 5,
          child: SizedBox(
            //  height: 45,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: slidingImages.asMap().entries.map((entry) {
                return Container(
                  width: 15.0,
                  height: 15.0,
                  margin: EdgeInsets.symmetric(horizontal: 4.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),

                    // borderRadius: BorderRadius.circular(
                    //     currentIndex == entry.key ? 8 : 15),
                    color: currentIndex == entry.key
                        ? Colors.blue
                        : Colors.grey.shade300,
                  ),
                );
              }).toList(),
            ),
          ),
        ),
        Positioned(
          bottom: 45,
          child: SizedBox(
              //  height: 45,
              child: Center(
            child: ElevatedButton(
              style: ButtonStyle(
                elevation: MaterialStateProperty.all(20.0),
                backgroundColor: MaterialStateProperty.all(Colors.blue),
              ),
              onPressed: () {},
              child: Text("Shop Now", style: TextStyle(color: Colors.white)),
            ),
          )),
        ),
        // Positioned(
        //   left: 10,
        //   bottom: 30,
        //   child: Column(
        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //     crossAxisAlignment: CrossAxisAlignment.start,
        //     children: [
        //       Container(
        //         alignment: Alignment.center,
        //         width: 80,
        //         padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
        //         decoration: BoxDecoration(
        //             borderRadius: BorderRadius.circular(8),
        //             color: Colors.grey.shade800.withOpacity(0.8)),
        //         child: Text(
        //           "30% OFF",
        //           style: TextStyle(color: Colors.white),
        //         ),
        //       ),
        //       Text("\nToday's Special\n ",
        //           style: TextStyle(
        //               color: Colors.white, fontWeight: FontWeight.w700)),
        //       Text(
        //         "${widget.todaySpecial!.text} \nonly valid for today!",
        //         style:
        //             TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
        //       ),
        //     ],
        //   ),
        // )
      ]),
    );
  }
}
