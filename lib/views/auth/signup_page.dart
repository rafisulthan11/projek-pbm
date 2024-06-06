import 'package:flutter/material.dart';
import 'package:flutter_perlinda/views/auth/login_page.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF4682A9),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Stack to overlay logo and circle
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      // Circle
                      Container(
                        margin: EdgeInsets.only(top: 20.0),
                        width: 247.0,
                        height: 247.0,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xFF749BC2),
                        ),
                      ),
                      // Logo
                      Positioned(
                        top: 50.0, // Adjust the top position
                        child: Container(
                          width: 192.0,
                          height: 188.0,
                          child: Image.asset(
                            'images/logo_perlinda.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10.0), // Spacing

                  // Sign up form with rounded container
                  Container(
                    width: 430.0, // Adjust width as needed
                    height: 600.0, // Adjust height as needed to accommodate the new button
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // "Sign Up" text
                          Center(
                            child: Text(
                              'Buat akun barumu',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0, // Adjust the font size
                                color: Color(0xFF00355C), // Adjust the text color
                              ),
                            ),
                          ),
                          const SizedBox(height: 30.0), // Spacing

                          // Nama Lengkap text
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 5.0), // Adjust the left padding
                              child: Text(
                                'Nama Lengkap',
                                style: TextStyle(
                                  fontSize: 16.0, // Adjust the font size
                                  fontWeight: FontWeight.bold, // Make the text bold
                                  color: Color(0xFF00355C), // Adjust the text color
                                ),
                              ),
                            ),
                          ),

                          // SizedBox for spacing between Nama Lengkap text and field
                          SizedBox(height: 12.0),

                          // Nama Lengkap field
                          TextFormField(
                            controller: _emailController,
                            decoration: const InputDecoration(
                              labelText: 'Masukkan nama lengkap',
                              border: InputBorder.none,
                              fillColor: Color(0xFFC1D9F1),
                              filled: true,
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Masukkan nama lengkap anda';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 15.0), // Spacing

                          // Alamat Email text
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 5.0), // Adjust the left padding
                              child: Text(
                                'Alamat Email',
                                style: TextStyle(
                                  fontSize: 16.0, // Adjust the font size
                                  fontWeight: FontWeight.bold, // Make the text bold
                                  color: Color(0xFF00355C), // Adjust the text color
                                ),
                              ),
                            ),
                          ),

                          // SizedBox for spacing between Alamat Email text and field
                          SizedBox(height: 12.0),

                          // Alamat Email field
                          TextFormField(
                            controller: _passwordController,
                            obscureText: true,
                            decoration: const InputDecoration(
                              labelText: 'Masukkan alamat email',
                              border: InputBorder.none,
                              fillColor: Color(0xFFC1D9F1),
                              filled: true,
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Masukkan email anda';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 15.0), // Spacing
                          
                          // Kata Sandi text
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 5.0), // Adjust the left padding
                              child: Text(
                                'Kata Sandi',
                                style: TextStyle(
                                  fontSize: 16.0, // Adjust the font size
                                  fontWeight: FontWeight.bold, // Make the text bold
                                  color: Color
                                                                  (0xFF00355C), // Adjust the text color
                                ),
                              ),
                            ),
                          ),
                           SizedBox(height: 12.0),

                          // Kata Sandi field
                          TextFormField(
                            controller: _passwordController,
                            obscureText: true,
                            decoration: const InputDecoration(
                              labelText: 'Masukkan kata sandi',
                              border: InputBorder.none,
                              fillColor: Color(0xFFC1D9F1),
                              filled: true,
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Masukkan kata sandi anda';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 45.0), // Spacing

                          // Sign Up button
                          ElevatedButton(
                            onPressed: () {
                              // Validate form before attempting sign up
                              if (_formKey.currentState!.validate()) {
                                // Handle sign up logic here
                                // e.g., create a new account or navigate to another page
                                print('Nama Lengkap: ${_emailController.text}');
                                print('Alamat Email: ${_passwordController.text}');
                                // Show a success message or navigate to the next screen
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text(''),
                                  ),
                                );

                                // Navigate to LoginPage
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => LoginPage()),
                                );
                              }
                            },
                            child: SizedBox(
                              width: 391.0, // Set the width
                              height: 55.0, // Set the height
                              child: Center(
                                child: const Text(
                                  'Buat akun',
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFF4682A9),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ),
                          const SizedBox(height: 15.0),
                          InkWell(
                            onTap: () {
                              //Navigasi ke halaman LoginPage
                              Navigator.push(
                                context, MaterialPageRoute(builder: (context) => LoginPage()),
                              );
                            },
                            child: Text(
                              'Sudah punya akun? Langsung',
                              style: TextStyle(
                                fontWeight: FontWeight.normal,
                              ),
                            )
                          ),
                          InkWell(
                            onTap: () {
                              //Navigasi ke halaman LoginPage
                              Navigator.push(
                                context, MaterialPageRoute(builder: (context) => LoginPage())
                              );
                            },
                            child: Text(
                              'Masuk',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                // Misalnya, kamu juga bisa menambahkan warna teks atau gaya lainnya di sini
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

