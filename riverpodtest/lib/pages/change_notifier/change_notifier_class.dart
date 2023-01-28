import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// create the model
class NumberNotifier extends ChangeNotifier {
  int number = 0;

  void increase() {
    number++;
    notifyListeners();
  }

  void decrease() {
    number--;
    notifyListeners();
  }
}

// create the provider

final numberNotifier =
    ChangeNotifierProvider<NumberNotifier>((ref) => NumberNotifier());

class ExampleEight extends ConsumerWidget {
  const ExampleEight({super.key});

  @override
  Widget build(BuildContext context, ref) {
    // create instance for the provider
    final numberChanged = ref.watch(numberNotifier);

    return Scaffold(
        appBar: AppBar(
          title: const Text('Change Notifier Provider'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                numberChanged.number.toString(),
                style: const TextStyle(fontSize: 40),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {
                      numberChanged.increase();
                    },
                    child: const Text(
                      '+',
                      style: TextStyle(fontSize: 40),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      numberChanged.decrease();
                    },
                    child: const Text(
                      '-',
                      style: TextStyle(fontSize: 40),
                    ),
                  ),
                ],
              )
            ],
          ),
        ));
  }
}

// class CustomButtons extends StatefulWidget {
//   const CustomButtons({super.key});

//   @override
//   State<CustomButtons> createState() => _CustomButtonsState();
// }

// class _CustomButtonsState extends State<CustomButtons> {
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         TextButton(
//           onPressed: () {
//             context.read(numberNotifier);
//             ;
//             numberChanged.increase();
//           },
//           child: const Text(
//             '+',
//             style: TextStyle(fontSize: 40),
//           ),
//         ),
//         TextButton(
//           onPressed: () {
//             numberChanged.decrease();
//           },
//           child: const Text(
//             '-',
//             style: TextStyle(fontSize: 40),
//           ),
//         ),
//       ],
//     );
//   }
// }
