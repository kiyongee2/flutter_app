import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {

  const HomeScreen({Key? key}) : super(key: key);

  // 상태 관리
  @override
  State<StatefulWidget> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen>{
  // 날짜
  DateTime firstDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[100],
      body: SafeArea(
          top: true,
          bottom: false,
          child: Column(
            // 위 아래 끝에 위젯 배치
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            // 반대축 최대 크기로 늘리기
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              DDay(
                onHeartPressed: onHeartPressed,
                firstDay: firstDay,
              ),
              CoupleImage()
            ],
          )
      ),
    );
  }
}

void onHeartPressed(){
  print('클릭!!');
}

// 화면 상단부
class DDay extends StatelessWidget{
  final GestureTapCallback onHeartPressed;
  final DateTime firstDay;

  DDay({
    required this.onHeartPressed,
    required this.firstDay
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final now = DateTime.now();

    return Column(
      children: [
        const SizedBox(height: 16.0),
        Text(
            'U&I',
            style: textTheme.headlineLarge,
        ),

        const SizedBox(height: 16.0),
        Text(
            '우리 처음 만난 날',
            style: textTheme.bodyMedium,
        ),
        Text(
          // '2021. 11. 23',
          '${firstDay.year}.${firstDay.month}.${firstDay.day}',
          style: textTheme.bodySmall,
        ),

        const SizedBox(height: 16.0),
        IconButton(
            iconSize: 60.0,
            onPressed: onHeartPressed,
            icon: Icon(
              Icons.favorite,
              color: Colors.red,
            ),
        ),

        const SizedBox(height: 16.0),
        Text(
            // 'D+365',
          'D+${DateTime(now.year, now.month,
              now.day).difference(firstDay).inDays + 1}',
          style: textTheme.headlineMedium,
        ),
      ],
    );
  }
}

// 화면 하단부
class CoupleImage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
          'asset/img/middle_image.png',
        height: MediaQuery.of(context).size.height / 2,
      ),
    );
  }
}