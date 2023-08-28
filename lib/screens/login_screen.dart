import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:primeiroprojetodio/screens/home_screen.dart';
import 'package:primeiroprojetodio/screens/register_screen.dart';
import 'package:primeiroprojetodio/utils/consts.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginScreenState();
  }
}

class _LoginScreenState extends State<LoginScreen> {
  // f45d27
  // f5851f

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Container(
            width: double.infinity,
            height: double.infinity,
            child: Image.network(
              'https://img.freepik.com/fotos-premium/uma-mulher-de-cabelo-rosa-e-ceu-azul-com-nuvens_950633-254.jpg?w=2000',
              width: double.infinity,
              height: 100,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 300,
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50)),
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  children: [
                    const TextField(
                      decoration: InputDecoration(
                        icon: Icon(Icons.email),
                        hintText: 'Email',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    const TextField(
                      decoration: InputDecoration(
                        icon: Icon(Icons.key),
                        hintText: 'Password',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    const Align(
                      alignment: Alignment.bottomRight,
                      child: Text('Forgot password?',
                          style: TextStyle(
                              color: Colors.black38,
                              decoration: TextDecoration.underline,
                              fontWeight: FontWeight.bold)),
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FloatingActionButton.extended(
                          heroTag: 'buttonSingIn',
                          backgroundColor: turquesaColor,
                          elevation: 0,
                          highlightElevation: 0,
                          label: const Text('SING IN'),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => HomeScreen(),
                              ),
                            );
                          },
                        ),
                        const SizedBox(
                          width: 10.0,
                        ),
                        FloatingActionButton.extended(
                          heroTag: 'buttonRegister',
                          foregroundColor: turquesaColor,
                          backgroundColor: Color.fromRGBO(255, 255, 255, 1),
                          elevation: 0,
                          highlightElevation: 0,
                          label: const Text(
                            'REGISTER',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => RegisterScreen(),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    const Text(
                      'or',
                      style: TextStyle(
                          color: Colors.black38, fontWeight: FontWeight.bold),
                    ),
                    const Divider(
                      thickness: 2,
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            _handleGoogleSignIn;
                          },
                          child: const ClipOval(
                            child: Image(
                                width: 60,
                                height: 60,
                                image: NetworkImage(
                                    "https://assets.materialup.com/uploads/82eae29e-33b7-4ff7-be10-df432402b2b6/preview")),
                          ),
                        ),
                        const SizedBox(
                          width: 15.0,
                        ),
                        GestureDetector(
                          onTap: () {
                            _handleFacebookLogin;
                          },
                          child: const ClipOval(
                            child: Image(
                                width: 60,
                                height: 60,
                                image: NetworkImage(
                                    "https://st2.depositphotos.com/1144386/7770/v/450/depositphotos_77705008-stock-illustration-original-round-blue-facebook-web.jpg")),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Future<void> _handleGoogleSignIn() async {
  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);

  try {
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
    if (googleUser != null) {
      print('Logged in: ${googleUser.displayName}');
      // Você pode usar as informações do usuário para autenticá-lo no seu backend.
    }
  } catch (error) {
    print('Erro no login: $error');
  }
}

Future<void> _handleFacebookLogin() async {
  try {
    final LoginResult result = await FacebookAuth.instance.login();
    if (result.status == LoginStatus.success) {
      final AccessToken accessToken = result.accessToken!;
      print('Logged in: ${accessToken.token}');
      // Use o accessToken para autenticar o usuário no seu backend.
    } else {
      print('Login falhou: ${result.message}');
    }
  } catch (error) {
    print('Erro no login: $error');
  }
}
