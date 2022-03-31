import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/calender.dart';

import 'package:flutter_application_1/screens/period_tracker.dart';

class trackerPage extends StatefulWidget {
  const trackerPage({Key? key}) : super(key: key);

  @override
  _trackerPageState createState() => _trackerPageState();
}

class _trackerPageState extends State<trackerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFCB498),
      body: Padding(
        padding:
            const EdgeInsets.only(top: 25.0, bottom: 20, left: 10, right: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Icon(
              Icons.menu,
              size: 40,
            ),
            Center(
              child: Container(
                margin: EdgeInsets.only(bottom: 35),
                height: MediaQuery.of(context).size.height * 0.25,
                child: const Image(
                  image: AssetImage("assets/drop.png"),
                ),
              ),
            ),
            Center(
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.black),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                child: const Padding(
                  padding:
                      EdgeInsets.only(top: 8.0, bottom: 8, left: 12, right: 12),
                  child: Text(
                    'Fertility Tracker',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 28),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Calendar()),
                  );
                },
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.black),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                child: const Padding(
                  padding:
                      EdgeInsets.only(top: 8.0, bottom: 8, left: 12, right: 12),
                  child: Text(
                    'Period Tracker',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 28),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const PeriodTracker()),
                  );
                },
              ),
            ),
            Spacer(),
            Center(
              child: Container(
                margin: EdgeInsets.only(top: 15),
                height: MediaQuery.of(context).size.height * 0.35,
                child: const Image(
                  image: AssetImage("assets/women_image.png"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
