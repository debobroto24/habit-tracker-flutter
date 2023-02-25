import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:habit_tracker_flutter/widgets/habit_title.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List habitList = [
    ['Exercise', false, 0, 10],
    ['Read', false, 0, 20],
    ['Meditate', false, 0, 340],
    ['Code', false, 0, 40]
  ];

  onStart(index) {
    var startTime = DateTime.now();
    setState(() {
      habitList[index][1] = !habitList[index][1];
    });
    int passed = habitList[index][2];

    if (habitList[index][1]) {
      Timer.periodic(Duration(seconds: 1), (timer) {
        setState(() {
          if (!habitList[index][1]) {
            timer.cancel();
          }

          // print("passed ${passed}"); 
          // print("passed ${ habitList[index][3]}"); 
          
          var currentTime = DateTime.now();
          habitList[index][2] = passed +
              currentTime.second -
              startTime.second +
              60 * (currentTime.minute - startTime.minute) +
              60 * 60 * (currentTime.hour - startTime.hour);
              if( habitList[index][2] >= habitList[index][3]){
                
            timer.cancel(); 
              habitList[index][1]  = false; 
          }
        });
      });
    }
  }

  settingTapped(index) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Setting for ${habitList[index][0]}"),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueGrey[200],
        appBar: AppBar(
          backgroundColor: Colors.black87,
          title: const Text("Habit Tracker"),
        ),
        body: ListView.builder(
          itemCount: habitList.length,
          itemBuilder: (context, index) {
            return HabitTitle(
              habitName: habitList[index][0],
              onTap: () {
                onStart(index);
              },
              onSettingTap: () {
                settingTapped(index);
              },
              timeGoal: habitList[index][3],
              timeSpent: habitList[index][2],
              isStarted: habitList[index][1],
            );
          },
        ));
  }
}
