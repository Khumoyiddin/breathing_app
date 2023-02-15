import 'package:flutter/material.dart';
import 'package:health/ui/widgets/timer.dart';
import 'package:health/ui/widgets/self_slider.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  Map<String, bool> stateList = {
    "Resonance": true,
    "Balance": false,
    "Strength": false,
    "Focus": false,
  };
  Map<String, bool> frequencyList = {
    "3 bpm": true,
    "2.1 bpm": false,
    "7.5 bpm": false,
    "7 bpm": false,
    "6 bpm": false,
    "5 bpm": false,
    "5.5 bpm": false,
    "4 bpm": false,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TimerWidget(),
              SelfSlider(listOfData: stateList),
              SelfSlider(listOfData: frequencyList),
            ],
          ),
        ),
      ),
    );
  }
}
