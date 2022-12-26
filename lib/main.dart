import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:mvvm_architecture_demo/view/users_screen.dart';
import 'package:mvvm_architecture_demo/view_model/users_view_model.dart';
import 'package:provider/provider.dart';

void main() async {
  await initHiveForFlutter();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => UsersViewModel())],
      child: MaterialApp(
        title: 'MVVM Architecture Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const UsersScreen(),
      ),
    );
  }
}
