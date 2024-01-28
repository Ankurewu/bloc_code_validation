import 'package:bloc_code_validation/screens/bloc/signin_bloc.dart';
import 'package:bloc_code_validation/screens/bloc/signin_event.dart';
import 'package:bloc_code_validation/screens/bloc/signin_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EmailsignInScreen extends StatelessWidget {
  EmailsignInScreen({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Email Sign-in '),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<SigninBloc, SigninState>(
              builder: (context, state) {
                if (state is SigninErrorstate) {
                  return Text(
                    state.errorMessage,
                    style: const TextStyle(color: Colors.red),
                  );
                } else {
                  return Container();
                }
              },
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              onChanged: (val){
                BlocProvider.of<SigninBloc>(context).add(
                 signinTextchangedevent(emailController.text, passwordController.text) 
                );
              },
              controller: emailController,
              decoration: const InputDecoration(
                labelText: 'Email Address',
              ),
            ),
            const SizedBox(height: 20),
            
            TextField(
              onChanged: (val){
                BlocProvider.of<SigninBloc>(context).add(
                 signinTextchangedevent(emailController.text, passwordController.text) 
                );
              },
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Password',
              ),
            ),
            const SizedBox(height: 20),
            BlocBuilder<SigninBloc, SigninState>(
              builder: (context, state) {
                if (state is signinloadingstate){
                  return const Center(child: CircularProgressIndicator());
                }
                return CupertinoButton(
                  onPressed: () {
                    if(state is SigninValidstate){
                BlocProvider.of<SigninBloc>(context).add(
                 SIgninSubmittedevent(emailController.text, passwordController.text) 
                );
                    }
              },
                  color:(state is SigninValidstate)? Colors.blue: Colors.grey,
                  child: const Text('Sign In'),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
