import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';

class SliderUtama extends StatefulWidget {
  @override
  _SliderUtamaState createState() => _SliderUtamaState();
}

class _SliderUtamaState extends State<SliderUtama> {
  TextEditingController editingController = TextEditingController();
  int currentIndex;

  void initState() {
    super.initState();
    currentIndex = 0;
  }

  void changePage(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: Column(
        children: <Widget>[
          SizedBox(
            height: 30,
          ),
          Card(
            margin: EdgeInsets.only(left: 15, right: 15),
            child: Image.network(
                "https://image.freepik.com/free-psd/banner-template-pet-shop_23-2148436885.jpg"),
            elevation: 10,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40.0)),
          ),
          SizedBox(
            height: 25,
          ),
          Text(
            "Temukan sahabat anda",
            style:
                GoogleFonts.roboto(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            margin: EdgeInsets.only(left: 20, right: 20, top: 10),
            child: TextField(
              controller: editingController,
              decoration: InputDecoration(
                isDense: true,
                filled: true,
                fillColor: Colors.blue[50],
                hintText: "Temukan ... ",
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.amber,
                ),
                enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.white10.withOpacity(0)),
                    borderRadius: BorderRadius.all(Radius.circular(10.0))),
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(left: 20),
                child: Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Text(
                    "Rekomendasi",
                    style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.3,
              ),
              Align(
                alignment: AlignmentDirectional.centerEnd,
                child: Container(
                  //margin: EdgeInsets.only(right: 20),
                  child: Align(
                    alignment: AlignmentDirectional.centerEnd,
                    child: Text(
                      "See all",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue[100]),
                    ),
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 30,
          ),
          CarouselSlider(
            options: CarouselOptions(
              autoPlay: true,
              aspectRatio: 2.0,
              enlargeCenterPage: true,
            ),
            items: imageSliders,
          ),
        ],
      )),
      bottomNavigationBar: BubbleBottomBar(
        hasNotch: true,
        fabLocation: BubbleBottomBarFabLocation.end,
        opacity: 0.2,
        currentIndex: currentIndex,
        onTap: changePage,
        borderRadius: BorderRadius.vertical(
            top: Radius.circular(
                16)), //border radius doesn't work when the notch is enabled.
        elevation: 8,
        items: <BubbleBottomBarItem>[
          BubbleBottomBarItem(
              backgroundColor: Colors.red,
              icon: Icon(
                Icons.dashboard,
                color: Colors.black,
              ),
              activeIcon: Icon(
                Icons.dashboard,
                color: Colors.red,
              ),
              title: Text("Home")),
          BubbleBottomBarItem(
              backgroundColor: Colors.deepPurple,
              icon: Icon(
                Icons.access_time,
                color: Colors.black,
              ),
              activeIcon: Icon(
                Icons.access_time,
                color: Colors.deepPurple,
              ),
              title: Text("Logs")),
          BubbleBottomBarItem(
              backgroundColor: Colors.indigo,
              icon: Icon(
                Icons.folder_open,
                color: Colors.black,
              ),
              activeIcon: Icon(
                Icons.folder_open,
                color: Colors.indigo,
              ),
              title: Text("Folders")),
          BubbleBottomBarItem(
              backgroundColor: Colors.green,
              icon: Icon(
                Icons.menu,
                color: Colors.black,
              ),
              activeIcon: Icon(
                Icons.menu,
                color: Colors.green,
              ),
              title: Text("Menu"))
        ],
      ),
    );
  }
}

final List<Widget> imageSliders = bannerAtas
    .map((item) => Container(
          child: Container(
            margin: EdgeInsets.all(5.0),
            child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                child: Stack(
                  children: <Widget>[
                    Image.network(item, fit: BoxFit.cover, width: 350.0),
                    // Positioned(
                    //   bottom: 0.0,
                    //   left: 0.0,
                    //   right: 0.0,
                    //   child: Container(
                    //     decoration: BoxDecoration(
                    //       color: Colors.white24,
                    //     ),
                    //     padding: EdgeInsets.symmetric(
                    //         vertical: 10.0, horizontal: 20.0),
                    //   ),
                    // ),
                  ],
                )),
          ),
        ))
    .toList();

final List<String> bannerAtas = [
  'https://image.freepik.com/free-photo/beautiful-cat-with-blue-eyes_58409-14525.jpg',
  'https://image.freepik.com/free-photo/dog-standing-hind-legs-with-copy-space_23-2148366813.jpg',
  'https://image.freepik.com/free-photo/cute-red-cat-white-surface_96064-799.jpg',
  'https://image.freepik.com/free-photo/gold-bengal-cat-white-space_155003-12732.jpg',
];
