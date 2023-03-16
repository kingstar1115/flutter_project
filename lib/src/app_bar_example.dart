import 'package:flutter/material.dart';

const _title = 'Overview';

class FavoriteWidget extends StatefulWidget {
  const FavoriteWidget({super.key});

  @override
  State<FavoriteWidget> createState() => _FavoriteWidgetState();
}

class _FavoriteWidgetState extends State<FavoriteWidget> {
  bool _isFavorited = true;
  int _favoriteCount = 41;

  void _toggleFavorite() {
    setState(() {
      if (_isFavorited) {
        _favoriteCount -= 1;
        _isFavorited = false;
      } else {
        _favoriteCount += 1;
        _isFavorited = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.all(0),
          child: IconButton(
            padding: const EdgeInsets.all(0),
            alignment: Alignment.centerRight,
            icon: (_isFavorited
                ? const Icon(Icons.star)
                : const Icon(Icons.star_border)),
            color: Colors.red[500],
            onPressed: _toggleFavorite,
          ),
        ),
        SizedBox(
          width: 20,
          child: SizedBox(
            child: Text(
              '$_favoriteCount',
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class AppBarExample extends StatelessWidget {
  const AppBarExample({super.key});
  @override
  Widget build(BuildContext context) {
    Container myListItem(
      String img,
      String userName,
      String date,
      String time,
      String money,
    ) {
      return Container(
          child: Padding(
        padding: EdgeInsets.fromLTRB(8, 0, 8, 8),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Image(
                        image: AssetImage(img),
                        width: 48,
                        height: 48,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 8),
                        child: Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.only(bottom: 8),
                              child: Text(userName,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  )),
                            ),
                            Text(
                              'Date',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.grey[600],
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Column(
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.autorenew_sharp,
                      size: 20,
                    ),
                    Text(time),
                  ],
                ),
                Text(
                  '\$$money',
                  style: TextStyle(
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ],
        ),
      ));
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(_title),
        leading: IconButton(
          icon: const Icon(Icons.dehaze_outlined),
          onPressed: () {},
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.search),
            tooltip: 'Show Snackbar',
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('This is a snackbar')));
            },
          ),
          IconButton(
            icon: const Icon(Icons.sort_outlined),
            tooltip: 'Go to the next page',
            onPressed: () {},
          ),
        ],
      ),
      body: Container(
        // padding: const EdgeInsets.all(8),
        child: ListView(
          children: [
            Container(
                height: 48,
                color: Colors.purple[800],
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Row(
                    children: [
                      Expanded(
                          child: Row(
                        children: [
                          Text(
                            'Upcoming ()',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      )),
                      const FavoriteWidget(),
                    ],
                  ),
                )),
            myListItem(
                'images/img(14).jpg', 'tevinson', '2023-02-24', '2', '500'),
            myListItem(
                'images/img(14).jpg', 'tevinson', '2023-02-24', '2', '500'),
          ],
        ),
      ),
    );
  }
}
