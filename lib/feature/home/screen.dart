import 'package:flutter/widgets.dart';
import 'package:nutalk/feature/home/viewmodel.dart';

import '../../base/base_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseWidget<HomeViewModel>(
        model: HomeViewModel(),
        onModelReady: (model) {},
        onPageResume: (model) {},
        builder: (context, model, _) {
          return const Center(child: Text('data'));
        });
  }
}
