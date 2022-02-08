import 'package:episos_trial/screens/nav_screen.dart';
import 'package:flutter/material.dart';

class SignUp extends StatelessWidget {

  var formKey = GlobalKey<FormState>();
  var tfUsername = TextEditingController();
  var tfPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFC8BCAF),
      appBar: AppBar(
        backgroundColor: Color(0xFFC8BCAF),
        elevation: 0,
        shadowColor: Colors.transparent,
      ),
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Hoşgeldin!',
                style: TextStyle(
                  fontFamily: 'Segoe UI',
                  fontSize: 26,
                  color: const Color(0xffffffff),
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),  
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                   Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: TextFormField(
                      cursorColor: Color(0xFFDEB992),
                      controller: tfUsername,
                      decoration: InputDecoration(hintText: "E-mail adresi",
                          icon: Icon(Icons.mail_outline)),
                      validator: (tfentry) {
                        if(tfentry!.isEmpty) {
                          return "E-posta giriniz";
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: TextFormField(
                      cursorColor: Color(0xFFDEB992),
                      controller: tfPassword,
                      obscureText: true,
                      decoration: InputDecoration(hintText: "Şifre oluştur",
                          icon: Icon(Icons.lock)
                    ),
                      validator: (tfentry) {
                        if(tfentry!.isEmpty) {
                          return "Şifre giriniz";
                        }
                        if(tfentry.length < 6){
                          return "Şifreniz en az 6 haneli olmalıdır.";
                        }
                        return null;
                      },
                    ),
                  ),
                  ]
                  ),
                ),
              ),
              Text.rich(
                TextSpan(
                  style: TextStyle(
                    fontFamily: 'Segoe UI',
                    fontSize: 14,
                    color: const Color(0xffffffff),
                  ),
                  children: [
                    TextSpan(
                      text: 'Lorem ipsum dolor sit amet, ',
                    ),
                    TextSpan(
                      text: 'consetetur',
                      style: TextStyle(
                        color: const Color(0xffa49788),
                        decoration: TextDecoration.underline,
                      ),
                    ),
                    TextSpan(
                      text: ' ',
                      style: TextStyle(
                        color: const Color(0xffa49788),
                      ),
                    ),
                    TextSpan(
                      text: 'sadipscing\n                       nonumy eirmod tempor',
                    ),
                  ],
                ),
                textHeightBehavior: TextHeightBehavior(applyHeightToFirstAscent: false),
                textAlign: TextAlign.left,
              ),
              ElevatedButton(
                onPressed: () {
                    bool controlServer = formKey.currentState!.validate();
                    if(controlServer) {
                      String u = tfUsername.text;
                      String s = tfPassword.text;
                      print("$u, $s");
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => NavScreen()));
                    }
                },
                child: Icon(Icons.arrow_forward, color: Colors.black54),
                style: ElevatedButton.styleFrom(
                  shape: CircleBorder(),
                  padding: EdgeInsets.all(20),
                  primary: Color(0xFFDEB992), // <-- Button color
                  onPrimary: Colors.black, // <-- Splash color
                ),
              )
            ],

       ),
      ),
    );
  }
}
