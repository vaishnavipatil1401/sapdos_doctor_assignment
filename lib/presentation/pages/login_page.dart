import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sapdos_assignment/presentation/widgets/login_form.dart'; 
import 'package:sapdos_assignment/bloc/login/login_bloc.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth > 600) {
            
            return Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    color: Colors.blue.shade50,
                    child: Center(
                      child: Image.asset('assets/images/main_image.jpg'),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: EdgeInsets.all(32.0),
                    child: BlocProvider(
                      create: (_) => LoginBloc(), 
                      child: LoginForm(), 
                    ),
                  ),
                ),
              ],
            );
          } else {
            
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    color: Colors.blue.shade50,
                    child: Center(
                      child: Image.asset('assets/images/main_image.jpg'),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(32.0),
                    child: BlocProvider(
                      create: (_) => LoginBloc(), 
                      child: LoginForm(), 
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
