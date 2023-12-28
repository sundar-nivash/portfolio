import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutterweb/screens/homepage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

// ignore: camel_case_types
class contactMePage extends StatefulWidget {
  const contactMePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ContactMePageState createState() => _ContactMePageState();
}

class _ContactMePageState extends State<contactMePage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController messageController = TextEditingController();
  bool isLoading = false; // Track form submission loading state

  Future<void> _onSubmitPressed() async {
    if (_formKey.currentState?.validate() ?? false) {
      setState(() {
        isLoading = true;
      });

      bool success = await submitForm();

      setState(() {
        isLoading = false;
      });

      if (success) {
        nameController.text = "";
        emailController.text = "";
        messageController.text = "";
        Fluttertoast.showToast(msg: 'Form submitted successfully');
      } else {
        Fluttertoast.showToast(msg: 'Error submitting form');
      }
    }
  }

  Future<bool> submitForm() async {
    final Uri uri =
        Uri.parse('https://hook.eu2.make.com/tpidm04i7ero984ir9fn9garzj0phru0');
    final Map<String, String> formData = {
      'Name': nameController.text,
      'Email': emailController.text,
      'Message': messageController.text,
    };

    try {
      final response = await http.post(uri, body: formData);

      if (response.statusCode == 200) {
        if (kDebugMode) {
          print('Form submitted successfully');
        }
        return true;
      } else {
        if (kDebugMode) {
          print('Error submitting form: ${response.statusCode}');
        }
        return false;
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error: $e');
      }
      return false;
    }
  }

  bool isValidEmail(String email) {
    // You can use a regular expression for more comprehensive email validation
    return email.contains('@');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const HomePageView()));

              if (kDebugMode) {
                print('Contact text clickesdd!');
              }
            },
            child: const Text('Contact Me')),
        actions: [
          InkWell(
            onTap: () {
              // Handle "Work" action
              if (kDebugMode) {
                print('Work clicked');
              }
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const HomePageView()));
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Text(
                'Work',
                style: GoogleFonts.lexend(),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              // Handle "About" action
              if (kDebugMode) {
                print('About clicked');
              }
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Text(
                'About',
                style: GoogleFonts.lexend(),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              // Handle "Contact" action
              if (kDebugMode) {
                print('Contact clicked');
              }
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Text(
                'Contact',
                style: GoogleFonts.lexend(),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text("get in touch"),
            Center(
              child: Card(
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    gradient: LinearGradient(
                      colors: [
                        Color.fromARGB(255, 197, 228, 238),
                        Color.fromARGB(255, 196, 255, 211),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: 300,
                      width: 600,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              TextFormField(
                                controller: nameController,
                                decoration: const InputDecoration(
                                    labelText: 'Name', fillColor: Colors.white),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    print('name');
                                    return 'Please enter your name';
                                  }

                                  return null;
                                },
                              ),
                              TextFormField(
                                controller: emailController,
                                decoration:
                                    const InputDecoration(labelText: 'Email'),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your email';
                                  } else if (!isValidEmail(value)) {
                                    return 'Please enter a valid email address';
                                  }
                                  return null;
                                },
                              ),
                              TextFormField(
                                controller: messageController,
                                decoration:
                                    const InputDecoration(labelText: 'Message'),
                              ),
                              const SizedBox(height: 20),
                              ElevatedButton(
                                onPressed: isLoading
                                    ? null
                                    : () async => await _onSubmitPressed(),
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.resolveWith<Color>(
                                    (Set<MaterialState> states) {
                                      // Set different background colors based on button state
                                      if (states
                                          .contains(MaterialState.disabled)) {
                                        return Colors.grey; // Disabled color
                                      }
                                      return Colors.blue; // Default color
                                    },
                                  ),
                                  mouseCursor: MaterialStateProperty
                                      .resolveWith<MouseCursor>(
                                    (Set<MaterialState> states) {
                                      // Change the cursor on hover
                                      return states
                                              .contains(MaterialState.hovered)
                                          ? SystemMouseCursors.click
                                          : SystemMouseCursors.basic;
                                    },
                                  ),
                                ),
                                child: const Text(
                                  'Submit',
                                  style: TextStyle(
                                    fontSize: 16.0, // Set the font size
                                    fontWeight:
                                        FontWeight.bold, // Set the font weight
                                    color: Colors.white, // Set the text color
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
