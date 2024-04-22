import 'dart:math';
import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:get/route_manager.dart';

// Define FrontView Widget
class FrontView extends StatelessWidget {
  final int monthIndex;

  const FrontView({super.key, required this.monthIndex});

  @override
  Widget build(BuildContext context) {
    // Implement your FrontView UI here
    return Text('Front View - Month $monthIndex');
  }
}

// Define BackView Widget
class BackView extends StatelessWidget {
  final int monthIndex;

  const BackView({super.key, required this.monthIndex});

  @override
  Widget build(BuildContext context) {
    // Implement your BackView UI here
    return Text('Back View - Month $monthIndex');
  }
}

// Define ActionButtons Widget
class ActionButtons extends StatelessWidget {
  final Function() change;

  const ActionButtons({super.key, required this.change});

  @override
  Widget build(BuildContext context) {
    // Implement your ActionButtons UI here
    return ElevatedButton(
      onPressed: change,
      child: const Text('Switch View'),
    );
  }
}

class MyCalendarPage extends StatefulWidget {
  const MyCalendarPage({super.key});

  @override
  State<MyCalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<MyCalendarPage>
    with TickerProviderStateMixin {
  bool isFrontView = true;
  late AnimationController controller;

  void switchView() {
    setState(() {
      isFrontView = !isFrontView;
      isFrontView ? controller.forward() : controller.reverse();
    });
  }

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // search and menu
            const SearchBar(),
            const SizedBox(height: 30.0),

            // year selector
            DropdownButton(
              value: '2024',
              items: const [
                DropdownMenuItem(value: '2024', child: Text('2024'))
              ],
              onChanged: (value) {},
            ),
            const SizedBox(height: 30.0),

            // month cards
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 22.0),
                child: PageView.builder(
                  controller: PageController(
                    initialPage: 0,
                    viewportFraction: 0.78,
                  ),
                  scrollDirection: Axis.horizontal,
                  itemCount: 12, // for 12 months
                  itemBuilder: (_, i) => AnimatedBuilder(
                    animation: controller,
                    builder: (_, child) {
                      return Transform(
                        transform: Matrix4.identity()
                          ..setEntry(3, 2, 0.001)
                          ..rotateY(controller.value * pi),
                        alignment: Alignment.center,
                        child: isFrontView
                            ? FrontView(monthIndex: i + 1)
                            : Transform(
                                transform: Matrix4.rotationY(pi),
                                alignment: Alignment.center,
                                child: BackView(monthIndex: i + 1),
                              ),
                      );
                    },
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30.0),
            // action buttons
            ActionButtons(change: switchView),
            const SizedBox(height: 75.0),
          ],
        ),
      ),
    );
  }
}
