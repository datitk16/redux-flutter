// Actions: Actions are payloads of information that send data from your
// application to your store. They are the only source of information
// for the store. You send them to the store using store.dispatch().

// TODO 3: Create a UpdateDrinkAction with a payload "updatedDrink"

import 'package:smtutorial/models/drink.dart';

class UpdateDrinkAction {
  final Drink updatedDrink;

  UpdateDrinkAction(Drink drink, {this.updatedDrink});
}
