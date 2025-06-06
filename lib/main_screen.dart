import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_test_app/prime_screen.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _runTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final week = _getWeekNumber(DateTime.now());

    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              DateFormat("HH:mm").format(DateTime.now()),
              style: TextStyle(color: Colors.white, fontSize: 96),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 16,
              children: [
                Text(
                  DateFormat("E d. MMM.", "de_DE").format(DateTime.now()),
                  style: TextStyle(color: Colors.white, fontSize: 48),
                ),
                Text(
                  'KW $week',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _runTimer() {
    _timer = Timer.periodic(Duration(seconds: 10), _checkNumber);
  }

  int _getWeekNumber(DateTime date) {
    final thursday = date.add(Duration(days: 3 - ((date.weekday + 6) % 7)));
    final firstThursday = DateTime(thursday.year, 1, 4);
    final weekNumber =
        1 + ((thursday.difference(firstThursday).inDays) / 7).floor();
    return weekNumber;
  }

  Future<void> _checkNumber(Timer timer) async {
    try {
      final response = await get(
        Uri.parse("http://www.randomnumberapi.com/api/v1.0/random"),
      );

      if (response.statusCode != 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Center(
              child: Text(
                "Request failed with status code ${response.statusCode}",
              ),
            ),
          ),
        );
        return;
      }

      final number =
          (jsonDecode(utf8.decode(response.bodyBytes)) as List<dynamic>).first;
      if (!_isPrime(number)) {
        print(number);
        return;
      }

      _timer?.cancel();

      await Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => PrimeScreen(number: number)),
      );

      _runTimer();

    } catch (ex) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Center(child: Text(ex.toString()))));
    }
  }

  bool _isPrime(int number) {
    if (number <= 2) {
      return true;
    }

    for (int i = 2; i <= number ~/ 2; i++) {
      if (number % i == 0) {
        return false;
      }
    }

    return true;
  }
}
