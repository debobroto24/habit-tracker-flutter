import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class HabitTitle extends StatelessWidget {
  final String habitName;
  final VoidCallback onTap;
  final VoidCallback onSettingTap;
  final int timeSpent;
  final int timeGoal;
  final bool isStarted;
  const HabitTitle(
      {super.key,
      required this.habitName,
      required this.onTap,
      required this.onSettingTap,
      required this.timeSpent,
      required this.timeGoal,
      required this.isStarted});

  @override
  Widget build(BuildContext context) {
    double fullHeight = MediaQuery.of(context).size.height;
    double fullWidth = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.only(
          top: 20, left: fullWidth * .06, right: fullWidth * .06),
      alignment: Alignment.center,
      width: fullWidth * .88,
      height: fullHeight * .10,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                GestureDetector( 
                  onTap: onTap,
                  child: Container(
                    width: fullWidth * .2,
                    height: fullHeight * .10,
                    child: Stack(
                      children: [
                        Positioned(
                          left: 0,
                          right: 0,
                          top: 0,
                          bottom: 0,
                          child: CircularPercentIndicator(
                            radius: fullHeight * .04,
                          ),
                        ),
                        Center(child: Icon(isStarted? Icons.pause:Icons.play_arrow), ),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: fullWidth * .01),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                     habitName,
                      style:const TextStyle(
                        fontSize: 20,
                        color:Colors.grey, 
                      ),
                    ),
                    Text(
                    " ${timeSpent.toString()}/${timeGoal.toString()}",
                      style:const TextStyle(
                        fontSize: 20,
                        color:Colors.grey, 
                      ),
                    ),
                    
                  ],
                ),
              ],
            ),
            GestureDetector(onTap: onSettingTap,child: const Icon(Icons.settings)),
          ],
        ),
      ),
    );
  }
}
