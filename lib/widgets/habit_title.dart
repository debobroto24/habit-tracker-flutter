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
  
  String converToMinSec(int seconds){
    String sec = (seconds % 60).toString(); 
    String mins = (seconds / 60).toStringAsFixed(1); 
    if(sec.length == 1){
      sec = '0' + sec; 
    }
    if(mins[1] == '.'){
      mins.substring(0,1); 
    }
    return mins[0] + ':'+ sec; 
  }

  // calculate the progress persentage  
  double percenCompleted(){
    return timeSpent/ (timeGoal ); 
  }

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
                            percent: percenCompleted() <1 ? percenCompleted(): 1,
                            progressColor: percenCompleted()>0.5?(percenCompleted()>0.75 ? Colors.greenAccent : Colors.orangeAccent) : Colors.redAccent, 
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
                    " ${converToMinSec(timeSpent)}/${timeGoal.toString()} = ${(percenCompleted()*100).toStringAsFixed(0)}%",
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
