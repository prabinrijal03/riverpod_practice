import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final phoneNumberProvider = StateProvider<String>((ref) => '');

class GetNumber extends HookConsumerWidget {
  const GetNumber({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final phoneController = useTextEditingController();
    final phoneNumber = ref.watch(phoneNumberProvider);

    useEffect(() {
      void listener() {
        ref.read(phoneNumberProvider.notifier).state = phoneController.text;
      }

      phoneController.addListener(listener);
      return () => phoneController.removeListener(listener);
    }, [phoneController]);

    final isButtonEnabled = phoneNumber.isNotEmpty;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back_ios_new_sharp,
            size: 20,
            color: Colors.white,
          ),
        ),
      ),
      backgroundColor: Colors.black,
      body: Column(children: [
        Container(
          height: 0.3,
          color: Colors.grey,
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Let's get started.",
                  style: TextStyle(
                      color: Color.fromARGB(255, 155, 153, 153), fontSize: 17),
                ),
                const SizedBox(height: 8),
                const Text(
                  "Can we get your number?",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: const BorderSide(color: Colors.blue)),
                          filled: true,
                          fillColor: const Color.fromARGB(255, 27, 27, 27),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                            borderSide:
                                const BorderSide(color: Colors.transparent),
                          ),
                        ),
                        dropdownColor: Colors.grey[800],
                        value: "US (+1)",
                        items: const [
                          DropdownMenuItem(
                            value: "US (+1)",
                            child: Text(
                              "US (+1)",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                        onChanged: (value) {},
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      flex: 2,
                      child: TextField(
                        controller: phoneController,
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: const BorderSide(color: Colors.blue)),
                          filled: true,
                          fillColor: const Color.fromARGB(255, 27, 27, 27),
                          hintText: "000-000-0000",
                          hintStyle: const TextStyle(color: Colors.grey),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                            borderSide:
                                const BorderSide(color: Colors.transparent),
                          ),
                        ),
                        style: const TextStyle(color: Colors.white),
                        keyboardType: TextInputType.phone,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                const Text(
                  "Use email instead?",
                  style: TextStyle(
                      color: Color.fromARGB(255, 255, 103, 93), fontSize: 16),
                ),
                const Spacer(),
                const SizedBox(height: 16),
                const Text.rich(
                  TextSpan(
                      text: 'By Signing up, you will agree to our ',
                      style: TextStyle(
                          color: Color.fromARGB(255, 177, 175, 175),
                          fontSize: 13),
                      children: [
                        TextSpan(
                            text: 'Terms of Service',
                            style: TextStyle(
                                color: Color.fromARGB(255, 255, 103, 93),
                                fontSize: 13)),
                        TextSpan(
                            text: '\nand',
                            style: TextStyle(
                              color: Color.fromARGB(255, 177, 175, 175),
                            )),
                        TextSpan(
                            text: ' Privacy Policy',
                            style: TextStyle(
                                color: Color.fromARGB(255, 255, 103, 93),
                                fontSize: 13)),
                      ]),
                ),
                const SizedBox(height: 16),
                Center(
                  child: Opacity(
                    opacity: isButtonEnabled ? 1.0 : 0.5,
                    child: ElevatedButton(
                      onPressed: isButtonEnabled ? () {} : () {},
                      style: ElevatedButton.styleFrom(
                        fixedSize: const Size(380, 48),
                        foregroundColor: Colors.white,
                        backgroundColor: const Color(0xffFF593D),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 60.0, vertical: 12.0),
                        child: Text(
                          "Continue",
                          style: TextStyle(fontSize: 17),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        )
      ]),
    );
  }
}
