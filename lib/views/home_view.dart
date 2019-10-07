import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:inf_scroll/viewmodels/home_viewmodel.dart';
import 'package:inf_scroll/widgets/creation_aware_list_item.dart';
import 'package:inf_scroll/widgets/list_item.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  int _currentIndex = 0;
  var _children = [
    TabBarView(
      children: [
        ChangeNotifierProvider<HomeViewModel>.value(
          value: HomeViewModel(),
          child: Consumer<HomeViewModel>(
            builder: (cxt, model, child) => ListView.builder(
              itemCount: model.items.length,
              itemBuilder: (cxt, index) => CreationAwareListItem(
                onCreated: () {
                  SchedulerBinding.instance.addPostFrameCallback((duration) => 
                    model.handleItemCreated(index)
                  );
                } ,
                child: ListItem(
                  title: model.items[index],
                ),
              ),
            ),
          ),
        ),
        Container(color: Colors.red, child: Text('doodling.........'),),
        Container(color: Colors.blue, child: Text('art........'),),
        Container(color: Colors.blue, child: Text('art........'),),
        Container(color: Colors.blue, child: Text('art........'),),
        Container(color: Colors.blue, child: Text('art........'),),
        Container(color: Colors.blue, child: Text('art........'),),
        Container(color: Colors.blue, child: Text('art........'),)
      ],
    ),
    Center(child: Text('friends'),),
    Center(child:Text('missions')),
    Center(child: Text('notifs'),),
    Center(child: Text('profile'),),
  ];
  var _appBars = [
    TabBar(
      isScrollable: true,
      tabs: <Widget>[
        Container(
          height: 40,
          child: Center(child: Text('photography', style: TextStyle(color: Colors.black),),),
        ),
        Container(
          height: 40,
          child: Center(child: Text('doodling', style: TextStyle(color: Colors.black),),),
        ),
        Container(
          height: 40,
          child: Center(child: Text('art', style: TextStyle(color: Colors.black),),),
        ),
        Container(
          height: 40,
          child: Center(child: Text('photography', style: TextStyle(color: Colors.black),),),
        ),
        Container(
          height: 40,
          child: Center(child: Text('photography', style: TextStyle(color: Colors.black),),),
        ),
        Container(
          height: 40,
          child: Center(child: Text('photography', style: TextStyle(color: Colors.black),),),
        ),
        Container(
          height: 40,
          child: Center(child: Text('photography', style: TextStyle(color: Colors.black),),),
        ),
        Container(
          height: 40,
          child: Center(child: Text('photography', style: TextStyle(color: Colors.black),),),
        ),
      ],
    ),
    null,
    null,
    null,
    null
  ];
  
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 8,
      child: SafeArea(
        child: Scaffold(
          appBar: _appBars[_currentIndex],
          body: _children[_currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            currentIndex: _currentIndex,
            selectedItemColor: Colors.teal,
            unselectedItemColor: Colors.grey,
            items: const <BottomNavigationBarItem> [
              BottomNavigationBarItem(title:Text('explore'),icon: Icon(Icons.ac_unit)),
              BottomNavigationBarItem(title:Text('friends'),icon:Icon(Icons.face)),
              BottomNavigationBarItem(title:Text('missions'),icon:Icon(Icons.today)),
              BottomNavigationBarItem(title:Text('notifs'),icon:Icon(Icons.access_alarm)),
              BottomNavigationBarItem(title:Text('profile'),icon:Icon(Icons.sentiment_satisfied)),
            ],
          ),
        ),
      ),
    );
  }
}