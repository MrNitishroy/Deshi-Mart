import 'package:flutter/material.dart';

import '../../../widgets/PrimaryButton.dart';

class AuthFields extends StatelessWidget {
  const AuthFields({super.key});

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    TextEditingController email = TextEditingController();
    TextEditingController password = TextEditingController();
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
        color: Theme.of(context).colorScheme.secondaryContainer,
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Welcome To Deshi Mart",
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Get your grocery in as fast as one hours",
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ],
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "EMAIL",
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ],
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: email,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Email is required";
                  } else {
                    return null;
                  }
                },
                decoration: InputDecoration(
                  hintText: "Enter Email",
                  prefixIcon: Icon(
                    Icons.alternate_email,
                    color: Theme.of(context).colorScheme.onPrimaryContainer,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "PASSWORD",
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ],
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: password,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Password is required";
                  } else if (value.length < 6) {
                    return "Password must be at least 6 characters long";
                  }
                  return null;
                },
                decoration: InputDecoration(
                  hintText: "Enter Password",
                  prefixIcon: Icon(
                    Icons.lock_open,
                    color: Theme.of(context).colorScheme.onPrimaryContainer,
                  ),
                  suffixIcon: Icon(
                    Icons.remove_red_eye,
                    color: Theme.of(context).colorScheme.onPrimaryContainer,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () {},
                    child: Text(
                      "Forgot password ? ",
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30),
              PrimaryButton(
                name: "LOGIN",
                icon: Icons.lock,
                onTap: () {
                  if (_formKey.currentState!.validate()) {}
                },
                color: Theme.of(context).colorScheme.primary,
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      child: Row(),
                      height: 2,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.onPrimaryContainer,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Text(
                    "OR",
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Container(
                      child: Row(),
                      height: 2,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.onPrimaryContainer,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: 20),
              PrimaryButton(
                name: "LOGIN WITH GOOGLE",
                icon: Icons.workspaces_filled,
                onTap: () {},
                color: Colors.blue,
              ),
            ],
          ),
        ));
  }
}
