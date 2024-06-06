import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:mca_project/view/dashboard/widgets/sliding_images_1.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MCA Project',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('ShopLocal'),
            Row(
              children: [
                IconButton(
                    onPressed: () {}, icon: Icon(Icons.notifications_outlined)),
                IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.favorite_outline_outlined)),
                IconButton(
                    onPressed: () {}, icon: Icon(Icons.shopping_cart_outlined)),
              ],
            )
          ],
        ),
      ),
      drawer: Drawer(),
      body: ListView(children: [
        Container(
          padding: EdgeInsets.all(16.0),
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Search for everything,styles and brands',
              prefixIcon: Icon(Icons.search),
              filled: true,
              fillColor: Colors.grey.shade300,
              suffixIcon: SizedBox(
                width: 80,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [Icon(Icons.mic), Icon(Icons.camera_alt)],
                ),
              ),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide.none),
            ),
          ),
        ),
        Container(
          alignment: Alignment.center,
          height: 70.0,
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          color: Colors.grey.shade300,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.location_on_outlined),
                  Text('Sringar,190001'),
                ],
              ),
              TextButton(
                  style: ButtonStyle(
                    elevation: MaterialStateProperty.all(20.0),
                    backgroundColor: MaterialStateProperty.all(
                        Colors.white.withOpacity(0.5)),
                  ),
                  onPressed: () {},
                  child: Text(
                    'Change Address',
                    style: TextStyle(color: Colors.black),
                  )),
              //images
            ],
          ),
        ),
        SizedBox(
          height: 10.0,
        ),
        SlidingImagesWidget()
      ]),
    );
  }
}
