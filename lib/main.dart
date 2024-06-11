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
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.yellow),
        useMaterial3: true,
      ),
        debugShowCheckedModeBanner: false,

      home: const MyHomePage(title: 'Your BMI')
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
  int _counter = 0;

  void _incrementCounter() {
    setState(() {

      _counter++;
    });
  }

  var wtController = TextEditingController();
  var ftController = TextEditingController();
  var inchController = TextEditingController();

  var result = "";
  var bgColor = Colors.tealAccent.shade100;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
        backgroundColor: Colors.blueGrey.shade100
      ),


      body: Container(
        color: bgColor,
        child: Center(
          child: Container(
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('BMI', style: TextStyle(fontSize: 34, fontWeight: FontWeight.w700
                ),),

                SizedBox(height: 22,),

                TextField(
                  controller: wtController,
                  decoration: InputDecoration(
                    label: Text('Enter your Weight (in Kgs)'),
                    prefixIcon: Icon(Icons.line_weight)
                  ),
                  keyboardType: TextInputType.number,
                ),

                SizedBox(height: 12,),

                TextField(
                  controller: ftController,
                  decoration: InputDecoration(
                      label: Text('Enter your Height (in ft)'),
                      prefixIcon: Icon(Icons.height)
                  ),
                  keyboardType: TextInputType.number,
                ),

                SizedBox(height: 12,),

                TextField(
                  controller: inchController,
                  decoration: InputDecoration(
                      label: Text('Enter your Height (in inch)'),
                      prefixIcon: Icon(Icons.height)
                  ),
                  keyboardType: TextInputType.number,
                ),

                SizedBox(height: 15,),

                ElevatedButton(onPressed: (){

                  var wt = wtController.text.toString();
                  var ft = ftController.text.toString();
                  var inch = inchController.text.toString();

                  if(wt!= "" && ft!="" && inch!=""){

                    var iWt = int.parse(wt);
                    var iFt = int.parse(ft);
                    var iInch = int.parse(inch);

                    var tInch = (iFt*12) + iInch;

                    var tCm = tInch*2.54;

                    var tM = tCm/100;

                    var bmi = iWt/(tM*tM);

                    var msg = "";

                    if(bmi>25){

                      msg = " You're OverWeight!!";
                      bgColor = Colors.red.shade200;

                    }else if(bmi<18){

                      msg = " You're UnderWeight!!";
                      bgColor = Colors.lightBlue.shade200;

                    }else {
                      msg = " You're Healthy!!";
                      bgColor = Colors.green.shade200;
                    }

                    setState(() {
                      result = " $msg \n Your BMI is : ${bmi.toStringAsFixed(4)}";
                    });


                  } else {
                    setState(() {
                      result = " Please fill the all the required blanks!!";
                    });

                  }



                }, child:Text('Calculate') ),

                SizedBox(height: 15,),


                Text(result, style: TextStyle(fontSize: 19),)
              ],
            ),
          ),
        ),
      )
        
    );
  }
}
