import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:smtutorial/redux/app_state.dart';
import 'package:smtutorial/redux/reducer.dart';
import 'package:smtutorial/redux/redux_screen.dart';
import 'package:redux/redux.dart';
import 'models/drink.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // TODO 8: Create a store and initialize the state

  final Store<AppState> _store = Store<AppState>(updateDrinkStateReducer,
      initialState: AppState(drinks: [
        Drink("Water", false),
        Drink("Cuba Libre", false),
        Drink("Pina Colada", false),
        Drink("Havana Cola", false)
      ]));

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Redux solution - Flutter Explained',
      theme: ThemeData.light().copyWith(primaryColor: Color(0xFFe13133)),
      // TODO 9: Surround the ReduxScreen with a StoreProvider Widget
      home: StoreProvider<AppState>(
        store: _store,
        child: ReduxScreen(),
      ),
    );
  }
}
