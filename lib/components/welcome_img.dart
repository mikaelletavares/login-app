import 'package:flutter/material.dart';

class WelcomeImg extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Image(
        width: 200,
        height: 200,
        image: NetworkImage(
            "https://img.freepik.com/vetores-premium/uma-mulher-segurando-um-telefone-celular-com-uma-tela-em-branco_763672-180.jpg"));
  }
}
