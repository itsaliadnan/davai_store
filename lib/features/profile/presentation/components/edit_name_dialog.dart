import 'package:davai_store/localization/strings.g.dart';
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
      title: Text(context.t.profile.editName),
      content: TextField(
        controller: controller,
        decoration: InputDecoration(hintText: context.t.profile.enterName),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text(context.t.profile.cancel),
        ),
        ElevatedButton(
          onPressed: () {
            onSave(controller.text);
            Navigator.pop(context);
          },
          child: Text(context.t.profile.save),
        ),
      ],
    );
  }
}
