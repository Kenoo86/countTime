import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/time_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
//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

  @override
  Widget build(BuildContext context) {
    return Consumer<MyProvider>(builder: (context, provider, _) {
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
                    provider.selectTime(context: context);
                  },
                  child: const Text(
                    'اختار الوقت',
                    style: TextStyle(fontSize: 40, fontWeight: FontWeight.w300),
                  ),
                ),
                const SizedBox(height: 8),
                if (provider.lateBool)
                  Column(
                    children: [
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
                        provider.time.format(context),
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 40,
                          fontWeight: FontWeight.w200,
                        ),
                      ),
                      const SizedBox(height: 10),
                      // if(false)
                      // ElevatedButton(
                      //   style: ElevatedButton.styleFrom(
                      //       backgroundColor: const Color(0XFF227C70)),
                      //   onPressed: () {
                      //     calcTime();
                      //   },
                      //   child: const Text(
                      //     'احسب',
                      //     style: TextStyle(
                      //       fontSize: 40,
                      //       fontWeight: FontWeight.w300,
                      //     ),
                      //   ),
                      // ),
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
                        provider.leaveTime.format(context),
                        style: const TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.w200,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                if (provider.lateCalcHappen)
                  Column(
                    children: [
                      const SizedBox(height: 8),
                      const Text(
                        'وقت التأخير',
                        style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'ساعه : ${provider.lateCalc.hour} دقيقة : ${provider.lateCalc.minute}',
                        style: const TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.w200,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  )
              ]),
            ),
          ));
    });
  }
}
