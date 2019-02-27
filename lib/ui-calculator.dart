import 'package:flutter/material.dart';
import 'package:flutter_app_calculator/bloc-calculator.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: new HomePage(bloc: HomeBloc()),
    );
  }
}
class HomePage extends StatefulWidget{
  HomePage({@required this.bloc,Key key,this.title}) : super(key: key);

  final String title;
  final HomeBloc bloc;


  @override
  State createState() => new HomePageState(); // creating the state
}

class HomePageState extends State<HomePage>{
  var ansStr = "0";

  @override
  Widget build(BuildContext context) { // creating the widget
    return new Scaffold(
        appBar: new AppBar( //defines the content of the Appbar
          title: new Text("Calculator"),
        ),
        body:
            Container(
              child: Column( //Since we have multiple children arranged vertically, we are using column
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                // Equal vertical space between all the children of column
                children: <
                    Widget>[
           StreamBuilder( stream:widget.bloc.stream,
            initialData: "",
            builder:(context,AsyncSnapshot<String> snapshot) {
               if(snapshot.hasData) {
               final data =snapshot.data;
                      // the column widget uses the children property
                  return Container( // Display Container
                    constraints: BoxConstraints
                        .expand( // Creating a boxed container
                      height: Theme
                          .of(context)
                          .textTheme
                          .display1
                          .fontSize * 1.1 + 100.0,
                    ),
                    alignment: Alignment.bottomRight,
                    // Aligning the text to the bottom right of our display screen
                    color: Colors.white,
                    // Seting the background color of the container
                    child: Text(
                      widget.bloc.currentState.toString(),
                      style: TextStyle( // Styling the text
                          fontSize: 50.0,
                          color: Colors.black
                      ),
                      textAlign: TextAlign.right,
                    ),
                  );
               }
               else {
                 return Container();
               }
            }
            ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      _button("9", () {
                        return widget.bloc.funcion("9");
                      }), // using custom widget _button
                      _button("8", () {
                        return widget.bloc.funcion("8");
                      }),
                      _button("7", () {
                        return widget.bloc.funcion("7");
                      }),
                      _button("+", () {
                        return widget.bloc.funcion("+");
                      })
                    ],

                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      _button("6", () {
                        return widget.bloc.funcion("6");
                      }), // using custom widget _button
                      _button("5", () {
                        return widget.bloc.funcion("5");
                      }),
                      _button("4", () {
                        return widget.bloc.funcion("4");
                      }),
                      _button("-", () {
                        return widget.bloc.funcion("-");
                      })
                    ],

                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      _button("3", () {
                        return widget.bloc.funcion("3");
                      }), // using custom widget _button
                      _button("2", () {
                        return widget.bloc.funcion("2");
                      }),
                      _button("1", () {
                        return widget.bloc.funcion("1");
                      }),
                      _button("*", () {
                        return widget.bloc.funcion("*");
                      })
                    ],

                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      _button("C", () {
                        return widget.bloc.funcion("C");
                      }), // using custom widget _button
                      _button("0", () {
                        return widget.bloc.funcion("0");
                      }),
                      _button("=", () {
                        return widget.bloc.funcion("=");
                      }),
                      _button("/", () {
                        return widget.bloc.funcion("/");
                      })
                    ],

                  )
                ],
              ),
            )

    );
  }
}
Widget _button (String number, Function() f){ // Creating a method of return type Widget with number and function f as a parameter
  return MaterialButton(
    height: 100.0,
    child: Text(number,
        style:  TextStyle(fontWeight: FontWeight.bold, fontSize: 24.0)),
    textColor: Colors.black,
    color: Colors.grey[100],
    onPressed: f,
  );
}
