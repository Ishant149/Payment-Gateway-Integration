import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:url_launcher/url_launcher.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(28, 40, 51, 1),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: ListView(
          shrinkWrap: true,
          children: [
            Container(
              margin: EdgeInsets.only(top: 60),
              alignment: Alignment.center,
              child: Image.asset('assets/tsf_logo.png'),
            ),
            _landingPageColumnWidgets(
                text: 'The Sparks Foundation',
                marginFromTopVal: 0.0,
                fontSize: 26.0,
                color: Colors.orangeAccent),
            _landingPageColumnWidgets(
                text: 'Mobile App Development Internship',
                marginFromTopVal: 30.0,
                fontSize: 23.0,
                color: Colors.cyan),
            _landingPageColumnWidgets(
                text: 'Payment Gateway Integration',
                marginFromTopVal: 30.0,
                fontSize: 21.0,
                color: Colors.lightGreen),
            _donateButton(),
          ],
        ),
      ),
    );
  }

  Widget _landingPageColumnWidgets(
      {required String text,
        required double marginFromTopVal,
        required double fontSize,
        Color color = Colors.white70}) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(top: marginFromTopVal),
      child: Text(
        text,
        style: TextStyle(
          color: color,
          fontSize: fontSize,
          fontWeight: FontWeight.bold,
          fontFamily: 'Roboto',
        ),
      ),
    );
  }

  Widget _donateButton() {
    return Container(
      margin: EdgeInsets.only(top: 20.0),
      alignment: Alignment.center,
      child: TextButton(
        style: TextButton.styleFrom(
          foregroundColor: Colors.blueAccent,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40.0),
              side: BorderSide(color: Colors.blueAccent)),
        ),
        child: Text(
          'Donate',
          style: TextStyle(
            color: Colors.blueAccent,
            fontSize: 17.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'Roboto',
          ),
        ),
        onPressed: () async {
          print('Donate Button Pressed');

          try {
            /// This is the RazorPay Payment Pages onBoarding link
            await launch('https://rzp.io/l/07jOWBiE');
          } catch (e) {
            showDialog(
                context: context,
                builder: (_) => AlertDialog(
                  backgroundColor: const Color.fromRGBO(28, 40, 51, 0.6),
                  elevation: 5.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40.0),
                  ),
                  title: Center(
                    child: Text(
                      'Unknown Error Occurred',
                      style: TextStyle(
                        color: Colors.redAccent,
                        fontSize: 19.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Roboto',
                      ),
                    ),
                  ),
                  content: Center(
                    child: Text(
                      'Make sure your internet is connected properly',
                      style: TextStyle(
                        color: Colors.orangeAccent,
                        fontSize: 17.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Roboto',
                      ),
                    ),
                  ),
                ));
          }
        },
      ),
    );
  }
}
