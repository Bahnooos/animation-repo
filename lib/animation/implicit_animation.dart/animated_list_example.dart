import 'package:flutter/material.dart';

class AnimatedListExample extends StatefulWidget {
  const AnimatedListExample({super.key});
  static const screenRoute = 'Animated List';

  @override
  State<AnimatedListExample> createState() => _AnimatedListExampleState();
}

class _AnimatedListExampleState extends State<AnimatedListExample> {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey();

  final List<String> _list = [];

  _addItem() {
    setState(() {
      _list.insert(0, 'New Item ${_list.length}');
      _listKey.currentState?.insertItem(0);
    });
  }

  _removeItem({required int index}) {
    setState(() {
      _list.removeAt(index);
      var itemName = _list[index];

      _listKey.currentState?.removeItem(
        index,
        duration: const Duration(milliseconds: 400),
        (
          context,
          animation,
        ) {
          return ListTile(
            title: Text(itemName),
            textColor: Colors.blueGrey,
          );
        },
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated List '),
        centerTitle: true,
      ),
      body: AnimatedList(
          key: _listKey,
          initialItemCount: _list.length,
          itemBuilder: (BuildContext context, int index, Animation<double> animation) {
            
            return SizeTransition(
              sizeFactor: animation,
              child: Card(
                color: Colors.lightBlue,
                child: ListTile(
                  title: Text(_list[index]),
                  trailing: IconButton(onPressed: () => index ==_list.length-1? null: _removeItem(index:  index), icon: const Icon(Icons.delete)),
                ),
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: _addItem,
        child: const Icon(Icons.add),
      ),
    );
  }
}
