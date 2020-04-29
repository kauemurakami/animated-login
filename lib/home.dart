import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
              height: 400,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("images/fundo.png"),
                fit: BoxFit.fill
              )
            ),
                child: Stack(
                  children: <Widget>[
                    Positioned(
                     left: 10,
                     child: Image.asset("images/detalhe1,png"),
                    ),
                    Positioned(
                      left: 50,
                      child: Image.asset("images/detalhe2,png"),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 30, right: 30),
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey[200],
                          blurRadius: 15,
                          spreadRadius: 4
                        )
                      ]
                    ),
                      child: Column(
                        children: <Widget>[
                          TextFormField(
                            decoration: InputDecoration(
                              labelText: 'Email'
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 20,),
                    //InkWell(),
                    SizedBox(height: 10,),
                    Text(
                      "Esqueci minha senha",
                      style: TextStyle(
                        color:Color.fromRGBO(255, 100, 127, 1),
                      fontWeight: FontWeight.bold,
                      )
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}