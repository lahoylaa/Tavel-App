import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'home.dart';
import 'signup.dart';
import 'server.dart';

void main() async {
  runApp(const MaterialApp(
    title: 'Navigation Basics',
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    final myEmailController = TextEditingController();
    final myPasswordController = TextEditingController();

    @override
    void dispose() {
      myEmailController.dispose();
      myPasswordController.dispose();
      super.dispose();
    }

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Travel App',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              )),
          backgroundColor: Colors.blue,
          centerTitle: true,
        ),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Login',
                style: TextStyle(
                    fontSize: 35,
                    color: Colors.blue,
                    fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 30),
                child: Form(
                    child: Column(children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      controller: myEmailController,
                      decoration: const InputDecoration(
                        labelText: 'Email',
                        hintText: 'Enter email',
                        prefixIcon: Icon(Icons.email),
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (String value) {},
                      validator: (value) {
                        return value!.isEmpty ? 'Please enter email' : null;
                      },
                    ),
                  ),

                  const SizedBox(
                    height: 15,
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: TextFormField(
                      keyboardType: TextInputType.visiblePassword,
                      controller: myPasswordController,
                      decoration: const InputDecoration(
                        labelText: 'Password',
                        hintText: 'Enter password',
                        prefixIcon: Icon(Icons.password),
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (String value) {},
                      validator: (value) {
                        return value!.isEmpty ? 'Please enter password' : null;
                      },
                    ),
                  ),

                  const SizedBox(
                    height: 15,
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 35),
                    child: MaterialButton(
                      minWidth: double.infinity,
                      onPressed: () async {
                        // /* Test code */
                        final userAuthentication =
                            await MongoDatabase.getUserAuthentication(
                                myEmailController.text);

                        if (userAuthentication != null) {
                          // compare user entry
                          if ((myEmailController.text ==
                                  userAuthentication["email"]) &&
                              (myPasswordController.text ==
                                  userAuthentication["password"])) {
                            // Add code here
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (BuildContext context) {
                                  return Home();
                                },
                              ),
                              (route) => false,
                            );
                          } else {
                            /* Output when a invalid entry is made */
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return const AlertDialog(
                                      content: Text(
                                    'Invalid email or password',
                                    textAlign: TextAlign.center,
                                  ));
                                });
                          }
                        }
                      },
                      color: Colors.blue,
                      textColor: Colors.white,
                      child: const Text('Login'),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 35),
                    child: GestureDetector(
                        onTap: () {
                          // Add code here
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) {
                                return Signup();
                              },
                            ),
                            (route) => false,
                          );
                        },
                        child: Text('Create an account')),
                  ),

                  /* Debuggin Server */
                  // Padding(
                  //   padding: const EdgeInsets.all(10),
                  //   child: MaterialButton(
                  //     minWidth: double.infinity,
                  //     onPressed: (){
                  //       /* Test code */
                  //       //MongoDatabase.connect();
                  //       MongoDatabase.sendData();
                  //      // MongoDatabase.close();
                  //     },

                  //     color: Colors.red,
                  //     textColor: Colors.black,
                  //     child: const Text('Press This'),
                  //   )
                  // ),
                ])),
              ),
            ]),
      ),
    );
  }
}
