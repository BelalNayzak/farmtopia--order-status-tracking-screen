import 'package:farmtopia_task_app/features/comments/presentation/bloc/comments_bloc.dart';
import 'package:farmtopia_task_app/features/order_condition/presentation/bloc/order_condition_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/dependency_injection/injection_container.dart';
import 'features/order_condition/presentation/pages/dummy_page.dart';
import 'features/order_condition/presentation/pages/order_cond_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupInjection();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<OrderConditionBloc>(
          create: (_) => gtt<OrderConditionBloc>(),
        ),
        BlocProvider<CommentsBloc>(
          create: (_) => gtt<CommentsBloc>(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: DummyPage.id,
        routes: {
          DummyPage.id: (_) => const DummyPage(),
          OrderConditionPage.id: (_) => const OrderConditionPage(),
        },
      ),
    );
  }
}
