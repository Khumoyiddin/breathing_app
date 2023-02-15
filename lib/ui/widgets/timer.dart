import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class TimerWidget extends StatefulWidget {
  const TimerWidget({Key? key}) : super(key: key);

  @override
  State<TimerWidget> createState() => _TimerWidgetState();
}

class _TimerWidgetState extends State<TimerWidget> {
  int time = 0;
  int activeIndex = 0;
  List<Widget> timerDashes = [];

  @override
  void initState() {
    super.initState();
    setTimerDashes();
  }

  void setTimerDashes() {
    timerDashes = List.generate(
      600,
      (index) {
        bool is10th = index % 10 == 0;
        return Padding(
          padding: EdgeInsets.only(top: activeIndex != index ? 8.0 : 0),
          child: Text(
            "|",
            style: TextStyle(
              color: activeIndex == index
                  ? Colors.white
                  : is10th
                      ? Colors.white
                      : Colors.grey.shade400,
              fontSize: activeIndex == index ? 16 : 8,
              fontWeight: is10th ? FontWeight.w600 : FontWeight.normal,
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
             Text(
              "∞",
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey.shade600,
              ),
            ),
            const Spacer(),
            Text(
              "$time min",
              style: const TextStyle(
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(),
          ],
        ),
        CarouselSlider(
          items: timerDashes,
          options: CarouselOptions(
            height: 40,
            viewportFraction: 0.02,
            initialPage: 0,
            enableInfiniteScroll: false,
            reverse: false,
            autoPlay: false,
            enlargeCenterPage: false,
            animateToClosest: false,
            pageSnapping: false,
            scrollDirection: Axis.horizontal,
            onPageChanged: (index, reason) {
              setState(() {
                time = (index + 1) ~/ 2;
                activeIndex = index;
                setTimerDashes();
              });
            },
          ),
        ),
      ],
    );
  }
}
