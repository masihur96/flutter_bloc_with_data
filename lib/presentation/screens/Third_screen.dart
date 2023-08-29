import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../business_logic/cubit.dart';

class ThirdScreen extends StatelessWidget {
  const ThirdScreen({Key? key, required this.title, required this.bgColor})
      : super(key: key);

  final String title;
  final Color bgColor;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UIChangeCubit(),
      child: Scaffold(
        backgroundColor: bgColor,
        body: Center(
          child: BlocBuilder<UIChangeCubit, bool>(
            builder: (context, uiState) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    uiState ? 'UI State 1' : 'UI State 2',
                    style: const TextStyle(fontSize: 24),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      final UIChangeCubit _cubit =
                          BlocProvider.of<UIChangeCubit>(context);
                      _cubit.toggleUI();
                    },
                    child: const Text('Toggle UI'),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
