import 'package:flutter/material.dart';

class MyProvider extends ChangeNotifier {
  TimeOfDay time = TimeOfDay.now();
  TimeOfDay leaveTime = TimeOfDay.now();
  TimeOfDay lateCalc = TimeOfDay.now();

  bool lateBool = false;

  bool lateCalcHappen = false;

  selectTime({required BuildContext context}) {
    showTimePicker(
      context: context,
      initialTime: time,
      //initialEntryMode: TimePickerEntryMode.dialOnly,
    ).then((value) {
      if (value != null) {
        time = value;
        calcTime(context: context);
      }
    });
    notifyListeners();
  }

  calcTime({required BuildContext context}) {
    if ((time.hour == 9 && time.minute > 30) ||
        (time.hour >= 10 && time.hour < 12)) {
      lateCalcHappen = true;
      lateBool = true;
      int lateTimeByMin =
          (((time.hour * 60) + time.minute) - (9.5 * 60)).toInt();
      leaveTime = leaveTime.replacing(hour: 16, minute: 0);
      print(((time.hour * 60) + time.minute) - (9.5 * 60));
      lateCalc = TimeOfDay(
        hour: (lateTimeByMin - (lateTimeByMin % 60).toInt()) ~/ 60,
        minute: (lateTimeByMin % 60).toInt(),
      );
    } else if (time.hour <= 7 && time.minute < 30) {
      lateBool = false;
      lateCalcHappen = false;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          behavior: SnackBarBehavior.floating, // default SnackBarBehavior.fixed.
          content: Text(
            "لا يوجد حضور قبل الساعة ٧.٣٠",
          ),
        ),
      );
      // Flushbar(
      //   title: "تنبيه",
      //   message:
      //   messageSize: 24,
      //   backgroundGradient:
      //       const LinearGradient(colors: [Colors.blueGrey, Colors.red]),
      //   duration: const Duration(seconds: 2),
      //   borderRadius: BorderRadius.circular(40),
      //   boxShadows: const [
      //     BoxShadow(
      //         color: Colors.black, offset: Offset(0.0, 5.0), blurRadius: 3.0)
      //   ],
      // ).show(context);
    } else if (time.hour >= 12 && time.minute > 0) {
      lateCalcHappen = false;
      lateBool = false;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "لا يوجد حضور بعد الساعة ١٢",
          ),
        ),
      );
    } else {
      lateCalcHappen = false;
      lateBool = true;
      leaveTime = time.replacing(
          hour: time.hour + 6 + (time.minute + 30) ~/ 60,
          minute: (time.minute + 30) % 60);
    }
    notifyListeners();
  }
}
