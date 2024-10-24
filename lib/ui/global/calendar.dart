import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:maideazw/ui/styles/color.dart';

class CalendarPopup extends StatefulWidget {
  final Function(DateTime) onDateSelected;

  const CalendarPopup({Key? key, required this.onDateSelected})
      : super(key: key);

  @override
  _CalendarPopupState createState() => _CalendarPopupState();
}

class _CalendarPopupState extends State<CalendarPopup> {
  DateTime _selectedDate = DateTime.now();
  DateTime _focusedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildCalendarHeader(),
          //const Divider(height: 1, color: Colors.grey),
          _buildCalendarDays(),
        ],
      ),
    );
  }

  Widget _buildCalendarHeader() {
    final monthFormat = DateFormat("MMMM ’yy");
    return Padding(
      padding:
          const EdgeInsets.only(top: 20.0, bottom: 20, left: 15.0, right: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            monthFormat.format(_focusedDate),
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              fontFamily: 'Manrope',
            ),
          ),
          Spacer(),
          GestureDetector(
            child: const Icon(Icons.chevron_left),
            onTap: () {
              setState(() {
                _focusedDate = DateTime(_focusedDate.year,
                    _focusedDate.month - 1, _focusedDate.day);
              });
            },
          ),
          const SizedBox(
            width: 10,
          ),
          GestureDetector(
            child: const Icon(
              Icons.chevron_right,
            ),
            onTap: () {
              setState(() {
                _focusedDate = DateTime(_focusedDate.year,
                    _focusedDate.month + 1, _focusedDate.day);
              });
            },
          ),
        ],
      ),
    );
  }

  Widget _buildCalendarDays() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Days of the week
          Padding(
            padding: const EdgeInsets.only(left: 15.0, right: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: ['M', 'T', 'W', 'T', 'F', 'S', 'S'].map((day) {
                return Text(
                  day,
                  style: const TextStyle(
                    fontSize: 12,
                    fontFamily: 'Manrope',
                    fontWeight: FontWeight.w500,
                    color: appColor,
                  ),
                );
              }).toList(),
            ),
          ),
          const SizedBox(height: 10),
          // Days of the month
          GridView.builder(
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 7,
              childAspectRatio: 1,
            ),
            itemCount:
                DateUtils.getDaysInMonth(_focusedDate.year, _focusedDate.month),
            itemBuilder: (context, index) {
              final day = index + 1;
              final isSelected = _selectedDate.year == _focusedDate.year &&
                  _selectedDate.month == _focusedDate.month &&
                  _selectedDate.day == day;

              return GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedDate =
                        DateTime(_focusedDate.year, _focusedDate.month, day);
                  });
                  widget.onDateSelected(_selectedDate);
                  Navigator.pop(context);
                },
                child: Container(
                  alignment: Alignment.center,
                  decoration: isSelected
                      ? BoxDecoration(
                          shape: BoxShape.circle,
                          color: appColor,
                        )
                      : null,
                  child: Text(
                    day.toString(),
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'Manrope',
                      fontWeight: FontWeight.w500,
                      color: isSelected ? Colors.white : Colors.black,
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
