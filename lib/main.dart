import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueGrey.shade900),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isSignIn = false;
  checkSignIn() {
    setState(() {
      isSignIn == true ? isSignIn = false : isSignIn = true;

      print(isSignIn);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height * .5,
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fitWidth,
            image: AssetImage('assets/images/building_bg.jpg'),
          ),
        ),
      ),
      bottomSheet: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(30),
          width: double.infinity,
          height: isSignIn
              ? MediaQuery.of(context).size.height * .7
              : MediaQuery.of(context).size.height * .6,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(10),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              isSignIn
                  ? RichText(
                      text: TextSpan(
                          text: 'Register\n',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.blueGrey.shade900,
                          ),
                          children: [
                            TextSpan(
                              text: 'Register your account',
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                color: Colors.blueGrey.shade900,
                              ),
                            ),
                          ]),
                    )
                  : RichText(
                      text: TextSpan(
                          text: 'WELLCOME\n',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.blueGrey.shade900,
                          ),
                          children: [
                            TextSpan(
                              text: 'Please log in to access your account',
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                color: Colors.blueGrey.shade900,
                              ),
                            ),
                          ]),
                    ),
              const SizedBox(height: 10),
              TextFormField(
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(15),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                  hintText: 'E-mail or username',
                  hintStyle: TextStyle(
                    fontSize: 14,
                    color: Colors.blueGrey.shade900,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              isSignIn
                  ? TextFormField(
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(15),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                        hintText: 'Full name',
                        hintStyle: TextStyle(
                          fontSize: 14,
                          color: Colors.blueGrey.shade900,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    )
                  : Container(),
              const SizedBox(height: 10),
              TextFormField(
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(15),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                  hintText: 'Password',
                  hintStyle: TextStyle(
                    fontSize: 14,
                    color: Colors.blueGrey.shade900,
                    fontWeight: FontWeight.w400,
                  ),
                  suffixIcon: const Icon(Icons.remove_red_eye_rounded),
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Checkbox(
                        value: true,
                        onChanged: (value) {},
                      ),
                      Text('Remember me'),
                    ],
                  ),
                  Text('Forgot you Password'),
                ],
              ),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: FilledButton(
                  style: ButtonStyle(),
                  onPressed: () {},
                  child: Text('Log in'),
                ),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      padding: const EdgeInsets.all(5),
                      color: Colors.white10,
                      child: Text('or continue with')),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FilledButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateColor.resolveWith(
                          (states) => Colors.white),
                    ),
                    onPressed: () {},
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/images/google.png',
                          scale: 2,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 10),
                  FilledButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateColor.resolveWith(
                          (states) => Colors.white),
                    ),
                    onPressed: () {},
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/images/facebook.png',
                          scale: 2,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Center(
                child: InkWell(
                  onTap: () => checkSignIn(),
                  child: RichText(
                    text: TextSpan(
                      text: 'Not a member?',
                      style: TextStyle(
                        color: Colors.blueGrey.shade900,
                      ),
                      children: [
                        TextSpan(
                          text: ' Sign in',
                          style: TextStyle(
                            color: Colors.blueGrey.shade900,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
