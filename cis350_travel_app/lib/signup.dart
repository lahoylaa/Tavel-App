import 'package:flutter/material.dart';
import 'Home.dart';

/// ***************
/// FIX: Need to add password verification before routing 
/// FIX: Add storing of information to database
///****************

/* Class to create the sign up page of application */
class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  _mySignupState createState() => _mySignupState();
}

/* Subclass for functionality of the sign up page */
class _mySignupState extends State<Signup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /* Appbar UI */
      appBar: AppBar(
        title: const Text('Travel App',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            )),
        backgroundColor: Color.fromARGB(255, 37, 55, 209),
        centerTitle: true,
      ),

      /* Use function to center page */
      body: const SignupForm(),
    );
  }
}

/* Extended class for UI of the sign up page */
class SignupForm extends StatelessWidget {
  const SignupForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        /* Title */
        const SizedBox(height: 100),
        const Text('Sign Up',
            style: TextStyle(
              fontSize: 35,
              color: Color.fromARGB(255, 37, 55, 209),
              fontWeight: FontWeight.bold,
            )),

            /* Spacing */
        const SizedBox(height: 20),

        /* Prompt name */
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: TextField(
            decoration: InputDecoration(
              labelText: 'Name',
              border: OutlineInputBorder(),
            ),
          ),
        ),

        /* Spacing */
        const SizedBox(height: 20),

        /* Prompt email */
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: TextField(
            decoration: InputDecoration(
              labelText: 'Email',
              border: OutlineInputBorder(),
            ),
          ),
        ),

        /* Spacing */
        const SizedBox(height: 20),

        /* Prompt password */
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: TextField(
            decoration: InputDecoration(
              labelText: 'Password',
              border: OutlineInputBorder(),
            ),
          ),
        ),

        /* Spacing */
        const SizedBox(height: 20),

        /* Prompt password again*/
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: TextField(
            decoration: InputDecoration(
              labelText: 'Re-enter Password',
              border: OutlineInputBorder(),
            ),
          ),
        ),

        /* Spacing */
        const SizedBox(height: 20),

        /* Button UI */
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: MaterialButton(
              minWidth: 300,
              color: Color.fromARGB(255, 37, 55, 209),
              textColor: Colors.white,
              child: const Text('Create an Account'),
              onPressed: () {
                /* Route page to Home() */
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      return const Home();
                    },
                  ),
                  (route) => false,
                );
              },
            ))
      ],
    ));
  }
}
