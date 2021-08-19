import 'package:dKatalis/views/widget/button_widget.dart';
import 'package:dKatalis/views/widget/input_widget.dart';
import 'package:dKatalis/views/widget/time_line.dart';
import 'package:flutter/material.dart';

import 'dart:math' as math show sin, pi, sqrt;

import 'package:flutter/animation.dart';

class ScheduleVideoCall extends StatefulWidget {
  const ScheduleVideoCall({
    this.size = 72.0,
    this.color = Colors.white,
  });

  final double size;
  final Color color;

  @override
  _ScheduleVideoCallState createState() => _ScheduleVideoCallState();
}

class _CirclePainter extends CustomPainter {
  _CirclePainter(
      this._animation, {
        required this.color,
      }) : super(repaint: _animation);

  final Color color;
  final Animation<double> _animation;

  void circle(Canvas canvas, Rect rect, double value) {
    final double opacity = (1.0 - (value / 4.0)).clamp(0.0, 1.0);
    final Color _color = color.withOpacity(opacity);

    final double size = rect.width / 2;
    final double area = size * size;
    final double radius = math.sqrt(area * value / 4);

    final Paint paint = Paint()..color = _color;
    canvas.drawCircle(rect.center, radius, paint);
  }

  @override
  void paint(Canvas canvas, Size size) {
    final Rect rect = Rect.fromLTRB(0.0, 0.0, size.width, size.height);

    for (int wave = 2; wave >= 0; wave--) {
      circle(canvas, rect, wave + _animation.value);
    }
  }

  @override
  bool shouldRepaint(_CirclePainter oldDelegate) => true;
}

class _ScheduleVideoCallState extends State<ScheduleVideoCall> with TickerProviderStateMixin {
  late AnimationController _controller;
  DateTime _date = DateTime.now();
  TimeOfDay _time = TimeOfDay.now();
  String? _selectedDate, _selectedTime;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.blue,
        appBar: AppBar(
          title: Text("Create Account"),
          elevation: 0.0,
        ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TimeLine(3, 4),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomPaint(
                    painter: _CirclePainter(
                      _controller,
                      color: widget.color,
                    ),
                    child: SizedBox(
                      width: widget.size ,
                      height: widget.size ,
                      child: Center(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(24),
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              gradient: RadialGradient(
                                colors: <Color>[
                                  widget.color,
                                  Color.lerp(widget.color, Colors.black, .05) ?? widget.color
                                ],
                              ),
                            ),
                            child: ScaleTransition(
                              scale: Tween(begin: 0.95, end: 1.0).animate(
                                CurvedAnimation(
                                  parent: _controller,
                                  curve: const _PulsateCurve(),
                                ),
                              ),
                              child: Icon(Icons.insert_invitation, color: Colors.blue, size: 24,),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 32),
                  WordingText(
                      "Schedule Video Call",
                      "Choose the date and time that you preferred.we\nwill send a link via email to make a video call on\nthe schedule date and time."
                  ),
                  SizedBox(height: 48,),
                  _picker("Date",
                      _selectedDate,
                     (){
                        showDatePicker(
                            context: context,
                            initialDate: _date,
                            firstDate: DateTime.now(),
                            lastDate: DateTime(DateTime.now().year, DateTime.now().month, 31)
                        ).then((value) {
                          setState(() {
                            _date = value ?? DateTime.now();
                            _selectedDate = "${_date.day}-${_date.month < 10 ? "0${_date.month}":_date.month}-${_date.year}";
                          });
                        });
                  }),
                  _picker("Time", _selectedTime,() {
                      showTimePicker(
                          context: context,
                          initialTime: _time
                      ).then((value) {
                          setState(() {
                              _time = value ?? TimeOfDay.now();
                              _selectedTime = "${_time.hour}:${_time.minute}";
                          });
                      });
                  })
                ],
              ),
            ),
          )
        ],
      ),
        floatingActionButton: NextButton(() => {

        }),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat
    );
  }

  _picker(String title, String? value, Function callback){
    return Container(
      margin: EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8)
      ),
      child: InkWell(
        onTap: () {
          callback();
        },
        child: ListTile(
          title: Text(
            title,
            style: TextStyle(color: Colors.grey, fontSize: 12),
          ),
          subtitle: Text(value ?? "-Choose $title-", style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold)),
          trailing: Icon(Icons.keyboard_arrow_down),
        ),
      ),
    );
  }

}

class _PulsateCurve extends Curve {
  const _PulsateCurve();

  @override
  double transform(double t) {
    if (t == 0 || t == 1) {
      return 0.01;
    }
    return math.sin(t * math.pi);
  }
}