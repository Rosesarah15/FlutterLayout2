import 'package:flutter/material.dart';

import 'package:home_page/ircularcontainer.dart';

class MyHomePage extends StatefulWidget {
  final String title;
  const MyHomePage({super.key, required this.title});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Map<String, dynamic>> dataList = [
    {
      'id': '1',
      'date': 'Dec 2, 2022',
      'amount': 'UXG 500,000',
      'status': 'Paid',
      'color': Colors.green
    },
    {
      'id': '2',
      'date': 'Dec 3, 2022',
      'amount': 'UXG 100,000',
      'status': 'Due',
      'color': Colors.orange
    },
    {
      'id': '3',
      'date': 'Dec 4, 2022',
      'amount': 'UXG 200,000',
      'status': 'Over\nDue',
      'color': Colors.red
    },
    {
      'id': '4',
      'date': 'Dec 6, 2022',
      'amount': 'UXG 800,000',
      'status': 'Paid',
      'color': Colors.green
    },
    {
      'id': '5',
      'date': 'Dec 6, 2022',
      'amount': 'UXG 300,000',
      'status': 'Paid',
      'color': Colors.green
    },
    {
      'id': '6',
      'date': 'Dec 8, 2022',
      'amount': 'UXG 700,000',
      'status': 'Paid',
      'color': Colors.green
    },
    {
      'id': '7',
      'date': 'Dec 9, 2022',
      'amount': 'UXG 900,000',
      'status': 'Paid',
      'color': Colors.green
    },
  ];
  int? _selectedContainerIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.lightBlue,
          title: const Text(''),
          leading: const Icon(
            Icons.abc,
          ),
          actions: const [
            Padding(
                padding: EdgeInsets.all(13),
                child: CircleAvatar(
                  backgroundImage: AssetImage('images/facess.jpg'),
                  radius: 25,
                )),
          ]),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            const Text(
              'What would you like to do, today?',
              style: TextStyle(fontSize: 20, color: Colors.black),
            ),
            const SizedBox(
              height: 25,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CircularContainer(
                    'icons/hom.jpg',
                    title: 'Home',
                    onTap: () => _handleContainerTap(0),
                    isSelected: _selectedContainerIndex == 0,
                  ),
                  CircularContainer(
                    'icons/loan.jpg',
                    title: 'Loans',
                    onTap: () => _handleContainerTap(1),
                    isSelected: _selectedContainerIndex == 1,
                  ),
                  CircularContainer(
                    'icons/investment.png',
                    title: 'Investment',
                    onTap: () => _handleContainerTap(2),
                    isSelected: _selectedContainerIndex == 2,
                  ),
                  CircularContainer(
                    'icons/borrow.png',
                    title: 'Borrow',
                    onTap: () => _handleContainerTap(3),
                    isSelected: _selectedContainerIndex == 3,
                  ),
                  CircularContainer(
                    'icons/lend.png',
                    title: 'Lend',
                    onTap: () => _handleContainerTap(4),
                    isSelected: _selectedContainerIndex == 4,
                  ),
                  CircularContainer(
                    'icons/savings.jpg',
                    title: 'Savings',
                    onTap: () => _handleContainerTap(5),
                    isSelected: _selectedContainerIndex == 5,
                  ),
                  CircularContainer(
                    'icons/capitall.jpg',
                    title: 'Capital',
                    onTap: () => _handleContainerTap(6),
                    isSelected: _selectedContainerIndex == 6,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 8,
                  width: 50,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Container(
                  height: 8,
                  width: 30,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(5),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildHeaderItem('Loan ID'),
                _buildHeaderItem('App.Date'),
                _buildHeaderItem('Amount'),
                _buildHeaderItem('Status'),
              ],
            ),
            for (var data in dataList) _buildDataRow(data),
          ],
        ),
      ),
    );
  }

  void _handleContainerTap(int index) {
    setState(() {
      _selectedContainerIndex = index;
    });
  }
}

class HeaderText extends StatelessWidget {
  final String text;

  const HeaderText(this.text, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
    );
  }
}

class CommonStyledText extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color color;

  const CommonStyledText({
    required this.text,
    this.fontSize = 12,
    this.color = Colors.black,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        color: color,
      ),
    );
  }
}

Widget _buildHeaderItem(String text) {
  return Expanded(
    child: Container(
      padding: const EdgeInsets.all(8),
      child: Center(child: HeaderText(text)),
    ),
  );
}

Widget _buildDataRow(Map<String, dynamic> data) {
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 3),
    padding: const EdgeInsets.all(8),
    decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8)),
    child: Row(
      children: [
        _buildDataItem(data['id'], color: null),
        _buildDataItem(data['date'], color: null),
        _buildDataItem(data['amount'], color: null),
        Row(
          children: [
            Container(
              width: 5,
              height: 5,
              decoration:
                  BoxDecoration(shape: BoxShape.circle, color: data['color']),
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: _buildDataItem(
            data['status'],
            color: data['color'],
          ),
        ),
      ],
    ),
  );
}

Widget _buildDataItem(String text, {required color}) {
  return Expanded(
    child: Container(
      padding: const EdgeInsets.all(8),
      child: CommonStyledText(
        text: text,
        color: color ?? Colors.black,
      ),
    ),
  );
}
