import 'package:flutter/material.dart';
import 'home.dart';
import 'server.dart';

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
      resizeToAvoidBottomInset: false,
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
    /* Variables for user input */
    final myNameController = TextEditingController();
    final myEmailController = TextEditingController();
    final myPasswordController = TextEditingController();
    final myRePasswordController = TextEditingController();

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
              color: Colors.blue,
              fontWeight: FontWeight.bold,
            )),

            /* Spacing */
        const SizedBox(height: 20),

        /* Prompt name */
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: TextFormField(
            keyboardType: TextInputType.name,
            controller: myNameController,
            decoration: const InputDecoration(
              labelText: 'Name',
              border: OutlineInputBorder(),
            ),
            onChanged: (String value) {},
            validator: (value) {
              return value!.isEmpty ? 'Please enter name' : null;
            },
          ),
        ),

        /* Spacing */
        const SizedBox(height: 20),

        /* Prompt email */
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: TextFormField(
            keyboardType: TextInputType.emailAddress,
            controller: myEmailController,
            decoration: const InputDecoration(
              labelText: 'Email',
              border: OutlineInputBorder(),
            ),
            onChanged: (String value) {},
            validator: (value) {
              return value!.isEmpty ? 'Please enter email' : null;
            },
          ),
        ),

        /* Spacing */
        const SizedBox(height: 20),

        /* Prompt password */
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: TextFormField(
            keyboardType: TextInputType.visiblePassword,
            controller: myPasswordController,
            decoration: const InputDecoration(
              labelText: 'Password',
              border: OutlineInputBorder(),
            ),
            onChanged: (String value) {},
            validator: (value) {
              return value!.isEmpty ? 'Please enter password' : null;
            },
          ),
        ),

        /* Spacing */
        const SizedBox(height: 20),

        /* Prompt password again*/
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: TextFormField(
            keyboardType: TextInputType.visiblePassword,
            controller: myRePasswordController,
            decoration: const InputDecoration(
              labelText: 'Re-enter Password',
              border: OutlineInputBorder(),
            ),
            onChanged: (String value) {},
            validator: (value) {
              return value!.isEmpty ? 'Please re-enter email' : null;
            },
          ),
        ),

        /* Spacing */
        const SizedBox(height: 20),

        /* Button UI */
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: MaterialButton(
              minWidth: double.infinity,
              color: Colors.blue,
              textColor: Colors.white,
              child: const Text('Create an Account'),
              onPressed: () async {
                /* Route page to Home() once information in database*/
                if (myPasswordController.text == myRePasswordController.text) {
                  await MongoDatabase.sendUserAuthentication(myNameController.text, myEmailController.text, myPasswordController.text);
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) {
                        return const Home();
                      },
                    ),
                    (route) => false,
                  );
                }
                else {
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
              },
            ))
      ],
    ));
  }
}
