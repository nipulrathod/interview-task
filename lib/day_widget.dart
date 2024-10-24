import 'package:flutter/material.dart';

class DayWidget extends StatefulWidget {
  const DayWidget({super.key, required this.day});

  final String day;

  @override
  State<DayWidget> createState() => _DayWidgetState();
}

class _DayWidgetState extends State<DayWidget> {
  List<String> timeRanges = [];

  Future<void> _pickTimeRange() async {
    TimeOfDay? from = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (from != null) {
      TimeOfDay? to = await showTimePicker(
        context: context,
        initialTime: from,
      );
      if (to != null) {
        setState(() {
          timeRanges.add('${from.format(context)} - ${to.format(context)}');
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.black, width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(widget.day),
                ElevatedButton.icon(
                  onPressed: _pickTimeRange,
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    backgroundColor: Colors.amber,
                    padding: const EdgeInsets.only(left: 5, right: 10),
                  ),
                  icon: const Icon(Icons.add),
                  label: const Text(
                    "Add",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ],
            ),
          ),
          if (timeRanges.isNotEmpty) const Divider(),
          Wrap(
            spacing: 8.0,
            children: timeRanges.map((range) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Chip(
                  backgroundColor: Colors.black54,
                  shape: const StadiumBorder(),
                  label: Text(
                    range,
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  deleteIconColor: Colors.white,
                  deleteIcon: const Icon(
                    Icons.close,
                    size: 16,
                  ),
                  onDeleted: () {
                    setState(() {
                      timeRanges.remove(range);
                    });
                  },
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
