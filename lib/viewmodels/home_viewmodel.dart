import 'package:flutter/widgets.dart';

String LoadingIndicatorTitle = '^';

class HomeViewModel extends ChangeNotifier {
  List<String> _items;
  List<String> get items => _items;

  int _currentPage = 0;

  static const int itemThreshold = 15;

  HomeViewModel() {
    _items = List<String>.generate(15, (index) => 'Title $index');
  }

  Future handleItemCreated(int index) async {
    var itemPosition = index+1;
    var requestMoreData = itemPosition % itemThreshold == 0;
    var pageToRequest = itemPosition ~/ itemThreshold;

    if(requestMoreData && pageToRequest > _currentPage) {
      _currentPage = pageToRequest;
      print('pageToRequest $pageToRequest & index $index');
      _showLoadingIndicator();

      await Future.delayed(Duration(seconds: 3));
      var fetchedItems = List.generate(15, (index) => 'Title page $_currentPage item $index');
      _items.addAll(fetchedItems);

      _removeLoadingIndicator();
    }
  }

  void _showLoadingIndicator() {
    _items.add(LoadingIndicatorTitle);
    notifyListeners();
  }

  void _removeLoadingIndicator() {
    _items.remove(LoadingIndicatorTitle);
    notifyListeners();
  }
}