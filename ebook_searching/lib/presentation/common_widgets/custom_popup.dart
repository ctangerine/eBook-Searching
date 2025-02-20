import 'package:flutter/material.dart';

class CustomPopup extends StatelessWidget {
  final String title;
  final String content;
  final String confirmText;
  final void Function() onConfirm;
  final void Function()? onCancel;
  final bool showCancelButton;

  const CustomPopup({
    super.key,
    required this.title,
    required this.content,
    required this.confirmText,
    required this.onConfirm,
    this.onCancel,
    this.showCancelButton = true,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      alignment: Alignment.center,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              title,
              style: const TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20.0),
            Text(
              content,
              style: const TextStyle(fontSize: 16.0),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                if (showCancelButton)
                  Expanded(
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(24)),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 10),
                        
                      ),
                      onPressed: onCancel ?? () => Navigator.of(context).pop(),
                      child: const Text('Cancel'),
                    ),
                  ),
                if (showCancelButton) const SizedBox(width: 24,),
                Expanded(
                  child: FilledButton(
                    style: ElevatedButton.styleFrom(
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(24.0)),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 10),
                    ),
                    onPressed: onConfirm,
                    child: Text(confirmText),
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