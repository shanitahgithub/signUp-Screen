import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _ValidatedRegistrationPageState();
}

class _ValidatedRegistrationPageState extends State<SignupPage> {
  //password visibility state property
  bool _isObsecure = true;
  //Adding text editing controllers
  final _emailAddressController = TextEditingController();
  final _usernameController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  //ontap detector for textspan in rich text
  late TapGestureRecognizer _tapGestureRecognizer;

  //form key for state management
  final _formKey = GlobalKey<FormState>();

  GestureTapCallback? get _handleOntap => null;

  @override
  void initState() {
    super.initState();
    _tapGestureRecognizer = TapGestureRecognizer()..onTap = _handleOntap;
  }

  @override
  void dispose() {
    _tapGestureRecognizer.dispose();
    super.dispose();
  }

  // void _handleOntap() {
  //   Get.to(const ValidatedLoginPage());
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0), //padding left,right,top & bottom
        child: SafeArea(
          child: SingleChildScrollView(
            //enables its children to scroll
            child: Column(
              //layout to allow children widgets to be aligned vertically
              children: [
                //margin/spacing at the top
                const SizedBox(height: 20.0),
                //App logo
                Center(
                    child: Image.asset(
                  'assets/images/logo.png',
                  height: 100.0,
                )),
                const Text(
                  "Create a new account",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10.0),

                //form widget for registration
                Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        //Username text form field
                        TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          controller: _usernameController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "The username is required";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              border: const OutlineInputBorder(),
                              labelText: "Username",
                              prefixIcon: const Icon(Icons.account_box,
                                  color: Colors.green),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide:
                                      const BorderSide(color: Colors.green))),
                        ),
                        const SizedBox(height: 30.0),
                        //Email address text form field
                        TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          controller: _emailAddressController,
                          validator: (value) {
                            //ensuring that the email address is not null
                            if (value == null || value.isEmpty) {
                              return "The email address is required"; //flutter automatically handles the
                              //display of the error messages
                            }
                            //ensuring that the email address is of a right format
                            if (!RegExp(
                                    r"^[a-zA-Z0-9._]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                .hasMatch(value)) {
                              return "Enter a valid email address";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              border: const OutlineInputBorder(),
                              labelText: "Email Address",
                              prefixIcon:
                                  const Icon(Icons.email, color: Colors.green),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide:
                                      const BorderSide(color: Colors.green))),
                        ),
                        const SizedBox(height: 30.0),
                        //Phone number text form field
                        TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          controller: _phoneNumberController,
                          validator: (value) {
                            //ensuring that the email address is not null
                            if (value == null || value.isEmpty) {
                              return "The phone number is required"; //flutter automatically handles the
                              //display of the error messages
                            }
                            //ensuring that the phone number contains only 10 digits
                            if (!RegExp(r"^[0-9]{10}$").hasMatch(value)) {
                              return "Enter a valid 10-digit phone number";
                            }
                          },
                          decoration: InputDecoration(
                              border: const OutlineInputBorder(),
                              labelText: "Phone number",
                              prefixIcon:
                                  const Icon(Icons.phone, color: Colors.green),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide:
                                      const BorderSide(color: Colors.green))),
                        ),
                        const SizedBox(height: 30.0),
                        //Password form field
                        TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          controller: _passwordController,
                          validator: (value) {
                            //ensuring that the password is not null
                            if (value == null || value.isEmpty) {
                              return "The password is required"; //flutter automatically handles the
                              //display of the error messages
                            }
                            //ensuring that the password length is not short
                            if (value.length < 6) {
                              return "The password is too short";
                            }
                            return null;
                          },
                          obscureText: _isObsecure,
                          decoration: InputDecoration(
                              border: const OutlineInputBorder(),
                              labelText: "Password",
                              prefixIcon:
                                  const Icon(Icons.lock, color: Colors.green),
                              suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      _isObsecure = !_isObsecure;
                                    });
                                  },
                                  icon: _isObsecure
                                      ? const Icon(Icons.visibility)
                                      : const Icon(Icons.visibility_off)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide:
                                      const BorderSide(color: Colors.green))),
                        ),
                        const SizedBox(height: 30.0),
                        //Confirm Password form field
                        TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          controller: _confirmPasswordController,
                          validator: (value) {
                            //ensuring that the password is not null
                            if (value == null || value.isEmpty) {
                              return "The password is required"; //flutter automatically handles the
                              //display of the error messages
                            }
                            //ensuring that the passwords math
                            if (value != _passwordController.text) {
                              return "The passwords don't match";
                            }
                            return null;
                          },
                          obscureText: _isObsecure,
                          decoration: InputDecoration(
                              border: const OutlineInputBorder(),
                              labelText: "Confirm Password",
                              prefixIcon:
                                  const Icon(Icons.lock, color: Colors.green),
                              suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      _isObsecure = !_isObsecure;
                                    });
                                  },
                                  icon: _isObsecure
                                      ? const Icon(Icons.visibility)
                                      : const Icon(Icons.visibility_off)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide:
                                      const BorderSide(color: Colors.green))),
                        ),
                        const SizedBox(height: 30.0),

                        //Login button
                        GestureDetector(
                          onTap: () {
                            //ensuring form fields are  validated before form submission
                            if (_formKey.currentState?.validate() ?? false) {
                              print("Form submitted");
                            } else {
                              print("Form has errors");
                            }
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            padding: const EdgeInsets.symmetric(
                                vertical: 15.0, horizontal: 50.0),
                            decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(10.0)),
                            child: const Center(
                              child: Text(
                                "Register",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 18.0),
                        //Adding login text
                        RichText(
                            text: TextSpan(
                                text: "Already have an account ? ",
                                style: const TextStyle(color: Colors.black),
                                children: [
                              TextSpan(
                                  text: "Login here",
                                  style: const TextStyle(color: Colors.green),
                                  //adding gesture detection on login here text
                                  recognizer: _tapGestureRecognizer),
                            ])),
                        const SizedBox(height: 18.0),
                      ],
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
