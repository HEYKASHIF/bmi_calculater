import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            brightness: Brightness.dark,
            seedColor: Colors.red,
            outline: Colors.white,
            primary: Colors.red.shade900),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'BMI Calculater'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var wtController = TextEditingController();
  var ftController = TextEditingController();
  var inController = TextEditingController();
  var result = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          widget.title,
          style: TextStyle(
            color: Colors.red.shade900,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: SizedBox(
            width: 350,
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const SizedBox(
                  height: 45,
                ),
                Text(
                  result,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 25,
                    color: Colors.red.shade900,
                  ),
                ),
                const SizedBox(
                  height: 100,
                ),
                TextField(
                  controller: wtController,
                  decoration: InputDecoration(
                    fillColor: Colors.amber,
                    focusColor: Colors.amber,
                    hoverColor: Colors.amber,
                    prefixIconColor: Colors.red,
                    suffixIconColor: Colors.red.shade900,
                    label: Text("Enter Your Weight in Kgs",
                        style: TextStyle(
                          color: Colors.red.shade900,
                        )),
                    suffixIcon: const Icon(CupertinoIcons.smallcircle_circle),
                  ),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(
                  height: 31,
                ),
                TextField(
                  controller: ftController,
                  decoration: InputDecoration(
                    suffixIconColor: Colors.red.shade900,
                    label: Text("Enter Your Height in Ft.",
                        style: TextStyle(
                          color: Colors.red.shade900,
                        )),
                    suffixIcon: const Icon(CupertinoIcons.heart_circle),
                  ),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(
                  height: 31,
                ),
                TextField(
                  controller: inController,
                  decoration: InputDecoration(
                    suffixIconColor: Colors.red.shade900,
                    label: Text("Enter Your Height in Inch.",
                        style: TextStyle(
                          color: Colors.red.shade900,
                        )),
                    suffixIcon: const Icon(CupertinoIcons.dot_square),
                  ),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(
                  height: 250,
                ),
                ElevatedButton(
                  onPressed: () {
                    var wt = wtController.text.toString();
                    var ft = ftController.text.toString();
                    var inch = inController.text.toString();

                    if (wt != '' && ft != '' && inch != '') {
                      var iWt = int.parse(wt);
                      var iFt = int.parse(ft);
                      var iInch = int.parse(inch);

                      var tInch = (iFt * 12) + iInch;

                      var tCm = tInch * 2.54;

                      var tM = tCm / 100;

                      var bMi = iWt / (tM * tM);

                      setState(() {
                        result = "Your BMI is ${bMi.toStringAsFixed(4)}";
                      });
                    } else {
                      setState(() {
                        result = "Please Enter All Required Fields!";
                      });
                    }
                  },
                  child: Text(
                    "Calculate",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.red.shade900,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
