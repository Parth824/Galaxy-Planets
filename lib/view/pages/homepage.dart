import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:galaxy/model/gobles.dart';
import 'package:galaxy/view/pages/secod.dart';
import 'package:widget_and_text_animator/widget_and_text_animator.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    timeDilation = 2;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: TextAnimator(
          "Galaxy Planets",
          atRestEffect: WidgetRestingEffects.wave(),
          outgoingEffect: WidgetTransitionEffects.incomingScaleDown(),
          textAlign: TextAlign.center,
          initialDelay: Duration(seconds: 2),
          spaceDelay: Duration(seconds: 2),
        ),
        backgroundColor: Colors.deepPurple,
      ),
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: 668,
                child: Image.asset(
                  "assets/images/g2.png",
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                height: 668,
                child: SingleChildScrollView(
                  child: Center(
                    child: Column(
                      children: [
                        ...data.k.map(
                          (e) => Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) => HomePage2(),
                                        settings: RouteSettings(arguments: e),
                                      ),
                                    );
                                  });
                                },
                                child: Hero(
                                  tag: e['tag'],
                                  child: WidgetAnimator(
                                    atRestEffect: WidgetRestingEffects.wave(),
                                    child: Container(
                                      height: 150,
                                      child: Image.asset(e['i']),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 16,
                              ),
                              TextAnimator(
                                e['name'],
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17,
                                ),
                                atRestEffect: WidgetRestingEffects.wave(),
                                outgoingEffect:
                                    WidgetTransitionEffects.incomingScaleDown(),
                                textAlign: TextAlign.center,
                                initialDelay: Duration(seconds: 2),
                                spaceDelay: Duration(seconds: 2),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),

          //
        ],
      ),
    );
  }
}
