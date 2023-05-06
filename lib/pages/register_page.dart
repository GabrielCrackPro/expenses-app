import 'package:expenses_app/services/auth.dart';
import 'package:expenses_app/widgets/text_field/text_field.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var color = Theme.of(context).colorScheme;
    var text = Theme.of(context).textTheme;

    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    void createUserWithEmailAndPassword(String email, String password) {
      if (_formKey.currentState!.validate()) {
        Auth.createUserWithEmailAndPassword(context, email, password);
      }
    }

    return Scaffold(
      appBar: AppBar(title: const Text("Join")),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            Form(
              key: _formKey,
              child: Column(
                children: [
                  CustomTextField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please provide an email";
                      }
                      return null;
                    },
                    controller: emailController,
                    hint: "email",
                    inputType: TextInputType.emailAddress,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  CustomTextField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please provide a password";
                      }
                      return null;
                    },
                    controller: passwordController,
                    hint: "password",
                    isPasswordField: true,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  ElevatedButton.icon(
                    onPressed: () => createUserWithEmailAndPassword(
                      emailController.text,
                      passwordController.text,
                    ),
                    icon: const Icon(FontAwesomeIcons.plus),
                    label: Text(
                      "Create account",
                      style: text.bodySmall!.copyWith(color: color.onPrimary),
                    ),
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(color.primary),
                      iconColor:
                          MaterialStateProperty.all<Color>(color.onPrimary),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  RichText(
                    text: TextSpan(
                      children: [
                        const TextSpan(text: "Already have an account? "),
                        TextSpan(
                          text: "Log in",
                          style: text.bodySmall!.copyWith(color: color.primary),
                          recognizer: TapGestureRecognizer()
                            ..onTap =
                                () => GoRouter.of(context).goNamed("login"),
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
          ],
        ),
      ),
    );
  }
}
