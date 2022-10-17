import 'package:flutter/material.dart';

class PasswordAddDialog extends StatelessWidget {
  const PasswordAddDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController loginController = TextEditingController();
    final TextEditingController addressController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final TextEditingController descriptionController = TextEditingController();
    return Card(
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.7,
        height: MediaQuery.of(context).size.height / 2,
        child: Column(
          children: [
            TextField(
              controller: addressController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Web address',
                hintText: 'Enter web page address',
              ),
            ),
            TextField(
              controller: descriptionController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Description',
                hintText: 'Enter description',
              ),
            ),
            TextField(
              controller: loginController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Login',
                hintText: 'Enter your login',
              ),
            ),
            TextField(
              controller: passwordController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Password',
                hintText: 'Enter your password',
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Add'),
            )
          ],
        ),
      ),
    );
  }
}
