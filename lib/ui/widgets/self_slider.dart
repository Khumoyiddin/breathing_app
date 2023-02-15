import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class SelfSlider extends StatefulWidget {
  final Map<String, bool> listOfData;

  const SelfSlider({Key? key, required this.listOfData}) : super(key: key);

  @override
  State<SelfSlider> createState() => _SelfSliderState();
}

class _SelfSliderState extends State<SelfSlider> {
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: List.generate(
        4,
        (index) => Text(
          widget.listOfData.keys.toList()[index],
          style: TextStyle(
            color: widget.listOfData.values.toList()[index]
                ? Colors.white
                : Colors.grey,
          ),
        ),
      ),
      options: CarouselOptions(
        height: 40,
        aspectRatio: 16 / 10,
        viewportFraction: 0.25,
        initialPage: 0,
        enableInfiniteScroll: false,
        reverse: false,
        autoPlay: false,
        enlargeCenterPage: false,

        onPageChanged: (index, reason) {
          setState(() {
            widget.listOfData.forEach(
              (key, value) {
                if (value) {
                  widget.listOfData.update(key, (value) => false);
                }
              },
            );
            widget.listOfData.update(
                widget.listOfData.keys.toList()[index], (value) => true);
          });
        },
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
