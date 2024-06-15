import 'package:cis350_travel_app/signup.dart';
import 'package:flutter/material.dart';
import 'home.dart';
import 'server.dart';

/* Setup main to run applicaiton */
void main() async {
  runApp(const MaterialApp(
    title: 'Navigation Basics',
    home: MyApp(),
  ));
}

/* Class to create login page of application */
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

/* Subclass made to create the functionality of the login page */
class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    /* Variables for user input */
    final myEmailController = TextEditingController();
    final myPasswordController = TextEditingController();

    /* This override clears the user input */
    @override
    void dispose() {
      myEmailController.dispose();
      myPasswordController.dispose();
      super.dispose();
    }

    /* Output of the class to the application */
    return MaterialApp(
      home: Scaffold(
        /* Appbar UI  */
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

        /* Login UI */
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

              /* Email input UI and user input */
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

                  /* Spacing */
                  const SizedBox(
                    height: 15,
                  ),

                  /* Password input UI and user input */
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

                  /* Spacing */
                  const SizedBox(
                    height: 15,
                  ),

                  /* Login Button UI */
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 35),
                    child: MaterialButton(
                      minWidth: double.infinity,
                      color: Colors.blue,
                      textColor: Colors.white,
                      child: const Text('Login'),
                      onPressed: () async {
                        /* Filter through database */
                        final userAuthentication =
                            await MongoDatabase.getUserAuthentication(
                                myEmailController.text);

                        /* Error checking for empty database */
                        if (userAuthentication != null) {
                          // compare user entry too database
                          if (
                              (myEmailController.text == userAuthentication["email"]) && (myPasswordController.text ==
                                  userAuthentication["password"])) {
                            /* Routes the page to the Home page */
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (BuildContext context) {
                                  return const Home();
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
                                    'Password Incorrect',
                                    textAlign: TextAlign.center,
                                  ));
                                });
                          }
                        }
                        // } else {
                        //   /* Output when a invalid entry is made */
                        //   showDialog(
                        //       context: context,
                        //       builder: (context) {
                        //         return const AlertDialog(
                        //             content: Text(
                        //           'Invalid email or password',
                        //           textAlign: TextAlign.center,
                        //         ));
                        //       });
                        // }
                      },
                    ),
                  ),

                  /* Create an Account UI and Routing to Sign Up Page*/
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 35),
                    child: GestureDetector(
                      child: const Text('Create an account'),
                      onTap: () {
                        /* Route to Sign Up Page */
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) {
                              return const Signup();
                              //return const Food();
                            },
                          ),
                          (route) => false,
                        );
                      },
                    ),
                  ),
                ])),
              ),
            ]),
      ),
    );
  }
}
