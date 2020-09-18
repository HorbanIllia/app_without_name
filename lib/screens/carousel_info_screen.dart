import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:app_without_name/constants.dart';
import 'package:app_without_name/widgets/gradient_button.dart';

final List<String> listImage = ["slide1.png", "slide2.png", "slide3.png"];
final List<String> listText = [TextCarouselOne, TextCarouselTwo, TextCarouselTwo/*TextCarouselThree*/];

final Widget placeholder = Container(color: Colors.grey);

final List child = map<Widget>(
  listImage,
      (index, i) {
    return Container(
      margin: EdgeInsets.all(5.0),
      child: Image.asset(i,),
    );
  },
).toList();

List<T> map<T>(List list, Function handler) {
  List<T> result = [];
  for (var i = 0; i < list.length; i++) {
    result.add(handler(i, list[i]));
  }

  return result;
}

class CarouselInfoScreen extends StatefulWidget {
  @override
  _CarouselInfoScreenState createState() => _CarouselInfoScreenState();
}

class _CarouselInfoScreenState extends State<CarouselInfoScreen> {
  int _current = 0;
  CarouselController buttonCarouselController = CarouselController();

  @override
  Widget build(BuildContext context) {

    final carouselSlide = CarouselSlider(
      options: CarouselOptions(
        height: 300,
        viewportFraction: 1.0,
        aspectRatio: 2.0,
        autoPlay: false,
        enableInfiniteScroll: false,
        enlargeCenterPage: true,
        onPageChanged: (index, reason){
          setState(() {
            _current = index;
          });
        },
      ),
      carouselController: buttonCarouselController,
      items: child,
    );

    return new Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          carouselSlide,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: map<Widget>(
              listImage,
                  (index, url) {
                return Container(
                  width: 8.0,
                  height: 8.0,
                  margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _current == index
                          ? Colors.yellowAccent
                          : Colors.redAccent),
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
            child: Text(listText[_current]),
          ),
          RaisedGradientButton(
            width: 100,
            height: 50,
            gradient: LinearGradient(
                colors: <Color>[Colors.yellowAccent, Colors.redAccent]
            ),
            child: _current != 2
                ? Text('Next', style: TextStyle(fontSize: 20, color: Colors.white),)
                : Text('Ready', style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            onPressed: () => _current != 2
                ? buttonCarouselController.nextPage(duration: Duration(milliseconds: 300), curve: Curves.linear)
                : Navigator.pushReplacementNamed(context, LoginViewRoute),
          ),
          Visibility(
            visible: _current != 2 ? true : false,
            child: FlatButton(
              onPressed: () => Navigator.pushReplacementNamed(context, LoginViewRoute),
              child: Text('Skip'),
            ),
          ),
        ],
      ),
    );
  }
}

