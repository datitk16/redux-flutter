import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:smtutorial/models/drink.dart';
import 'package:smtutorial/redux/actions.dart';
import 'package:smtutorial/redux/app_state.dart';
import 'package:smtutorial/widgets/drinks_widget.dart';

import '../constants.dart';

// Widget
class ReduxScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cocktail Order"),
      ),
      body: Container(
        decoration: kMainBackgroundImage,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
                padding: EdgeInsets.all(8.0),
                decoration: kWhiteBackground,
                // TODO 10: Surround the column with a StoreConnector
                // TODO 10.1: convert the state in a List of Drinks

                child: StoreConnector<AppState, List<Drink>>(
                  converter: (store) => store.state.drinks,
                  builder: (context, List<Drink> allDrinks) => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Drinks tonight",
                        style: Theme.of(context).textTheme.headline4,
                      ),
                      ...allDrinks
                          .map(
                            (drink) => DrinksWidget(
                              drink: drink,
                              onChanged: (value) {
                                // TODO 11: Use the StoreProvider.of to dispatch the UpdateDrinkAction
                                StoreProvider.of<AppState>(context).dispatch(
                                  UpdateDrinkAction(drink),
                                );
                              },
                            ),
                          )
                          .toList(),
                      Text(
                        "The order is: ",
                        style: Theme.of(context).textTheme.headline4,
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemBuilder: (context, index) => ListTile(
                            title: Text(
                              // TODO 12: replace with the state drinks and remove the drinks list from the widget
                              allDrinks
                                  .where((element) => element.selected)
                                  .toList()[index]
                                  .name,
                            ),
                          ),
                          itemCount: allDrinks
                              .where((element) => element.selected)
                              .length,
                        ),
                      ),
                    ],
                  ),
                )),
          ),
        ),
      ),
    );
  }
}
