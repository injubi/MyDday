import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime selectedDate = DateTime(
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day,
  );

  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        bottom: false,
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              _TopPart(
                selectedDate: selectedDate,
                onPressed: onHeartPressed,
                toggleCheckBox: _toggleCheckBox,
                isChecked: isChecked,
              ),
              // _BottomPart(),
            ],
          ),
        ),
      ),
    );
  }

  void onHeartPressed() {
    final DateTime now = DateTime.now();

    // dialog
    showCupertinoDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            color: Colors.white,
            height: 300.0,
            child: CupertinoDatePicker(
              mode: CupertinoDatePickerMode.date,
              initialDateTime: selectedDate,
              // maximumDate: DateTime(
              //   now.year,
              //   now.month,
              //   now.day,
              // ),
              onDateTimeChanged: (DateTime date) {
                setState(() {
                  selectedDate = date;
                });
              },
            ),
          ),
        );
      },
    );
  }

  void _toggleCheckBox() {
    setState(() {
      isChecked = !isChecked;
    });
  }
}

class _TopPart extends StatelessWidget {
  final DateTime selectedDate;
  final VoidCallback onPressed;
  final VoidCallback toggleCheckBox;
  final bool isChecked;

  _TopPart({
    required this.selectedDate,
    required this.onPressed,
    required this.isChecked,
    required this.toggleCheckBox,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final now = DateTime.now();
    final difference = DateTime(
          now.year,
          now.month,
          now.day,
        ).difference(selectedDate).inDays +
        (isChecked ? 1 : 0);

    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            'My D-Day',
            style: textTheme.displayLarge,
          ),
          Column(
            children: [
              Text(
                '${now.year}년 ${now.month}월 ${now.day}일 오늘부터',
                style: textTheme.displaySmall,
              ),
            ],
          ),
          // IconButton(
          //   iconSize: 60.0,
          //   onPressed: onPressed,
          //   icon: Icon(
          //     Icons.favorite,
          //     color: Colors.red,
          //   ),
          // ),
          GestureDetector(
            onTap: onPressed,
            child: Text(
                '${selectedDate.year}년 ${selectedDate.month}월 ${selectedDate.day}일까지',
                style: textTheme.displaySmall),
          ),
          Text(
            difference > 0
                ? '${difference}일 지났습니다.'
                : '${difference.abs()}일 남았습니다.',
            style: textTheme.displayMedium,
          ),

          CheckboxListTile(
            // controlAffinity: ListTileControlAffinity.leading,
            title: Text(
              '시작일을 포함',
              style: textTheme.displaySmall,
            ),
            value: isChecked,
            onChanged: (newValue) {
              toggleCheckBox();
            },
          ),
        ],
      ),
    );
  }
}

// class _BottomPart extends StatelessWidget {
//   const _BottomPart({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       child: Image.asset(
//         'asset/img/middle_image.png',
//       ),
//     );
//   }
// }
