import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../authenticationscreen/signinscreen.dart';
import '../authenticationscreen/signupscreen.dart';

class GetStarted extends StatefulWidget {
  const GetStarted({super.key});

  @override
  State<GetStarted> createState() => _GetStartedState();
}

class _GetStartedState extends State<GetStarted> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/Frame 5.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'BarterIt',
                      style: GoogleFonts.outfit(
                        color: Colors.white,
                        fontSize: 56,
                        decoration: TextDecoration.none,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignInScreen(),
                          ),
                        );
                      },
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.black, backgroundColor: Colors.white, disabledForegroundColor: Colors.grey.withOpacity(0.38),
                        minimumSize: const Size.fromHeight(50),
                      ),
                      child: const Text("Log in"),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignUpScreen(),
                            // const MyHomePage(title: 'title'),
                          ),
                        );
                      },
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.black, backgroundColor: Colors.white.withOpacity(0.6), disabledForegroundColor: Colors.grey.withOpacity(0.38),
                        minimumSize: const Size.fromHeight(50),
                      ),
                      child: const Text("Sign up"),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
