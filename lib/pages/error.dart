import 'package:aplikasikos/pages/home.dart';
import 'package:aplikasikos/theme.dart';
import 'package:flutter/material.dart';


class ErrorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/error.png', width: 300,
              ),
              SizedBox(height: 70,),
              Text('Where are you going?', style: blackTextStyle.copyWith(
                fontSize: 24,),
              ),
              SizedBox(height: 14,),
              Text('Seems like the page that you were\nrequested is already gone',
              style: grayTextStyle.copyWith(
                fontSize: 16,),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 50,),
              Container(
                width: 218,
                height: 50,
                child: RaisedButton(
                  onPressed: (){
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context)=> HomePage(),
                        ),
                            (route) => false);
                  },
                  color: primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(17),
                  ),
                  child: Text('Back To Home', style: whiteTextStyle.copyWith(
                    fontSize: 18,
                  ),),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
