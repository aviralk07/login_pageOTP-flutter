import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

import 'main.dart';

class OTP extends StatefulWidget {
  const OTP({super.key});

  @override
  State<OTP> createState() => _OTPState();
}

class _OTPState extends State<OTP> {
  bool? isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyHome()),
                  );
                },
                color: Colors.black,
              ),
            ),
            Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.2,
                  child: Container(
                    margin: EdgeInsets.only(top: 0),
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: 10),
                          height: 50,
                          child: Row(
                            children: [
                              Image.asset('assets/message.png'),

                              // Icon(
                              //   Icons.sms_failed_outlined,
                              //   size: 40,
                              // ),
                            ],
                          ),
                        ),
                        // Container(
                        //   margin: EdgeInsets.only(right: 20),
                        //   height: 50,
                        //   width: 50,
                        //   decoration: BoxDecoration(
                        //       borderRadius: BorderRadius.circular(50),
                        //       color: Color.fromARGB(255, 113, 8, 8)),
                        // ),
                        Expanded(
                          child: Container(
                            height: 70,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  "Enter OTP",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                                Text("we have sent it to this number"),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Stack(
                  children: [
                    Container(
                      height: 125,
                      width: 325,
                      decoration: BoxDecoration(
                        border:
                            Border.all(width: 2, color: Colors.grey.shade300),
                        borderRadius: BorderRadius.all(Radius.circular(0)),
                      ),
                      child: Column(
                        children: [
                          SizedBox(height: 30),
                          OtpTextField(
                            numberOfFields: 5,
                            borderColor: Color.fromARGB(255, 12, 12, 14),
                            //set to true to show as box or false to show as dash
                            showFieldAsBox: true,
                            //runs when a code is typed in
                            onCodeChanged: (String code) {
                              //handle validation or checks here
                            },
                            //runs when every textfield is filled
                            onSubmit: (String verificationCode) {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: Text("Verification Code"),
                                      content: Text(
                                          'Code entered is $verificationCode'),
                                    );
                                  });
                            }, // end onSubmit
                          ),
                          SizedBox(height: 20),
                          Text(
                            '00:00',
                            style: TextStyle(color: Colors.lightBlue),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Resend OTP',
                      style: TextStyle(color: Colors.grey),
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    Text(
                      '|',
                      style: TextStyle(color: Colors.lightBlue),
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    Text(
                      ' OTP via Call',
                      style: TextStyle(color: Colors.grey),
                    )
                  ],
                ),
                SizedBox(
                  height: 140,
                ),
              ],
            ),
            SizedBox(
                width: 100,
                height: 40,
                child: ElevatedButton(onPressed: () {}, child: Text('Confirm')))
          ],
        ),
      ),
    ));
  }
}
