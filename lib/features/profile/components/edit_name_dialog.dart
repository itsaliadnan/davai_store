import 'package:flutter/material.dart';

class EditNameDialog extends StatelessWidget {
  final String initialName;
  final Function(String) onSave;

  const EditNameDialog({
    super.key,
    required this.initialName,
    required this.onSave,
  });

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController(text: initialName);

    return AlertDialog(
      title: const Text("Edit Name"),
      content: TextField(
        controller: controller,
        decoration: const InputDecoration(hintText: "Enter name"),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text("Cancel"),
        ),
        ElevatedButton(
          onPressed: () {
            onSave(controller.text);
            Navigator.pop(context);
          },
          child: const Text("Save"),
        ),
      ],
    );
  }
}
