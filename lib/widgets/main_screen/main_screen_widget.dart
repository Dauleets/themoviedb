import 'package:flutter/material.dart';
import 'package:themoviedb/widgets/movie_list/movie_list_widget.dart';

class MainScreenWidget extends StatefulWidget {
  const MainScreenWidget({Key? key}) : super(key: key);

  @override
  _MainScreenWidgetState createState() => _MainScreenWidgetState();
}

class _MainScreenWidgetState extends State<MainScreenWidget> {
  int _selectedTab = 1;
  static List<Widget> _widgetOptions = <Widget>[];
  void onSelectedTab(int index) {
    if (_selectedTab == index) return;
    setState(() {
      _selectedTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TMBD'),
        centerTitle: true,
      ),
      body: IndexedStack(
        index: _selectedTab,
        children: [
          const Center(
            child: Text('sosi'),
          ),
          MovieListWidget(),
          const Center(
            child: Text('sosi'),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedTab,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Новости'),
            BottomNavigationBarItem(
                icon: Icon(Icons.movie_filter), label: 'Фильмы'),
            BottomNavigationBarItem(icon: Icon(Icons.tv), label: 'Сериалы'),
          ],
          onTap: onSelectedTab),
    );
  }
}
