import 'package:flutter/material.dart';

typedef CallBackDate = Function(dynamic);

class DatePickerWidget extends StatefulWidget {
  final String text;
  final prefixIcon;

  CallBackDate onCallBackDate;

  DatePickerWidget({this.text, this.prefixIcon, this.onCallBackDate(dynamic)});

  @override
  _DatePickerWidgetState createState() => _DatePickerWidgetState();
}

class _DatePickerWidgetState extends State<DatePickerWidget> {
  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    print("Clicked for selecting time");

    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;

        widget.onCallBackDate("${selectedDate.toLocal()}".split(' ')[0]);
      });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(left: 200, right: 200, top: 10, bottom: 10),
      child: InkWell(
        onTap: () => _selectDate(context),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black.withOpacity(0.12),
            ),
            borderRadius: BorderRadius.all(Radius.circular(4)),
          ),
          child: ListTile(
              leading: Icon(
                widget.prefixIcon,
                color: Colors.black,
              ),
              title: selectedDate != null
                  ? Text("${selectedDate.toLocal()}".split(' ')[0])
                  : Text(widget.text)),
        ),
      ),
    );
  }
}
