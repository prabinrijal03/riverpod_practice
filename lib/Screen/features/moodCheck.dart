import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Mood extends HookConsumerWidget {
  const Mood({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<String> mood = [
      "Happy",
      "Sad",
      "Angry",
      "Wow",
      "Haha",
      "Care",
      "Love",
      "Nice"
    ];
    final selectedMoodIndex = useState<int?>(null);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Mood'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 30.0, right: 30, bottom: 50),
            child: GridView.count(
              shrinkWrap: true,
              crossAxisCount: 4,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              children: List.generate(mood.length, (index) {
                return GestureDetector(
                  onTap: () {
                    selectedMoodIndex.value = index;
                  },
                  child: Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(60),
                      border: Border.all(
                        color: selectedMoodIndex.value == index
                            ? Colors.red
                            : Colors.transparent,
                        width: 2,
                      ),
                    ),
                    child: Center(child: Text(mood[index])),
                  ),
                );
              }),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              String selectedMood = selectedMoodIndex.value != null
                  ? mood[selectedMoodIndex.value!]
                  : "no";

              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text("Congratulations"),
                    content: Text(
                      "You are in $selectedMood mood.",
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text('Ok'),
                      )
                    ],
                  );
                },
              );
            },
            child: const Text('Check mood'),
          ),
        ],
      ),
    );
  }
}
