import 'dart:async';
import 'package:rxdart/rxdart.dart';
import 'package:meta/meta.dart';

class HomeBloc {
  final  BehaviorSubject<String> _subject;
  final  ValueObservable<String> stream;


  String get currentState => _subject.value;



  factory HomeBloc(){
    return HomeBloc._(subject: BehaviorSubject<String>(seedValue: ""));
  }

  HomeBloc._({@required BehaviorSubject<String> subject}):_subject=subject, stream= subject.stream;



  addItem(){
    _subject.add(currentState);
  }

  void dispose(){

    this._subject.close();

  }

  void funcion(String simbol){

    if(simbol=="C"){
      this.setcurrentState("");

    }
    else if(simbol=="="){

      var currentState = this.currentState;
      int substring ;
      int substring2 ;
      var operador;
      for(int i=0;i<currentState.length;i++){
        if(int.tryParse(currentState.substring(i,i+1)) is int){

                if(i==0){
                  substring = int.parse(currentState.substring(i,i+1));
                  print(substring);

                }
                else {
                  substring2 = int.parse(currentState.substring(i, i + 1));
                  print(i);
                }

        }else{

          operador=currentState.substring(i,i+1);

        };


      }

      if(operador=="+"){
        var result=substring+substring2;
        this.setcurrentState(result.toString());

      }
      if(operador=="-"){
        var result=substring-substring2;
        this.setcurrentState(result.toString());

      }
      if(operador=="*"){
        var result=substring*substring2;
        this.setcurrentState(result.toString());

      }
      if(operador=="/"){
        if(substring2==0){

          this.setcurrentState("No es posible dividir por 0");

        }else{

          var result=substring/substring2;
          this.setcurrentState(result.toString());

        }

      }

    }
    else{
      var currentState = this.currentState;
      _subject.add(currentState+ simbol);

    }

  }

  void setcurrentState(String s) {

    _subject.value=s;
  }
}

