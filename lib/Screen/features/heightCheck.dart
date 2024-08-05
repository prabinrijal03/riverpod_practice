import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Height extends HookConsumerWidget {
  const Height({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = useTextEditingController();
    final errorMessage = useState<String?>(null);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Check Height'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 60.0),
          child: Column(
            children: [
              const Text('Enter your height'),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 80.0, right: 80),
                child: TextFormField(
                  controller: controller,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    errorText: errorMessage.value,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    final height = controller.text;
                    if (height.isEmpty) {
                      errorMessage.value = 'Please enter your height';
                    } else {
                      errorMessage.value = null;
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text('Congratulations'),
                              content: Text('Your height is $height'),
                              actions: <Widget>[
                                TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text('Ok'))
                              ],
                            );
                          });
                    }
                  },
                  child: const Text('Check your height'))
            ],
          ),
        ),
      ),
    );
  }
}
