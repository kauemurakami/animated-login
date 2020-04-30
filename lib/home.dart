import 'dart:ui';
//import 'package:flutter/scheduler.dart' show timeDilation;
import 'package:animatedlogin/input_custom.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home>  with SingleTickerProviderStateMixin{

  AnimationController _animationController;
  Animation<double> _animacaoBlur;
  Animation<double> _animacaoFade;
  Animation<double> _animacaoSize;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this
    );
    _animacaoBlur = Tween<double>(
      begin: 5,
      end: 0,
    ).animate(CurvedAnimation(
        parent: _animationController,
      curve: Curves.ease
      ));
    _animacaoFade = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOutQuint
    ));
    _animacaoSize = Tween<double>(
      begin: 0,
      end: 500,
    ).animate(CurvedAnimation(
        parent: _animationController,
        curve: Curves.decelerate
    ));
    _animationController.forward();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _animationController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              AnimatedBuilder(
                animation: _animacaoBlur,
                builder: (context, widget){
                  return Container(
                      height: 400,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("images/fundo.png"),
                              fit: BoxFit.fill
                          )
                      ),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(
                          sigmaY: _animacaoBlur.value,
                          sigmaX: _animacaoBlur.value,
                        ),
                        child: Stack(
                          children: <Widget>[
                            Positioned(
                              left: 10,
                              child: FadeTransition(
                                opacity: _animacaoFade,
                                child: Image.asset("images/detalhe1.png"),
                              ),
                            ),
                            Positioned(
                              left: 50,
                              child: FadeTransition(
                                opacity: _animacaoFade,
                                child: Image.asset("images/detalhe2.png")
                              ),
                            ),
                          ],
                        ),
                      )
                  );
                },
              ),
              Padding(
                padding: EdgeInsets.only(left: 30, right: 30),
                child: Column(
                  children: <Widget>[
                    AnimatedBuilder(
                      animation: _animacaoSize,
                      builder: (context, widget){
                        return Container(
                          width: _animacaoSize.value,
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
                              InputCustom(
                                  hint: 'Email',
                                  obscure: false,
                                  icone : Icon(Icons.person)
                              ),
                              InputCustom(
                                  hint: 'Senha',
                                  obscure: true,
                                  icone : Icon(Icons.lock)
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                    SizedBox(height: 20,),
                    AnimatedBuilder(
                      animation: _animacaoSize,
                      builder: (context,widget){
                        return InkWell(
                          onTap: (){

                          },
                          child: Container(
                            height: 50,
                            width: _animacaoSize.value,
                            child: Center(
                              child: Text(
                                "Entrar",
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                            ),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                gradient: LinearGradient(
                                    colors: [
                                      Color.fromRGBO(255, 100, 127, 1),
                                      Color.fromRGBO(255, 123, 145, 1),
                                    ]
                                )
                            ),
                          ),
                        );
                      },
                    ),
                    SizedBox(height: 10,),
                    FadeTransition(
                      opacity: _animacaoFade,
                      child: Text(
                          "Esqueci minha senha",
                          style: TextStyle(
                            color:Color.fromRGBO(255, 100, 127, 1),
                            fontWeight: FontWeight.bold,
                          )
                      ),
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
