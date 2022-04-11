// Reducer: Actions describe the fact that something happened,
// but don't specify how the application's state changes in response.
// This is the job of reducers.

// TODO 4: create a reducer "updateDrinksReducer"
// TODO 5: check which type the action is
// TODO 6: return a new AppState with the changes we want to do
// TODO 7: if the action is a unkown type return the prev. state

import 'package:smtutorial/redux/actions.dart';
import 'package:smtutorial/redux/app_state.dart';

AppState updateDrinkStateReducer(AppState state, dynamic action) {
  if (action is UpdateDrinkAction) {
    action.updatedDrink.selected = !action.updatedDrink.selected;
    return AppState(
        drinks: state.drinks
            .map((drink) => drink.name == action.updatedDrink.name
                ? action.updatedDrink
                : drink)
            .toList());
  }
  return state;
}
