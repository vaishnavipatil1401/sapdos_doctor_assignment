import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sapdos_assignment/presentation/pages/doctor_dashboard.dart';
import 'package:sapdos_assignment/presentation/pages/registration_screen.dart';
import '../../bloc/login/login_bloc.dart';
import '../../bloc/login/login_event.dart';
import '../../bloc/login/login_state.dart';

class LoginForm extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccess) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => DoctorDashboard()),
          );
        } else if (state is LoginFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.error)),
          );
        }
      },
      child: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'SAPDOS',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),
              Center(
                child: Column(
                  children: [
                    Text(
                      'Welcome Back',
                      style: TextStyle(
                        color: Color(0xFF13235A),
                        fontSize: 18,
                      ),
                    ),
                    Text('Enter existing account’s details'),
                  ],
                ),
              ),
              SizedBox(height: 32),
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Email address/ Phone No.',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.email),
                ),
              ),
              SizedBox(height: 16),
              TextField(
                controller: _passwordController,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.lock),
                  suffixIcon: Icon(Icons.visibility),
                ),
                obscureText: true,
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  Checkbox(value: false, onChanged: (value) {}),
                  Text(
                    'Remember me',
                  ),
                  Spacer(),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Forgot Password?',
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: state is! LoginLoading
                      ? () {
                          BlocProvider.of<LoginBloc>(context).add(
                            LoginSubmitted(
                              email: _emailController.text,
                              password: _passwordController.text,
                            ),
                          );
                        }
                      : null,
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all(
                      EdgeInsets.symmetric(vertical: 16.0),
                    ),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    backgroundColor: MaterialStateProperty.all(
                      Color(0xFF13235A),
                    ),
                    foregroundColor: MaterialStateProperty.all(
                      Colors.white,
                    ),
                  ),
                  child: state is LoginLoading
                      ? CircularProgressIndicator()
                      : Text('LOGIN'),
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Not on Sapdos?'),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RegistrationScreen()),
                );
                    },
                    child: Text(
                      'Sign-up',
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
