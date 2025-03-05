import 'dart:async';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int totalSeconds = 1500;
  bool isrunning = false;
  int totalpomodoros = 0;
  late Timer timer;

  void onTick(Timer timer) {
    if (totalSeconds == 0) {
      setState(() {
        totalpomodoros = totalpomodoros + 1;
        isrunning = false;
        totalSeconds = 1500;
      });
      timer.cancel();
    } else {
      setState(() {
        totalSeconds = totalSeconds - 1;
      });
    }
  }

  void onStartPressed() {
    timer = Timer.periodic(Duration(seconds: 1), onTick);
    setState(() {
      isrunning = true;
    });
  }

  void onPausePressed() {
    timer.cancel();
    setState(() {
      isrunning = false;
    });
  }

  void resetPressed() {
    setState(() {
      totalSeconds = 1500;
      totalpomodoros = 0;
      isrunning = false;
    });
    timer.cancel();
  }

  String format(int seconds) {
    var duration = Duration(seconds: seconds);

    return duration.toString().substring(2, 7);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,

      body: Column(
        children: [
          Flexible(
            flex: 2,
            child: Container(
              alignment: Alignment.bottomCenter,
              child: Text(
                format(totalSeconds),
                style: TextStyle(
                  color: Theme.of(context).cardColor,
                  fontSize: 70,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),

          Flexible(
            flex: 3,
            child: Center(
              child: IconButton(
                icon: Icon(
                  isrunning
                      ? Icons.pause_circle_outline_rounded
                      : Icons.play_circle_outline_rounded,
                  size: 90,
                  color: Theme.of(context).cardColor,
                ),
                onPressed: isrunning ? onPausePressed : onStartPressed,
              ),
            ),
          ),
          Flexible(
            flex: 3,
            child: Column(
              children: [
                Center(
                  child: IconButton(
                    icon: Icon(
                      Icons.restart_alt_outlined,
                      size: 90,
                      color: Theme.of(context).cardColor,
                    ),
                    onPressed: resetPressed,
                  ),
                ),
                Text(
                  "Reset",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w400,
                    color: Theme.of(context).cardColor,
                  ),
                ),
              ],
            ),
          ),

          Flexible(
            flex: 2,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50),
                      ),
                      color: Theme.of(context).cardColor,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Pomodoros',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color:
                                Theme.of(
                                  context,
                                ).textTheme.headlineLarge!.color,
                          ),
                        ),
                        Transform.translate(
                          offset: Offset(0, -10),
                          child: Text(
                            '$totalpomodoros',
                            style: TextStyle(
                              fontSize: 50,
                              fontWeight: FontWeight.w600,
                              color:
                                  Theme.of(
                                    context,
                                  ).textTheme.headlineLarge!.color,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

//Pomodoro 저장용
