import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:timeago/timeago.dart' as timeago;

class PrimeScreen extends StatefulWidget {
  final int number;

  const PrimeScreen({super.key, required this.number});

  @override
  State<PrimeScreen> createState() => _PrimeScreenState();
}

class _PrimeScreenState extends State<PrimeScreen> {
  static const _lastPrimeFoundKey = "lastPrimeFoundOn";

  DateTime? _lastPrimeFound;
  SharedPreferences? _prefs;

  @override
  void initState() {
    super.initState();

    SharedPreferences.getInstance()
        .then((prefs) {
          _prefs = prefs;

          final dateString = prefs.getString(_lastPrimeFoundKey);

          if (dateString == null) {
            return;
          }

          _lastPrimeFound = DateTime.parse(dateString);
          setState(() {});
        })
        .onError((err, st) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Center(
                child: Text("Error fetching date: ${err.toString()}"),
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    final timeDifference =
        _lastPrimeFound == null ? "never" : timeago.format(_lastPrimeFound!);

    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 16,
              children: [
                Text(
                  "Congrats!",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 48,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  "You obtained a prime number, it was: ${widget.number}",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  "Time since last prime number: $timeDifference",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 16),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(Colors.green),
                  ),
                  onPressed: () async {
                    await _prefs?.setString(
                      _lastPrimeFoundKey,
                      DateTime.now().toIso8601String(),
                    );

                    Navigator.of(context).pop();
                  },
                  child: Text("Close", style: TextStyle(color: Colors.black)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
