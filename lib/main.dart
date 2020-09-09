import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Conversor(title: 'Conversor de F a C°'),
    );
  }
}

class Conversor extends StatefulWidget {
  Conversor({Key key, this.title}) : super(key:key);

  final String title;

  @override
  _ConversorState createState() => _ConversorState();
}

class _ConversorState extends State<Conversor> {
  var _output="Inicial";
  final _inputController=TextEditingController();

  void _calculateTemp(){
    setState(() {
      double _inputTemp=double.parse(_inputController.text);
      double _farenheit=(_inputTemp-32)*(5/9);
      _output=_farenheit.toString()+" C°";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child:Form(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(left:80, right: 80),
                child: TextFormField(
                  controller: _inputController,
                ),
              ),
              RaisedButton(
                onPressed:(){
                  _calculateTemp();
                },
                splashColor: Colors.redAccent,
              ),
              Text('$_output'),
            ],
          ),
        ),

      ),
    );
  }
}

