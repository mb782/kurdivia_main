import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:kurdivia/Screen/country.dart';
import 'package:kurdivia/constant.dart';
import 'package:kurdivia/provider/ApiService.dart';
import 'package:provider/provider.dart';

class Winners extends StatelessWidget implements ApiStatusLogin {
  Winners({Key? key}) : super(key: key);
  late BuildContext context;
  final phoneController = TextEditingController();
  final codeController = TextEditingController();
  String phone = '';

  @override
  Widget build(BuildContext context) {
    context.read<ApiService>();
    this.context = context;
    return Consumer<ApiService>(builder: (context, value, child) {
      value.apiListener(this);
      return SafeArea(
          child: Scaffold(
        body: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/1.jpg"),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.3,
                  left: MediaQuery.of(context).size.width * 0.37
                ),
              width: 140,
              height: 30,
              decoration:  BoxDecoration(
                  color: kLightBlue,
                  borderRadius:  BorderRadius.circular(30)
                   ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                //crossAxisAlignment:CrossAxisAlignment.center,
                children: [
                  const Center(
                      child: Image(
                        image: AssetImage('assets/images/share.png'),
                        height: 15,
                        width: 15,
                      ))
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                height: 450,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(30),
                        topLeft: Radius.circular(30))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const SizedBox(
                      child: Text(
                        'WINNERS ',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),

                    ),
                   Container(
                     height: 100,
                     width: 100,
                     child: Image.asset('assets/images/gift-box-with-a-bow.png'),
                   ),
                    ListView(
                      shrinkWrap: true,
                      children: [
                        Container(
                            height: 75,
                            width: MediaQuery.of(context).size.width * 0.8,
                            decoration: BoxDecoration(
                                color: Colors.pinkAccent,
                                borderRadius: BorderRadius.circular(30)),
                            child: Center(
                              child: Text('samuel el jack'),
                            )),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                            height: 75,
                            width: MediaQuery.of(context).size.width * 0.8,
                            decoration: BoxDecoration(
                                color: Colors.pinkAccent,
                                borderRadius: BorderRadius.circular(30)),
                            child: Center(
                              child: Text('antony hapkings'),
                            ))
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ));
    });
  }

  @override
  void accountAvailable() {
    // TODO: implement accountAvailable
  }

  @override
  void error() {
    // TODO: implement error
  }

  @override
  void inputEmpty() {
    // TODO: implement inputEmpty
  }

  @override
  void inputWrong() {
    // TODO: implement inputWrong
  }

  @override
  void login() {
    // TODO: implement login
  }

  @override
  void passwordWeak() {
    // TODO: implement passwordWeak
  }
}
