import 'dart:math';

import 'package:flutter/material.dart';
import 'package:widget_and_text_animator/widget_and_text_animator.dart';
import 'package:widget_circular_animator/widget_circular_animator.dart';

class HomePage2 extends StatefulWidget {
  const HomePage2({super.key});

  @override
  State<HomePage2> createState() => _HomePage2State();
}

class _HomePage2State extends State<HomePage2>
    with SingleTickerProviderStateMixin {
  late AnimationController _animatedContainer;
  late Animation stat;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animatedContainer = new AnimationController(
      vsync: this,
      duration: Duration(seconds: 7),
    );
    stat = Tween<double>(begin: 0, end: pi * 2).animate(_animatedContainer);
    _animatedContainer.repeat();
  }

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> k =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    return Scaffold(
      appBar: AppBar(
        title: Text("PLANET"),
        centerTitle: true,
        backgroundColor: Colors.purple,
      ),
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.purple,
                Color(0xff483475),
                //  Color(0xff070B34)
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Center(
                child: WidgetCircularAnimator(
                  size: 250,
                  singleRing: true,
                  innerColor: Colors.amber,
                  outerIconsSize: 10,
                  child: Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.grey[200]),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          Navigator.pop(context);
                        });
                      },
                      child: Hero(
                        tag: k['tag'],
                        child: WidgetAnimator(
                          child: AnimatedBuilder(
                            animation: _animatedContainer,
                            builder: (context, child) {
                              return Transform.rotate(
                                angle: stat.value,
                                child: Container(
                                  height: 200,
                                  child: Image.asset(k['i']),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                k['name'],
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
              SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 300,
                  width: 300,
                  decoration: BoxDecoration(
                    color: Color(0xff483475),
                    borderRadius: BorderRadius.circular(5),
                    boxShadow: [
                      BoxShadow(
                          color: Color(0xff483475),
                          blurRadius: 5,
                          spreadRadius: 2),
                    ],
                  ),
                  child: Expanded(
                      child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: SingleChildScrollView(
                      child: Text(
                        k['d'],
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
