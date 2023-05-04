import 'package:expenses_app/services/auth.dart';
import 'package:expenses_app/widgets/text_field/text_field.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  void loginWithEmailAndPassword(String email, String password) {
    if (email.isNotEmpty && password.isNotEmpty) {
      Auth.signInWithEmailAndPassword(email, password);
    }
  }

  @override
  Widget build(BuildContext context) {
    var color = Theme.of(context).colorScheme;
    var text = Theme.of(context).textTheme;

    TextEditingController _emailController = TextEditingController();
    TextEditingController _passwordController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text("Login")),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            CustomTextField(
              controller: _emailController,
              hint: "email",
              inputType: TextInputType.emailAddress,
            ),
            const SizedBox(
              height: 30,
            ),
            CustomTextField(
              controller: _passwordController,
              hint: "password",
              isPasswordField: true,
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton.icon(
              onPressed: () => loginWithEmailAndPassword(
                _emailController.text,
                _passwordController.text,
              ),
              icon: const Icon(FontAwesomeIcons.doorOpen),
              label: Text(
                "Login",
                style: text.bodySmall!.copyWith(color: color.onPrimary),
              ),
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(color.primary),
                iconColor: MaterialStateProperty.all<Color>(color.onPrimary),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            RichText(
              text: TextSpan(
                children: [
                  const TextSpan(text: "Don't have an account? "),
                  TextSpan(
                    text: "Join now",
                    style: text.bodySmall!.copyWith(color: color.primary),
                  ),
                ],
              ),
            ),
            Text(
              "or",
              style: text.bodyMedium,
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton.icon(
              onPressed: null,
              icon: const Icon(FontAwesomeIcons.google),
              label: const Text("Login with Google"),
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(color.primary),
              ),
            )
          ],
        ),
      ),
    );
  }
}
