import 'package:flutter/material.dart';

import 'package:seeker_app/Screens/Auth/widgets/background.dart';
import 'package:seeker_app/Screens/Auth/widgets/already_have_an_account_check.dart';
import 'package:seeker_app/widgets/rounded_button.dart';

class Body extends StatefulWidget {
  const Body({Key key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  bool _login = true;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var textStyle = TextStyle(
      color: Colors.black.withOpacity(0.6),
      fontFamily: 'Poppins',
      fontSize: 14,
    );
    return Background(
      child: SingleChildScrollView(
        child: Container(
          height: size.height,
          width: size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                'Seeker',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Poppins',
                  fontSize: 36,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 30),
                child: Form(
                  child: Column(
                    children: [
                      if (!_login)
                        AuthTextFieldContainer(
                          child: TextFormField(
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Nombres',
                              hintStyle: textStyle,
                            ),
                          ),
                        ),
                      if (!_login)
                        AuthTextFieldContainer(
                          child: TextFormField(
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Apellidos',
                              hintStyle: textStyle,
                            ),
                          ),
                        ),
                      AuthTextFieldContainer(
                        child: TextFormField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Correo',
                            hintStyle: textStyle,
                          ),
                        ),
                      ),
                      AuthTextFieldContainer(
                        child: TextFormField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Contraseña',
                            hintStyle: textStyle,
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      RoundedButton(
                        text: _login ? 'INICIAR SESIÓN' : 'REGISTRARSE',
                        color: Color(0xFF348AA7),
                        press: () {},
                      ),
                      SizedBox(height: 20),
                      AlreadyHaveAnAccountCheck(
                        login: _login,
                        press: () {
                          setState(() {
                            _login = !_login;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AuthTextFieldContainer extends StatelessWidget {
  final Widget child;
  const AuthTextFieldContainer({
    Key key,
    @required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.symmetric(horizontal: 25),
      alignment: Alignment.center,
      height: 58,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: child,
    );
  }
}
