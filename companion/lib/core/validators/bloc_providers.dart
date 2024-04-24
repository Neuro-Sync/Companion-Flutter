import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../app_cubit/app_cubit.dart';

class BlocProviders {
  static List<BlocProvider> providers(BuildContext context) => [
        BlocProvider<AppCubit>(
          create: (context) => AppCubit(),
          
      ),
      ];
}
