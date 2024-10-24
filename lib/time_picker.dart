import 'package:flutter/material.dart';
import 'package:interview_task/day_widget.dart';

class TimePicker extends StatelessWidget {
  const TimePicker({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> daysOfWeek = [
      "Monday",
      "Tuesday",
      "Wednesday",
      "Thursday",
      "Friday",
      "Saturday",
      "Sunday"
    ];
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(14),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade400,
                            spreadRadius: 0.1,
                            blurRadius: 60,
                          )
                        ],
                      ),
                      height: 100,
                    ),
                  ),
                  Column(
                    children: [
                      const SizedBox(height: 30),
                      //CircleAvatar
                      Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          const SizedBox(
                            height: 100,
                            width: 100,
                            child: CircleAvatar(
                              backgroundImage: AssetImage('assets/bird.jpg'),
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            // bottom: 0,
                            // right: 27,
                            child: Container(
                              width: 50,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 2),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5),
                                boxShadow: const [
                                  BoxShadow(
                                    blurRadius: 0.5,
                                    blurStyle: BlurStyle.normal,
                                    color: Colors.black,
                                  ),
                                ],
                              ),
                              child: const Center(
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                      size: 16,
                                    ),
                                    Text('5'),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        "Rushabh Dev",
                        style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 30),
                    ],
                  ),
                ],
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: daysOfWeek.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: DayWidget(day: daysOfWeek[index]),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}