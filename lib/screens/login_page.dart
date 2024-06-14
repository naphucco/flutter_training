import 'package:control_style/control_style.dart';
import 'package:flutter/material.dart';
import 'package:my_project_name/screens/selection_module_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _login() {
    if (_formKey.currentState!.validate()) {
      // Navigate to SelectionModuleScreen
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const SelectionModuleScreen(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/login_bg.png"), // Your background image asset
                fit: BoxFit.cover, // Make sure the image covers the whole container
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Theme(
                data: Theme.of(context).copyWith(
                  // use https://pub.dev/packages/control_style/install
                  // to add shadow not effect validator text
                  inputDecorationTheme: InputDecorationTheme(
                    filled: true, // Fill the background with color
                    fillColor: Colors.white, // Set the fill color to white
                    border: DecoratedInputBorder(
                      child: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      ),
                      shadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                  ),
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const SizedBox(
                          height: 150.0,
                          child: Text(
                            'Login',
                            style: TextStyle(
                              fontFamily: 'Roboto', // Replace with your desired font family
                              fontSize: 60.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              shadows: [
                                Shadow(
                                  offset: Offset(1, 1),
                                  blurRadius: 20,
                                  color: Color.fromARGB(40, 0, 0, 0),
                                ),
                              ],
                            ),
                          )),
                      _buildFormField(
                        controller: _usernameController,
                        hintText: 'Enter your username',
                        icon: Icons.person,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your username';
                          }
                          return null;
                        },
                      ),
                      _buildFormField(
                        controller: _passwordController,
                        hintText: 'Enter your password',
                        icon: Icons.lock,
                        obscureText: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 10),
                      // Gradient login button
                      Container(
                        width: 200,
                        height: 40,
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [Colors.cyan, Colors.blue],
                          ),
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: _login,
                            borderRadius: BorderRadius.circular(30),
                            child: const Center(
                              child: Text(
                                "Login",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )));
  }

  Widget _buildFormField({
    required TextEditingController controller,
    required String hintText,
    required IconData icon,
    bool obscureText = false,
    required String? Function(String?) validator,
  }) {
    return SizedBox(
      height: 80, // Fix heiht to make it not change, when show error
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0), // Adjust horizontal padding as needed
        child: TextFormField(
          controller: controller,
          decoration: InputDecoration(
            hintText: hintText,
            contentPadding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
            prefixIcon: Icon(icon),
          ),
          obscureText: obscureText,
          validator: validator,
        ),
      ),
    );
  }
}
