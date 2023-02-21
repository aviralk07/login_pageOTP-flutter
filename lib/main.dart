// ignore_for_file: unnecessary_new

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'otp.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: const MyHome(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  TextEditingController phoneController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController countrycode = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    countrycode.text = "+91";
    super.initState();
  }

  bool? isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.only(right: 20, left: 20),
        padding: EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: Column(
          children: [
            Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.3,
                  child: Container(
                    margin: EdgeInsets.only(top: 10),
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    child: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: 10),
                          height: 50,
                          child: Row(
                            children: [
                              Image.asset('assets/calling.png'),
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
                                  "Enter Phone Number",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                                Text(
                                    "Please use your current number or your GoClip registered number."),
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
                          SizedBox(height: 20),
                          Container(
                            margin: EdgeInsets.only(left: 20),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Phone Number',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 20, right: 20),
                            height: 55,
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 1,
                                color: Colors.white,
                              ),
                            ),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 60,
                                  child: TextField(
                                    controller: countrycode,
                                    decoration: InputDecoration(
                                      filled: true, //<-- SEE HERE
                                      fillColor:
                                          Color.fromARGB(255, 237, 235, 242),
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: Form(
                                    key: _formKey,
                                    child: TextFormField(
                                      controller: phoneController,
                                      keyboardType: TextInputType.phone,
                                      onChanged: (value) {
                                        _formKey.currentState?.validate();
                                      },
                                      validator: (value) {
                                        // if (value?.length == 0) {
                                        //   return 'Please enter mobile number';
                                        // } else if (!regExp.hasMatch(value!)) {
                                        //   return 'Please enter valid mobile number';
                                        // }
                                        // return null;
                                        if (value!.isEmpty) {
                                          return "Please Enter a phone number";
                                        } else if (!RegExp(
                                                r'(^(?:[+0]9)?[0-9]{10,10}$)')
                                            .hasMatch(value)) {
                                          return "Please Enter a valid phone number";
                                        }
                                      },
                                      decoration: InputDecoration(
                                          filled: true, //<-- SEE HERE
                                          fillColor: Color.fromARGB(
                                              255, 237, 235, 242),
                                          border: InputBorder.none,
                                          hintText: "Phone"),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 140,
                ),
                Container(
                  margin: EdgeInsets.only(left: 20, right: 20),
                  child: Row(
                    children: [
                      Checkbox(
                          value: isChecked,
                          onChanged: (newBool) {
                            setState(() {
                              isChecked = newBool;
                            });
                          }),
                      Text(
                        'Yes, I want to receive important updates vie Whatsapp',
                        style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                            color: Colors.black),
                      )
                    ],
                  ),
                )
              ],
            ),
            SizedBox(height: 20),
            SizedBox(
                width: 150,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => OTP()),
                    );
                  },
                  style: ButtonStyle(
                    overlayColor: MaterialStateProperty.resolveWith<Color?>(
                      (Set<MaterialState> states) {
                        if (states.contains(MaterialState.pressed))
                          return Colors.lightBlue; //<-- SEE HERE
                        return null; // Defer to the widget's default.
                      },
                    ),
                  ),
                  child: const Text(
                    'Get OTP',
                    style: TextStyle(fontSize: 15),
                  ),
                ))
          ],
        ),
      ),
    ));
  }
}
