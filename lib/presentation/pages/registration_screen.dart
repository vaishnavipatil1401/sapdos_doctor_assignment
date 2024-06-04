import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sapdos_assignment/presentation/pages/login_page.dart';
import '../../bloc/registration/registration_bloc.dart';
import '../../bloc/registration/registration_event.dart';
import '../../bloc/registration/registration_state.dart';
import '../../models/user.dart';
import '../widgets/custom_text_field.dart';
import '../../repositories/user_repository.dart';

class RegistrationScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => RegistrationBloc(userRepository: UserRepository()),
        child: LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth > 600) {
              return Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/main_image.jpg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: buildRegistrationForm(context),
                    ),
                  ),
                ],
              );
            } else {
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: buildRegistrationForm(context),
              );
            }
          },
        ),
      ),
    );
  }

  Widget buildRegistrationForm(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'SAPDOS',
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
                color: Color(0xFF13235A),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Register',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Color(0xFF13235A),
              ),
            ),
            SizedBox(height: 10),
            Text('Enter new account\'s details'),
            SizedBox(height: 20),
            CustomTextField(
              controller: emailController,
              labelText: 'Email address/ Phone No.',
              icon: Icons.email,
            ),
            SizedBox(height: 20),
            CustomTextField(
              controller: passwordController,
              labelText: 'Password',
              icon: Icons.lock,
              obscureText: true,
            ),
            SizedBox(height: 20),
            CustomTextField(
              controller: confirmPasswordController,
              labelText: 'Confirm Password',
              icon: Icons.lock,
              obscureText: true,
            ),
            SizedBox(height: 20),
            BlocConsumer<RegistrationBloc, RegistrationState>(
              listener: (context, state) {
                if (state is RegistrationSuccess) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Registration Successful')));
                } else if (state is RegistrationFailure) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Registration Failed')));
                }
              },
              builder: (context, state) {
                if (state is RegistrationLoading) {
                  return Center(child: CircularProgressIndicator());
                }
                return SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF13235A),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () {
                      final email = emailController.text;
                      final password = passwordController.text;
                      final confirmPassword = confirmPasswordController.text;

                      if (password == confirmPassword) {
                        final user = User(email: email, password: password);
                        context.read<RegistrationBloc>().add(RegisterUser(user));
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Passwords do not match')));
                      }
                    },
                    child: Text(
                      'SIGN-UP',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                );
              },
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Already on Sapdos?'),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
                  },
                  child: Text.rich(
                    TextSpan(
                      text: 'Sign-in',
                      style: TextStyle(decoration: TextDecoration.underline),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
