import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TimeOfDay time = TimeOfDay.now();
  TimeOfDay leaveTime = TimeOfDay.now();
  TimeOfDay lateCalc = TimeOfDay.now();

  //bool lateBool = false;

  selectTime() async {
    final TimeOfDay? newTime = await showTimePicker(
      context: context,
      initialTime: time,
      initialEntryMode: TimePickerEntryMode.input,
    );
    if (newTime != null) {
      setState(() {
        time = newTime;
      });
    }
  }

  calcTime() {
    setState(() {
      if (time.hour >= 9 && time.minute > 30) {
        leaveTime = leaveTime.replacing(hour: 4, minute: 0);
      } else if (time.hour <= 7 && time.minute < 30) {
        Flushbar(
          title: "تنبيه",
          message: "لايوجد حضور قبل الساعة ٧.٣٠",
          messageSize: 24,
          backgroundGradient:
              const LinearGradient(colors: [Colors.blueGrey, Colors.red]),
          duration: const Duration(seconds: 2),
          borderRadius: BorderRadius.circular(40),
          boxShadows: const [
            BoxShadow(
                color: Colors.black, offset: Offset(0.0, 5.0), blurRadius: 3.0)
          ],
        ).show(context);
      } else if (time.hour >= 12 && time.minute > 0) {
        Flushbar(
          title: "تنبيه",
          message: "لايوجد حضور بعد الساعة ١٢",
          messageSize: 24,
          backgroundGradient:
              const LinearGradient(colors: [Colors.blueGrey, Colors.red]),
          duration: const Duration(seconds: 2),
          borderRadius: BorderRadius.circular(40),
          boxShadows: const [
            BoxShadow(
                color: Colors.black, offset: Offset(0.0, 5.0), blurRadius: 3.0)
          ],
        ).show(context);
      } else {
        leaveTime = time.replacing(
            hour: time.hour + 6 + (time.minute + 30) ~/ 60,
            minute: (time.minute + 30) % 60);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.green,
          title: const Text(
            'حاسبة وقت الانصراف',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(children: [
              const SizedBox(
                height: 10,
              ),
              Image.asset(
                'assets/١.png',
                width: 120,
                height: 120,
              ),
              const SizedBox(
                height: 40,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0XFF227C70)),
                onPressed: () {
                  selectTime();
                },
                child: const Text(
                  'اختار الوقت',
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.w300),
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'وقت الحضور',
                style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              const SizedBox(
                height: 1,
              ),
              Text(
                time.format(context),
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 40,
                  fontWeight: FontWeight.w200,
                ),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0XFF227C70)),
                onPressed: () {
                  calcTime();
                },
                child: const Text(
                  'احسب',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'وقت الانصراف',
                style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                leaveTime.format(context),
                style: const TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w200,
                  color: Colors.black,
                ),
              ),
            ]),
          ),
        ));
  }
}
