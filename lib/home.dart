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
      ['Exercise',true, 0, 10],
      ['Read',false, 0, 10],
      ['Meditate',false, 0, 10],
      ['Code',false, 0, 10]
    ];
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
        itemBuilder: (context,index){
          return HabitTitle(
            habitName: habitList[index][0],
            onTap: (){},
            onSettingTap: (){},
            timeGoal: habitList[index][3],
            timeSpent: habitList[index][2],
            isStarted: habitList[index][1],
          ); 
        },
      )
    );
  }
}
