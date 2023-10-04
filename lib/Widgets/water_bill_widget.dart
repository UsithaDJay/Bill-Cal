import 'package:flutter/material.dart';
import 'package:cal4/core/app_export.dart';
import 'package:cal4/customWidgets/custom_outlineBorder.dart';
import 'package:open_file/open_file.dart';
import 'package:cal4/functions/pdf_generator_water.dart';

const List<String> _categoryList = [
  'Domestic',
  'Domestic - Samurdhi',
  'Domestic - Tenement',
  'School/Religious',
  'Government/Non SME Industry',
  'SME Industry',
  'Commercial Institution',
  'Government Hospital',
  'Public Water Supply',
  'Port City/Ships',
  'BOI Industry',
  'Bulk Supply to LA & CBO'
];

class DropdownButton_ extends StatefulWidget {
  final Function(String?) onSelected;

  const DropdownButton_({Key? key, required this.onSelected}) : super(key: key);

  @override
  State<DropdownButton_> createState() => _DropdownButtonState();
}

class _DropdownButtonState extends State<DropdownButton_> {
  String dropdownValue = _categoryList.first;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: Icon(Icons.arrow_drop_down_outlined),
      elevation: 16,
      style: TextStyle(
        color: Colors.black,
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w500,
        fontSize: getFontSize(12),
      ),
      underline: Container(
        height: 1,
        color: Colors.black,
      ),
      onChanged: (String? value) {
        setState(() {
          dropdownValue = value!;
          widget.onSelected(dropdownValue);
        });
      },
      isExpanded:
          true, // Set this to true to make dropdown menu items fill the width
      selectedItemBuilder: (BuildContext context) {
        return _categoryList.map<Widget>((String value) {
          return Align(
            alignment: Alignment.centerLeft,
            child: SizedBox(
              width: getHorizontalSize(120), // Set a fixed width for the items
              child: Text(
                value,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          );
        }).toList();
      },
      items: _categoryList.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}

class WaterBillWidget extends StatefulWidget {
  @override
  const WaterBillWidget({Key? key}) : super(key: key);
  _WaterBillWidgetState createState() => _WaterBillWidgetState();
}

class _WaterBillWidgetState extends State<WaterBillWidget> {
  final _formKey = GlobalKey<FormState>();
  final _formKey1 = GlobalKey<FormState>();

  String? _selectedCategory;
  late double _units = 0;
  late int _days = 0;

  var rangeBlk1 = [0, 0.0];
  var rangeBlk2 = [0, 0.0];
  var rangeBlk3 = [0, 0.0];
  var rangeBlk4 = [0, 0.0];
  var rangeBlk5 = [0, 0.0];
  var rangeBlk6 = [0, 0.0];
  var rangeBlk7 = [0, 0.0];
  var rangeBlk8 = [0, 0.0];
  var rangeBlk9 = [0, 0.0];
  var rangeBlk10 = [0, 0.0];

  late String calculationBlk1;
  late String calculationBlk2;
  late String calculationBlk3;
  late String calculationBlk4;
  late String calculationBlk5;
  late String calculationBlk6;
  late String calculationBlk7;
  late String calculationBlk8;
  late String calculationBlk9;
  late String calculationBlk10;

  late double rateBlk1;
  late double rateBlk2;
  late double rateBlk3;
  late double rateBlk4;
  late double rateBlk5;
  late double rateBlk6;
  late double rateBlk7;
  late double rateBlk8;
  late double rateBlk9;
  late double rateBlk10;

  late double _totUnitsCharge = 0;
  late double _fixedCharge = 0;
  late final double _tax = 0.15;
  late double _totalWithoutTax = 0;
  late double _total = 0;

  final _unitsController = TextEditingController();
  final _daysController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _selectedCategory = _categoryList.first;
  }

  void _calculateBill() {
    if (_formKey.currentState?.validate() ?? false) {
      setState(() {
        rangeBlk1 = [0, 0];
        rangeBlk2 = [0, 0];
        rangeBlk3 = [0, 0];
        rangeBlk4 = [0, 0];
        rangeBlk5 = [0, 0];
        rangeBlk6 = [0, 0];
        rangeBlk7 = [0, 0];
        rangeBlk8 = [0, 0];
        rangeBlk9 = [0, 0];
        rangeBlk10 = [0, 0];

        calculationBlk1 = '';
        calculationBlk2 = '';
        calculationBlk3 = '';
        calculationBlk4 = '';
        calculationBlk5 = '';
        calculationBlk6 = '';
        calculationBlk7 = '';
        calculationBlk8 = '';
        calculationBlk9 = '';
        calculationBlk10 = '';

        rateBlk1 = 0;
        rateBlk2 = 0;
        rateBlk3 = 0;
        rateBlk4 = 0;
        rateBlk5 = 0;
        rateBlk6 = 0;
        rateBlk7 = 0;
        rateBlk8 = 0;
        rateBlk9 = 0;
        rateBlk10 = 0;

        _units = double.parse(_unitsController.text);
        _days = int.parse(_daysController.text);
        double marginMultiplier = _days / 30;

        switch (_selectedCategory) {
          case 'Domestic':
            // block 1
            double block1Rate = 20;
            double _fixedCharge1 = 300;
            double margin1 =
                double.parse((5 * marginMultiplier).toStringAsFixed(5));

            // block 2
            double block2Rate = 27;
            double _fixedCharge2 = 300;
            double margin2 =
                double.parse((10 * marginMultiplier).toStringAsFixed(5));

            // block 3
            double block3Rate = 34;
            double _fixedCharge3 = 300;
            double margin3 =
                double.parse((15 * marginMultiplier).toStringAsFixed(5));

            // block 4
            double block4Rate = 68;
            double _fixedCharge4 = 300;
            double margin4 =
                double.parse((20 * marginMultiplier).toStringAsFixed(5));

            // block 5
            double block5Rate = 99;
            double _fixedCharge5 = 300;
            double margin5 =
                double.parse((25 * marginMultiplier).toStringAsFixed(5));

            // block 6
            double block6Rate = 150;
            double _fixedCharge6 = 900;
            double margin6 =
                double.parse((30 * marginMultiplier).toStringAsFixed(5));

            // block 7
            double block7Rate = 179;
            double _fixedCharge7 = 900;
            double margin7 =
                double.parse((40 * marginMultiplier).toStringAsFixed(5));

            // block 8
            double block8Rate = 204;
            double _fixedCharge8 = 2400;
            double margin8 =
                double.parse((50 * marginMultiplier).toStringAsFixed(5));

            // block 9
            double block9Rate = 221;
            double _fixedCharge9 = 2400;
            double margin9 =
                double.parse((75 * marginMultiplier).toStringAsFixed(5));

            // block 10
            double block10Rate = 238;
            double _fixedCharge10 = 3500;

            if (_units > margin9) {
              // blocks
              rangeBlk1 = [0, margin1];
              rangeBlk2 = [margin1, margin2];
              rangeBlk3 = [margin2, margin3];
              rangeBlk4 = [margin3, margin4];
              rangeBlk5 = [margin4, margin5];
              rangeBlk6 = [margin5, margin6];
              rangeBlk7 = [margin6, margin7];
              rangeBlk8 = [margin7, margin8];
              rangeBlk9 = [margin8, margin9];
              rangeBlk10 = [margin9, _units];

              // calculations
              calculationBlk1 = '${margin1.toStringAsFixed(5)} x $block1Rate';
              rateBlk1 = margin1 * block1Rate;

              calculationBlk2 =
                  '${(margin2 - margin1).toStringAsFixed(5)} x $block2Rate';
              rateBlk2 = (margin2 - margin1) * block2Rate;

              calculationBlk3 =
                  '${(margin3 - margin2).toStringAsFixed(5)} x $block3Rate';
              rateBlk3 = (margin3 - margin2) * block3Rate;

              calculationBlk4 =
                  '${(margin4 - margin3).toStringAsFixed(5)} x $block4Rate';
              rateBlk4 = (margin4 - margin3) * block4Rate;

              calculationBlk5 =
                  '${(margin5 - margin4).toStringAsFixed(5)} x $block5Rate';
              rateBlk5 = (margin5 - margin4) * block5Rate;

              calculationBlk6 =
                  '${(margin6 - margin5).toStringAsFixed(5)} x $block6Rate';
              rateBlk6 = (margin6 - margin5) * block6Rate;

              calculationBlk7 =
                  '${(margin7 - margin6).toStringAsFixed(5)} x $block7Rate';
              rateBlk7 = (margin7 - margin6) * block7Rate;

              calculationBlk8 =
                  '${(margin8 - margin7).toStringAsFixed(5)} x $block8Rate';
              rateBlk8 = (margin8 - margin7) * block8Rate;

              calculationBlk9 =
                  '${(margin9 - margin8).toStringAsFixed(5)} x $block9Rate';
              rateBlk9 = (margin9 - margin8) * block9Rate;

              calculationBlk10 =
                  '${(_units - margin9).toStringAsFixed(5)} x $block10Rate';
              rateBlk10 = (_units - margin9) * block10Rate;

              _fixedCharge = _fixedCharge10;
            } else if (_units > margin8) {
              // blocks
              rangeBlk1 = [0, margin1];
              rangeBlk2 = [margin1, margin2];
              rangeBlk3 = [margin2, margin3];
              rangeBlk4 = [margin3, margin4];
              rangeBlk5 = [margin4, margin5];
              rangeBlk6 = [margin5, margin6];
              rangeBlk7 = [margin6, margin7];
              rangeBlk8 = [margin7, margin8];
              rangeBlk9 = [margin8, _units];

              // calculations
              calculationBlk1 = '${margin1.toStringAsFixed(5)} x $block1Rate';
              rateBlk1 = margin1 * block1Rate;

              calculationBlk2 =
                  '${(margin2 - margin1).toStringAsFixed(5)} x $block2Rate';
              rateBlk2 = (margin2 - margin1) * block2Rate;

              calculationBlk3 =
                  '${(margin3 - margin2).toStringAsFixed(5)} x $block3Rate';
              rateBlk3 = (margin3 - margin2) * block3Rate;

              calculationBlk4 =
                  '${(margin4 - margin3).toStringAsFixed(5)} x $block4Rate';
              rateBlk4 = (margin4 - margin3) * block4Rate;

              calculationBlk5 =
                  '${(margin5 - margin4).toStringAsFixed(5)} x $block5Rate';
              rateBlk5 = (margin5 - margin4) * block5Rate;

              calculationBlk6 =
                  '${(margin6 - margin5).toStringAsFixed(5)} x $block6Rate';
              rateBlk6 = (margin6 - margin5) * block6Rate;

              calculationBlk7 =
                  '${(margin7 - margin6).toStringAsFixed(5)} x $block7Rate';
              rateBlk7 = (margin7 - margin6) * block7Rate;

              calculationBlk8 =
                  '${(margin8 - margin7).toStringAsFixed(5)} x $block8Rate';
              rateBlk8 = (margin8 - margin7) * block8Rate;

              calculationBlk9 =
                  '${(_units - margin8).toStringAsFixed(5)} x $block9Rate';
              rateBlk9 = (_units - margin8) * block9Rate;

              _fixedCharge = _fixedCharge9;
            } else if (_units > margin7) {
              // blocks
              rangeBlk1 = [0, margin1];
              rangeBlk2 = [margin1, margin2];
              rangeBlk3 = [margin2, margin3];
              rangeBlk4 = [margin3, margin4];
              rangeBlk5 = [margin4, margin5];
              rangeBlk6 = [margin5, margin6];
              rangeBlk7 = [margin6, margin7];
              rangeBlk8 = [margin7, _units];

              // calculations
              calculationBlk1 = '${margin1.toStringAsFixed(5)} x $block1Rate';
              rateBlk1 = margin1 * block1Rate;

              calculationBlk2 =
                  '${(margin2 - margin1).toStringAsFixed(5)} x $block2Rate';
              rateBlk2 = (margin2 - margin1) * block2Rate;

              calculationBlk3 =
                  '${(margin3 - margin2).toStringAsFixed(5)} x $block3Rate';
              rateBlk3 = (margin3 - margin2) * block3Rate;

              calculationBlk4 =
                  '${(margin4 - margin3).toStringAsFixed(5)} x $block4Rate';
              rateBlk4 = (margin4 - margin3) * block4Rate;

              calculationBlk5 =
                  '${(margin5 - margin4).toStringAsFixed(5)} x $block5Rate';
              rateBlk5 = (margin5 - margin4) * block5Rate;

              calculationBlk6 =
                  '${(margin6 - margin5).toStringAsFixed(5)} x $block6Rate';
              rateBlk6 = (margin6 - margin5) * block6Rate;

              calculationBlk7 =
                  '${(margin7 - margin6).toStringAsFixed(5)} x $block7Rate';
              rateBlk7 = (margin7 - margin6) * block7Rate;

              calculationBlk8 =
                  '${(_units - margin7).toStringAsFixed(5)} x $block8Rate';
              rateBlk8 = (_units - margin7) * block8Rate;

              _fixedCharge = _fixedCharge8;
            } else if (_units > margin6) {
              // blocks
              rangeBlk1 = [0, margin1];
              rangeBlk2 = [margin1, margin2];
              rangeBlk3 = [margin2, margin3];
              rangeBlk4 = [margin3, margin4];
              rangeBlk5 = [margin4, margin5];
              rangeBlk6 = [margin5, margin6];
              rangeBlk7 = [margin6, _units];

              // calculations
              calculationBlk1 = '${margin1.toStringAsFixed(5)} x $block1Rate';
              rateBlk1 = margin1 * block1Rate;

              calculationBlk2 =
                  '${(margin2 - margin1).toStringAsFixed(5)} x $block2Rate';
              rateBlk2 = (margin2 - margin1) * block2Rate;

              calculationBlk3 =
                  '${(margin3 - margin2).toStringAsFixed(5)} x $block3Rate';
              rateBlk3 = (margin3 - margin2) * block3Rate;

              calculationBlk4 =
                  '${(margin4 - margin3).toStringAsFixed(5)} x $block4Rate';
              rateBlk4 = (margin4 - margin3) * block4Rate;

              calculationBlk5 =
                  '${(margin5 - margin4).toStringAsFixed(5)} x $block5Rate';
              rateBlk5 = (margin5 - margin4) * block5Rate;

              calculationBlk6 =
                  '${(margin6 - margin5).toStringAsFixed(5)} x $block6Rate';
              rateBlk6 = (margin6 - margin5) * block6Rate;

              calculationBlk7 =
                  '${(_units - margin6).toStringAsFixed(5)} x $block7Rate';
              rateBlk7 = (_units - margin6) * block7Rate;

              _fixedCharge = _fixedCharge7;
            } else if (_units > margin5) {
              // blocks
              rangeBlk1 = [0, margin1];
              rangeBlk2 = [margin1, margin2];
              rangeBlk3 = [margin2, margin3];
              rangeBlk4 = [margin3, margin4];
              rangeBlk5 = [margin4, margin5];
              rangeBlk6 = [margin5, _units];

              // calculations
              calculationBlk1 = '${margin1.toStringAsFixed(5)} x $block1Rate';
              rateBlk1 = margin1 * block1Rate;

              calculationBlk2 =
                  '${(margin2 - margin1).toStringAsFixed(5)} x $block2Rate';
              rateBlk2 = (margin2 - margin1) * block2Rate;

              calculationBlk3 =
                  '${(margin3 - margin2).toStringAsFixed(5)} x $block3Rate';
              rateBlk3 = (margin3 - margin2) * block3Rate;

              calculationBlk4 =
                  '${(margin4 - margin3).toStringAsFixed(5)} x $block4Rate';
              rateBlk4 = (margin4 - margin3) * block4Rate;

              calculationBlk5 =
                  '${(margin5 - margin4).toStringAsFixed(5)} x $block5Rate';
              rateBlk5 = (margin5 - margin4) * block5Rate;

              calculationBlk6 =
                  '${(_units - margin5).toStringAsFixed(5)} x $block6Rate';
              rateBlk6 = (_units - margin5) * block6Rate;

              _fixedCharge = _fixedCharge6;
            } else if (_units > margin4) {
              // blocks
              rangeBlk1 = [0, margin1];
              rangeBlk2 = [margin1, margin2];
              rangeBlk3 = [margin2, margin3];
              rangeBlk4 = [margin3, margin4];
              rangeBlk5 = [margin4, _units];

              // calculations
              calculationBlk1 = '${margin1.toStringAsFixed(5)} x $block1Rate';
              rateBlk1 = margin1 * block1Rate;

              calculationBlk2 =
                  '${(margin2 - margin1).toStringAsFixed(5)} x $block2Rate';
              rateBlk2 = (margin2 - margin1) * block2Rate;

              calculationBlk3 =
                  '${(margin3 - margin2).toStringAsFixed(5)} x $block3Rate';
              rateBlk3 = (margin3 - margin2) * block3Rate;

              calculationBlk4 =
                  '${(margin4 - margin3).toStringAsFixed(5)} x $block4Rate';
              rateBlk4 = (margin4 - margin3) * block4Rate;

              calculationBlk5 =
                  '${(_units - margin4).toStringAsFixed(5)} x $block5Rate';
              rateBlk5 = (_units - margin4) * block5Rate;

              _fixedCharge = _fixedCharge5;
            } else if (_units > margin3) {
              // blocks
              rangeBlk1 = [0, margin1];
              rangeBlk2 = [margin1, margin2];
              rangeBlk3 = [margin2, margin3];
              rangeBlk4 = [margin3, _units];

              // calculations
              calculationBlk1 = '${margin1.toStringAsFixed(5)} x $block1Rate';
              rateBlk1 = margin1 * block1Rate;

              calculationBlk2 =
                  '${(margin2 - margin1).toStringAsFixed(5)} x $block2Rate';
              rateBlk2 = (margin2 - margin1) * block2Rate;

              calculationBlk3 =
                  '${(margin3 - margin2).toStringAsFixed(5)} x $block3Rate';
              rateBlk3 = (margin3 - margin2) * block3Rate;

              calculationBlk4 =
                  '${(_units - margin3).toStringAsFixed(5)} x $block4Rate';
              rateBlk4 = (_units - margin3) * block4Rate;

              _fixedCharge = _fixedCharge4;
            } else if (_units > margin2) {
              // blocks
              rangeBlk1 = [0, margin1];
              rangeBlk2 = [margin1, margin2];
              rangeBlk3 = [margin2, _units];

              // calculations
              calculationBlk1 = '${margin1.toStringAsFixed(5)} x $block1Rate';
              rateBlk1 = margin1 * block1Rate;

              calculationBlk2 =
                  '${(margin2 - margin1).toStringAsFixed(5)} x $block2Rate';
              rateBlk2 = (margin2 - margin1) * block2Rate;

              calculationBlk3 =
                  '${(_units - margin2).toStringAsFixed(5)} x $block3Rate';
              rateBlk3 = (_units - margin2) * block3Rate;

              _fixedCharge = _fixedCharge3;
            } else if (_units > margin1) {
              // blocks
              rangeBlk1 = [0, margin1];
              rangeBlk2 = [margin1, _units];

              // calculations
              calculationBlk1 = '${margin1.toStringAsFixed(5)} x $block1Rate';
              rateBlk1 = margin1 * block1Rate;

              calculationBlk2 =
                  '${(_units - margin1).toStringAsFixed(5)} x $block2Rate';
              rateBlk2 = (_units - margin1) * block2Rate;

              _fixedCharge = _fixedCharge2;
            } else {
              // blocks
              rangeBlk1 = [0, _units];

              // calculations
              calculationBlk1 = '$_units x $block1Rate';
              rateBlk1 = _units * block1Rate;

              _fixedCharge = _fixedCharge1;
            }
            break;

          case 'Domestic - Samurdhi':
            // block 1
            double block1Rate = 5;
            double _fixedCharge1 = 100;
            double margin1 =
                double.parse((5 * marginMultiplier).toStringAsFixed(5));

            // block 2
            double block2Rate = 10;
            double _fixedCharge2 = 100;
            double margin2 =
                double.parse((10 * marginMultiplier).toStringAsFixed(5));

            // block 3
            double block3Rate = 15;
            double _fixedCharge3 = 100;
            double margin3 =
                double.parse((15 * marginMultiplier).toStringAsFixed(5));

            // block 4
            double block4Rate = 40;
            double _fixedCharge4 = 100;
            double margin4 =
                double.parse((20 * marginMultiplier).toStringAsFixed(5));

            // block 5
            double block5Rate = 58;
            double _fixedCharge5 = 100;
            double margin5 =
                double.parse((25 * marginMultiplier).toStringAsFixed(5));

            // block 6
            double block6Rate = 88;
            double _fixedCharge6 = 200;
            double margin6 =
                double.parse((30 * marginMultiplier).toStringAsFixed(5));

            // block 7
            double block7Rate = 105;
            double _fixedCharge7 = 400;
            double margin7 =
                double.parse((40 * marginMultiplier).toStringAsFixed(5));

            // block 8
            double block8Rate = 120;
            double _fixedCharge8 = 650;
            double margin8 =
                double.parse((50 * marginMultiplier).toStringAsFixed(5));

            // block 9
            double block9Rate = 130;
            double _fixedCharge9 = 1000;
            double margin9 =
                double.parse((75 * marginMultiplier).toStringAsFixed(5));

            // block 10
            double block10Rate = 140;
            double _fixedCharge10 = 1600;

            if (_units > margin9) {
              // blocks
              rangeBlk1 = [0, margin1];
              rangeBlk2 = [margin1, margin2];
              rangeBlk3 = [margin2, margin3];
              rangeBlk4 = [margin3, margin4];
              rangeBlk5 = [margin4, margin5];
              rangeBlk6 = [margin5, margin6];
              rangeBlk7 = [margin6, margin7];
              rangeBlk8 = [margin7, margin8];
              rangeBlk9 = [margin8, margin9];
              rangeBlk10 = [margin9, _units];

              // calculations
              calculationBlk1 = '${margin1.toStringAsFixed(5)} x $block1Rate';
              rateBlk1 = margin1 * block1Rate;

              calculationBlk2 =
                  '${(margin2 - margin1).toStringAsFixed(5)} x $block2Rate';
              rateBlk2 = (margin2 - margin1) * block2Rate;

              calculationBlk3 =
                  '${(margin3 - margin2).toStringAsFixed(5)} x $block3Rate';
              rateBlk3 = (margin3 - margin2) * block3Rate;

              calculationBlk4 =
                  '${(margin4 - margin3).toStringAsFixed(5)} x $block4Rate';
              rateBlk4 = (margin4 - margin3) * block4Rate;

              calculationBlk5 =
                  '${(margin5 - margin4).toStringAsFixed(5)} x $block5Rate';
              rateBlk5 = (margin5 - margin4) * block5Rate;

              calculationBlk6 =
                  '${(margin6 - margin5).toStringAsFixed(5)} x $block6Rate';
              rateBlk6 = (margin6 - margin5) * block6Rate;

              calculationBlk7 =
                  '${(margin7 - margin6).toStringAsFixed(5)} x $block7Rate';
              rateBlk7 = (margin7 - margin6) * block7Rate;

              calculationBlk8 =
                  '${(margin8 - margin7).toStringAsFixed(5)} x $block8Rate';
              rateBlk8 = (margin8 - margin7) * block8Rate;

              calculationBlk9 =
                  '${(margin9 - margin8).toStringAsFixed(5)} x $block9Rate';
              rateBlk9 = (margin9 - margin8) * block9Rate;

              calculationBlk10 =
                  '${(_units - margin9).toStringAsFixed(5)} x $block10Rate';
              rateBlk10 = (_units - margin9) * block10Rate;

              _fixedCharge = _fixedCharge10;
            } else if (_units > margin8) {
              // blocks
              rangeBlk1 = [0, margin1];
              rangeBlk2 = [margin1, margin2];
              rangeBlk3 = [margin2, margin3];
              rangeBlk4 = [margin3, margin4];
              rangeBlk5 = [margin4, margin5];
              rangeBlk6 = [margin5, margin6];
              rangeBlk7 = [margin6, margin7];
              rangeBlk8 = [margin7, margin8];
              rangeBlk9 = [margin8, _units];

              // calculations
              calculationBlk1 = '${margin1.toStringAsFixed(5)} x $block1Rate';
              rateBlk1 = margin1 * block1Rate;

              calculationBlk2 =
                  '${(margin2 - margin1).toStringAsFixed(5)} x $block2Rate';
              rateBlk2 = (margin2 - margin1) * block2Rate;

              calculationBlk3 =
                  '${(margin3 - margin2).toStringAsFixed(5)} x $block3Rate';
              rateBlk3 = (margin3 - margin2) * block3Rate;

              calculationBlk4 =
                  '${(margin4 - margin3).toStringAsFixed(5)} x $block4Rate';
              rateBlk4 = (margin4 - margin3) * block4Rate;

              calculationBlk5 =
                  '${(margin5 - margin4).toStringAsFixed(5)} x $block5Rate';
              rateBlk5 = (margin5 - margin4) * block5Rate;

              calculationBlk6 =
                  '${(margin6 - margin5).toStringAsFixed(5)} x $block6Rate';
              rateBlk6 = (margin6 - margin5) * block6Rate;

              calculationBlk7 =
                  '${(margin7 - margin6).toStringAsFixed(5)} x $block7Rate';
              rateBlk7 = (margin7 - margin6) * block7Rate;

              calculationBlk8 =
                  '${(margin8 - margin7).toStringAsFixed(5)} x $block8Rate';
              rateBlk8 = (margin8 - margin7) * block8Rate;

              calculationBlk9 =
                  '${(_units - margin8).toStringAsFixed(5)} x $block9Rate';
              rateBlk9 = (_units - margin8) * block9Rate;

              _fixedCharge = _fixedCharge9;
            } else if (_units > margin7) {
              // blocks
              rangeBlk1 = [0, margin1];
              rangeBlk2 = [margin1, margin2];
              rangeBlk3 = [margin2, margin3];
              rangeBlk4 = [margin3, margin4];
              rangeBlk5 = [margin4, margin5];
              rangeBlk6 = [margin5, margin6];
              rangeBlk7 = [margin6, margin7];
              rangeBlk8 = [margin7, _units];

              // calculations
              calculationBlk1 = '${margin1.toStringAsFixed(5)} x $block1Rate';
              rateBlk1 = margin1 * block1Rate;

              calculationBlk2 =
                  '${(margin2 - margin1).toStringAsFixed(5)} x $block2Rate';
              rateBlk2 = (margin2 - margin1) * block2Rate;

              calculationBlk3 =
                  '${(margin3 - margin2).toStringAsFixed(5)} x $block3Rate';
              rateBlk3 = (margin3 - margin2) * block3Rate;

              calculationBlk4 =
                  '${(margin4 - margin3).toStringAsFixed(5)} x $block4Rate';
              rateBlk4 = (margin4 - margin3) * block4Rate;

              calculationBlk5 =
                  '${(margin5 - margin4).toStringAsFixed(5)} x $block5Rate';
              rateBlk5 = (margin5 - margin4) * block5Rate;

              calculationBlk6 =
                  '${(margin6 - margin5).toStringAsFixed(5)} x $block6Rate';
              rateBlk6 = (margin6 - margin5) * block6Rate;

              calculationBlk7 =
                  '${(margin7 - margin6).toStringAsFixed(5)} x $block7Rate';
              rateBlk7 = (margin7 - margin6) * block7Rate;

              calculationBlk8 =
                  '${(_units - margin7).toStringAsFixed(5)} x $block8Rate';
              rateBlk8 = (_units - margin7) * block8Rate;

              _fixedCharge = _fixedCharge8;
            } else if (_units > margin6) {
              // blocks
              rangeBlk1 = [0, margin1];
              rangeBlk2 = [margin1, margin2];
              rangeBlk3 = [margin2, margin3];
              rangeBlk4 = [margin3, margin4];
              rangeBlk5 = [margin4, margin5];
              rangeBlk6 = [margin5, margin6];
              rangeBlk7 = [margin6, _units];

              // calculations
              calculationBlk1 = '${margin1.toStringAsFixed(5)} x $block1Rate';
              rateBlk1 = margin1 * block1Rate;

              calculationBlk2 =
                  '${(margin2 - margin1).toStringAsFixed(5)} x $block2Rate';
              rateBlk2 = (margin2 - margin1) * block2Rate;

              calculationBlk3 =
                  '${(margin3 - margin2).toStringAsFixed(5)} x $block3Rate';
              rateBlk3 = (margin3 - margin2) * block3Rate;

              calculationBlk4 =
                  '${(margin4 - margin3).toStringAsFixed(5)} x $block4Rate';
              rateBlk4 = (margin4 - margin3) * block4Rate;

              calculationBlk5 =
                  '${(margin5 - margin4).toStringAsFixed(5)} x $block5Rate';
              rateBlk5 = (margin5 - margin4) * block5Rate;

              calculationBlk6 =
                  '${(margin6 - margin5).toStringAsFixed(5)} x $block6Rate';
              rateBlk6 = (margin6 - margin5) * block6Rate;

              calculationBlk7 =
                  '${(_units - margin6).toStringAsFixed(5)} x $block7Rate';
              rateBlk7 = (_units - margin6) * block7Rate;

              _fixedCharge = _fixedCharge7;
            } else if (_units > margin5) {
              // blocks
              rangeBlk1 = [0, margin1];
              rangeBlk2 = [margin1, margin2];
              rangeBlk3 = [margin2, margin3];
              rangeBlk4 = [margin3, margin4];
              rangeBlk5 = [margin4, margin5];
              rangeBlk6 = [margin5, _units];

              // calculations
              calculationBlk1 = '${margin1.toStringAsFixed(5)} x $block1Rate';
              rateBlk1 = margin1 * block1Rate;

              calculationBlk2 =
                  '${(margin2 - margin1).toStringAsFixed(5)} x $block2Rate';
              rateBlk2 = (margin2 - margin1) * block2Rate;

              calculationBlk3 =
                  '${(margin3 - margin2).toStringAsFixed(5)} x $block3Rate';
              rateBlk3 = (margin3 - margin2) * block3Rate;

              calculationBlk4 =
                  '${(margin4 - margin3).toStringAsFixed(5)} x $block4Rate';
              rateBlk4 = (margin4 - margin3) * block4Rate;

              calculationBlk5 =
                  '${(margin5 - margin4).toStringAsFixed(5)} x $block5Rate';
              rateBlk5 = (margin5 - margin4) * block5Rate;

              calculationBlk6 =
                  '${(_units - margin5).toStringAsFixed(5)} x $block6Rate';
              rateBlk6 = (_units - margin5) * block6Rate;

              _fixedCharge = _fixedCharge6;
            } else if (_units > margin4) {
              // blocks
              rangeBlk1 = [0, margin1];
              rangeBlk2 = [margin1, margin2];
              rangeBlk3 = [margin2, margin3];
              rangeBlk4 = [margin3, margin4];
              rangeBlk5 = [margin4, _units];

              // calculations
              calculationBlk1 = '${margin1.toStringAsFixed(5)} x $block1Rate';
              rateBlk1 = margin1 * block1Rate;

              calculationBlk2 =
                  '${(margin2 - margin1).toStringAsFixed(5)} x $block2Rate';
              rateBlk2 = (margin2 - margin1) * block2Rate;

              calculationBlk3 =
                  '${(margin3 - margin2).toStringAsFixed(5)} x $block3Rate';
              rateBlk3 = (margin3 - margin2) * block3Rate;

              calculationBlk4 =
                  '${(margin4 - margin3).toStringAsFixed(5)} x $block4Rate';
              rateBlk4 = (margin4 - margin3) * block4Rate;

              calculationBlk5 =
                  '${(_units - margin4).toStringAsFixed(5)} x $block5Rate';
              rateBlk5 = (_units - margin4) * block5Rate;

              _fixedCharge = _fixedCharge5;
            } else if (_units > margin3) {
              // blocks
              rangeBlk1 = [0, margin1];
              rangeBlk2 = [margin1, margin2];
              rangeBlk3 = [margin2, margin3];
              rangeBlk4 = [margin3, _units];

              // calculations
              calculationBlk1 = '${margin1.toStringAsFixed(5)} x $block1Rate';
              rateBlk1 = margin1 * block1Rate;

              calculationBlk2 =
                  '${(margin2 - margin1).toStringAsFixed(5)} x $block2Rate';
              rateBlk2 = (margin2 - margin1) * block2Rate;

              calculationBlk3 =
                  '${(margin3 - margin2).toStringAsFixed(5)} x $block3Rate';
              rateBlk3 = (margin3 - margin2) * block3Rate;

              calculationBlk4 =
                  '${(_units - margin3).toStringAsFixed(5)} x $block4Rate';
              rateBlk4 = (_units - margin3) * block4Rate;

              _fixedCharge = _fixedCharge4;
            } else if (_units > margin2) {
              // blocks
              rangeBlk1 = [0, margin1];
              rangeBlk2 = [margin1, margin2];
              rangeBlk3 = [margin2, _units];

              // calculations
              calculationBlk1 = '${margin1.toStringAsFixed(5)} x $block1Rate';
              rateBlk1 = margin1 * block1Rate;

              calculationBlk2 =
                  '${(margin2 - margin1).toStringAsFixed(5)} x $block2Rate';
              rateBlk2 = (margin2 - margin1) * block2Rate;

              calculationBlk3 =
                  '${(_units - margin2).toStringAsFixed(5)} x $block3Rate';
              rateBlk3 = (_units - margin2) * block3Rate;

              _fixedCharge = _fixedCharge3;
            } else if (_units > margin1) {
              // blocks
              rangeBlk1 = [0, margin1];
              rangeBlk2 = [margin1, _units];

              // calculations
              calculationBlk1 = '${margin1.toStringAsFixed(5)} x $block1Rate';
              rateBlk1 = margin1 * block1Rate;

              calculationBlk2 =
                  '${(_units - margin1).toStringAsFixed(5)} x $block2Rate';
              rateBlk2 = (_units - margin1) * block2Rate;

              _fixedCharge = _fixedCharge2;
            } else {
              // blocks
              rangeBlk1 = [0, _units];

              // calculations
              calculationBlk1 = '$_units x $block1Rate';
              rateBlk1 = _units * block1Rate;

              _fixedCharge = _fixedCharge1;
            }
            break;

          case 'Domestic - Tenement':
            // block 1
            double block1Rate = 8;
            double _fixedCharge1 = 100;
            double margin1 =
                double.parse((5 * marginMultiplier).toStringAsFixed(5));

            // block 2
            double block2Rate = 11;
            double _fixedCharge2 = 100;
            double margin2 =
                double.parse((10 * marginMultiplier).toStringAsFixed(5));

            // block 3
            double block3Rate = 20;
            double _fixedCharge3 = 100;
            double margin3 =
                double.parse((15 * marginMultiplier).toStringAsFixed(5));

            // block 4
            double block4Rate = 40;
            double _fixedCharge4 = 100;
            double margin4 =
                double.parse((20 * marginMultiplier).toStringAsFixed(5));

            // block 5
            double block5Rate = 58;
            double _fixedCharge5 = 100;
            double margin5 =
                double.parse((25 * marginMultiplier).toStringAsFixed(5));

            // block 6
            double block6Rate = 88;
            double _fixedCharge6 = 200;
            double margin6 =
                double.parse((30 * marginMultiplier).toStringAsFixed(5));

            // block 7
            double block7Rate = 105;
            double _fixedCharge7 = 400;
            double margin7 =
                double.parse((40 * marginMultiplier).toStringAsFixed(5));

            // block 8
            double block8Rate = 120;
            double _fixedCharge8 = 650;
            double margin8 =
                double.parse((50 * marginMultiplier).toStringAsFixed(5));

            // block 9
            double block9Rate = 130;
            double _fixedCharge9 = 1000;
            double margin9 =
                double.parse((75 * marginMultiplier).toStringAsFixed(5));

            // block 10
            double block10Rate = 140;
            double _fixedCharge10 = 1600;

            if (_units > margin9) {
              // blocks
              rangeBlk1 = [0, margin1];
              rangeBlk2 = [margin1, margin2];
              rangeBlk3 = [margin2, margin3];
              rangeBlk4 = [margin3, margin4];
              rangeBlk5 = [margin4, margin5];
              rangeBlk6 = [margin5, margin6];
              rangeBlk7 = [margin6, margin7];
              rangeBlk8 = [margin7, margin8];
              rangeBlk9 = [margin8, margin9];
              rangeBlk10 = [margin9, _units];

              // calculations
              calculationBlk1 = '${margin1.toStringAsFixed(5)} x $block1Rate';
              rateBlk1 = margin1 * block1Rate;

              calculationBlk2 =
                  '${(margin2 - margin1).toStringAsFixed(5)} x $block2Rate';
              rateBlk2 = (margin2 - margin1) * block2Rate;

              calculationBlk3 =
                  '${(margin3 - margin2).toStringAsFixed(5)} x $block3Rate';
              rateBlk3 = (margin3 - margin2) * block3Rate;

              calculationBlk4 =
                  '${(margin4 - margin3).toStringAsFixed(5)} x $block4Rate';
              rateBlk4 = (margin4 - margin3) * block4Rate;

              calculationBlk5 =
                  '${(margin5 - margin4).toStringAsFixed(5)} x $block5Rate';
              rateBlk5 = (margin5 - margin4) * block5Rate;

              calculationBlk6 =
                  '${(margin6 - margin5).toStringAsFixed(5)} x $block6Rate';
              rateBlk6 = (margin6 - margin5) * block6Rate;

              calculationBlk7 =
                  '${(margin7 - margin6).toStringAsFixed(5)} x $block7Rate';
              rateBlk7 = (margin7 - margin6) * block7Rate;

              calculationBlk8 =
                  '${(margin8 - margin7).toStringAsFixed(5)} x $block8Rate';
              rateBlk8 = (margin8 - margin7) * block8Rate;

              calculationBlk9 =
                  '${(margin9 - margin8).toStringAsFixed(5)} x $block9Rate';
              rateBlk9 = (margin9 - margin8) * block9Rate;

              calculationBlk10 =
                  '${(_units - margin9).toStringAsFixed(5)} x $block10Rate';
              rateBlk10 = (_units - margin9) * block10Rate;

              _fixedCharge = _fixedCharge10;
            } else if (_units > margin8) {
              // blocks
              rangeBlk1 = [0, margin1];
              rangeBlk2 = [margin1, margin2];
              rangeBlk3 = [margin2, margin3];
              rangeBlk4 = [margin3, margin4];
              rangeBlk5 = [margin4, margin5];
              rangeBlk6 = [margin5, margin6];
              rangeBlk7 = [margin6, margin7];
              rangeBlk8 = [margin7, margin8];
              rangeBlk9 = [margin8, _units];

              // calculations
              calculationBlk1 = '${margin1.toStringAsFixed(5)} x $block1Rate';
              rateBlk1 = margin1 * block1Rate;

              calculationBlk2 =
                  '${(margin2 - margin1).toStringAsFixed(5)} x $block2Rate';
              rateBlk2 = (margin2 - margin1) * block2Rate;

              calculationBlk3 =
                  '${(margin3 - margin2).toStringAsFixed(5)} x $block3Rate';
              rateBlk3 = (margin3 - margin2) * block3Rate;

              calculationBlk4 =
                  '${(margin4 - margin3).toStringAsFixed(5)} x $block4Rate';
              rateBlk4 = (margin4 - margin3) * block4Rate;

              calculationBlk5 =
                  '${(margin5 - margin4).toStringAsFixed(5)} x $block5Rate';
              rateBlk5 = (margin5 - margin4) * block5Rate;

              calculationBlk6 =
                  '${(margin6 - margin5).toStringAsFixed(5)} x $block6Rate';
              rateBlk6 = (margin6 - margin5) * block6Rate;

              calculationBlk7 =
                  '${(margin7 - margin6).toStringAsFixed(5)} x $block7Rate';
              rateBlk7 = (margin7 - margin6) * block7Rate;

              calculationBlk8 =
                  '${(margin8 - margin7).toStringAsFixed(5)} x $block8Rate';
              rateBlk8 = (margin8 - margin7) * block8Rate;

              calculationBlk9 =
                  '${(_units - margin8).toStringAsFixed(5)} x $block9Rate';
              rateBlk9 = (_units - margin8) * block9Rate;

              _fixedCharge = _fixedCharge9;
            } else if (_units > margin7) {
              // blocks
              rangeBlk1 = [0, margin1];
              rangeBlk2 = [margin1, margin2];
              rangeBlk3 = [margin2, margin3];
              rangeBlk4 = [margin3, margin4];
              rangeBlk5 = [margin4, margin5];
              rangeBlk6 = [margin5, margin6];
              rangeBlk7 = [margin6, margin7];
              rangeBlk8 = [margin7, _units];

              // calculations
              calculationBlk1 = '${margin1.toStringAsFixed(5)} x $block1Rate';
              rateBlk1 = margin1 * block1Rate;

              calculationBlk2 =
                  '${(margin2 - margin1).toStringAsFixed(5)} x $block2Rate';
              rateBlk2 = (margin2 - margin1) * block2Rate;

              calculationBlk3 =
                  '${(margin3 - margin2).toStringAsFixed(5)} x $block3Rate';
              rateBlk3 = (margin3 - margin2) * block3Rate;

              calculationBlk4 =
                  '${(margin4 - margin3).toStringAsFixed(5)} x $block4Rate';
              rateBlk4 = (margin4 - margin3) * block4Rate;

              calculationBlk5 =
                  '${(margin5 - margin4).toStringAsFixed(5)} x $block5Rate';
              rateBlk5 = (margin5 - margin4) * block5Rate;

              calculationBlk6 =
                  '${(margin6 - margin5).toStringAsFixed(5)} x $block6Rate';
              rateBlk6 = (margin6 - margin5) * block6Rate;

              calculationBlk7 =
                  '${(margin7 - margin6).toStringAsFixed(5)} x $block7Rate';
              rateBlk7 = (margin7 - margin6) * block7Rate;

              calculationBlk8 =
                  '${(_units - margin7).toStringAsFixed(5)} x $block8Rate';
              rateBlk8 = (_units - margin7) * block8Rate;

              _fixedCharge = _fixedCharge8;
            } else if (_units > margin6) {
              // blocks
              rangeBlk1 = [0, margin1];
              rangeBlk2 = [margin1, margin2];
              rangeBlk3 = [margin2, margin3];
              rangeBlk4 = [margin3, margin4];
              rangeBlk5 = [margin4, margin5];
              rangeBlk6 = [margin5, margin6];
              rangeBlk7 = [margin6, _units];

              // calculations
              calculationBlk1 = '${margin1.toStringAsFixed(5)} x $block1Rate';
              rateBlk1 = margin1 * block1Rate;

              calculationBlk2 =
                  '${(margin2 - margin1).toStringAsFixed(5)} x $block2Rate';
              rateBlk2 = (margin2 - margin1) * block2Rate;

              calculationBlk3 =
                  '${(margin3 - margin2).toStringAsFixed(5)} x $block3Rate';
              rateBlk3 = (margin3 - margin2) * block3Rate;

              calculationBlk4 =
                  '${(margin4 - margin3).toStringAsFixed(5)} x $block4Rate';
              rateBlk4 = (margin4 - margin3) * block4Rate;

              calculationBlk5 =
                  '${(margin5 - margin4).toStringAsFixed(5)} x $block5Rate';
              rateBlk5 = (margin5 - margin4) * block5Rate;

              calculationBlk6 =
                  '${(margin6 - margin5).toStringAsFixed(5)} x $block6Rate';
              rateBlk6 = (margin6 - margin5) * block6Rate;

              calculationBlk7 =
                  '${(_units - margin6).toStringAsFixed(5)} x $block7Rate';
              rateBlk7 = (_units - margin6) * block7Rate;

              _fixedCharge = _fixedCharge7;
            } else if (_units > margin5) {
              // blocks
              rangeBlk1 = [0, margin1];
              rangeBlk2 = [margin1, margin2];
              rangeBlk3 = [margin2, margin3];
              rangeBlk4 = [margin3, margin4];
              rangeBlk5 = [margin4, margin5];
              rangeBlk6 = [margin5, _units];

              // calculations
              calculationBlk1 = '${margin1.toStringAsFixed(5)} x $block1Rate';
              rateBlk1 = margin1 * block1Rate;

              calculationBlk2 =
                  '${(margin2 - margin1).toStringAsFixed(5)} x $block2Rate';
              rateBlk2 = (margin2 - margin1) * block2Rate;

              calculationBlk3 =
                  '${(margin3 - margin2).toStringAsFixed(5)} x $block3Rate';
              rateBlk3 = (margin3 - margin2) * block3Rate;

              calculationBlk4 =
                  '${(margin4 - margin3).toStringAsFixed(5)} x $block4Rate';
              rateBlk4 = (margin4 - margin3) * block4Rate;

              calculationBlk5 =
                  '${(margin5 - margin4).toStringAsFixed(5)} x $block5Rate';
              rateBlk5 = (margin5 - margin4) * block5Rate;

              calculationBlk6 =
                  '${(_units - margin5).toStringAsFixed(5)} x $block6Rate';
              rateBlk6 = (_units - margin5) * block6Rate;

              _fixedCharge = _fixedCharge6;
            } else if (_units > margin4) {
              // blocks
              rangeBlk1 = [0, margin1];
              rangeBlk2 = [margin1, margin2];
              rangeBlk3 = [margin2, margin3];
              rangeBlk4 = [margin3, margin4];
              rangeBlk5 = [margin4, _units];

              // calculations
              calculationBlk1 = '${margin1.toStringAsFixed(5)} x $block1Rate';
              rateBlk1 = margin1 * block1Rate;

              calculationBlk2 =
                  '${(margin2 - margin1).toStringAsFixed(5)} x $block2Rate';
              rateBlk2 = (margin2 - margin1) * block2Rate;

              calculationBlk3 =
                  '${(margin3 - margin2).toStringAsFixed(5)} x $block3Rate';
              rateBlk3 = (margin3 - margin2) * block3Rate;

              calculationBlk4 =
                  '${(margin4 - margin3).toStringAsFixed(5)} x $block4Rate';
              rateBlk4 = (margin4 - margin3) * block4Rate;

              calculationBlk5 =
                  '${(_units - margin4).toStringAsFixed(5)} x $block5Rate';
              rateBlk5 = (_units - margin4) * block5Rate;

              _fixedCharge = _fixedCharge5;
            } else if (_units > margin3) {
              // blocks
              rangeBlk1 = [0, margin1];
              rangeBlk2 = [margin1, margin2];
              rangeBlk3 = [margin2, margin3];
              rangeBlk4 = [margin3, _units];

              // calculations
              calculationBlk1 = '${margin1.toStringAsFixed(5)} x $block1Rate';
              rateBlk1 = margin1 * block1Rate;

              calculationBlk2 =
                  '${(margin2 - margin1).toStringAsFixed(5)} x $block2Rate';
              rateBlk2 = (margin2 - margin1) * block2Rate;

              calculationBlk3 =
                  '${(margin3 - margin2).toStringAsFixed(5)} x $block3Rate';
              rateBlk3 = (margin3 - margin2) * block3Rate;

              calculationBlk4 =
                  '${(_units - margin3).toStringAsFixed(5)} x $block4Rate';
              rateBlk4 = (_units - margin3) * block4Rate;

              _fixedCharge = _fixedCharge4;
            } else if (_units > margin2) {
              // blocks
              rangeBlk1 = [0, margin1];
              rangeBlk2 = [margin1, margin2];
              rangeBlk3 = [margin2, _units];

              // calculations
              calculationBlk1 = '${margin1.toStringAsFixed(5)} x $block1Rate';
              rateBlk1 = margin1 * block1Rate;

              calculationBlk2 =
                  '${(margin2 - margin1).toStringAsFixed(5)} x $block2Rate';
              rateBlk2 = (margin2 - margin1) * block2Rate;

              calculationBlk3 =
                  '${(_units - margin2).toStringAsFixed(5)} x $block3Rate';
              rateBlk3 = (_units - margin2) * block3Rate;

              _fixedCharge = _fixedCharge3;
            } else if (_units > margin1) {
              // blocks
              rangeBlk1 = [0, margin1];
              rangeBlk2 = [margin1, _units];

              // calculations
              calculationBlk1 = '${margin1.toStringAsFixed(5)} x $block1Rate';
              rateBlk1 = margin1 * block1Rate;

              calculationBlk2 =
                  '${(_units - margin1).toStringAsFixed(5)} x $block2Rate';
              rateBlk2 = (_units - margin1) * block2Rate;

              _fixedCharge = _fixedCharge2;
            } else {
              // blocks
              rangeBlk1 = [0, _units];

              // calculations
              calculationBlk1 = '$_units x $block1Rate';
              rateBlk1 = _units * block1Rate;

              _fixedCharge = _fixedCharge1;
            }
            break;

          case 'School/Religious':
            // block 1
            double block1Rate = 6;
            double margin1 =
                double.parse((40 * marginMultiplier).toStringAsFixed(5));

            // block 2
            double block2Rate = 16;

            double _fixedCharge1 = 50;
            double _fixedCharge2 = 65;
            double _fixedCharge3 = 70;
            double _fixedCharge4 = 80;
            double _fixedCharge5 = 100;
            double _fixedCharge6 = 200;
            double _fixedCharge7 = 400;
            double _fixedCharge8 = 650;
            double _fixedCharge9 = 1000;
            double _fixedCharge10 = 1600;

            if (_units > margin1) {
              // blocks
              rangeBlk1 = [0, margin1];
              rangeBlk2 = [margin1, _units];

              // calculations
              calculationBlk1 = '${margin1.toStringAsFixed(5)} x $block1Rate';
              rateBlk1 = margin1 * block1Rate;

              calculationBlk2 =
                  '${(_units - margin1).toStringAsFixed(5)} x $block2Rate';
              rateBlk2 = (_units - margin1) * block2Rate;

              if (_units > (75 * marginMultiplier)) {
                _fixedCharge = _fixedCharge10;
              } else if (_units > (50 * marginMultiplier)) {
                _fixedCharge = _fixedCharge9;
              } else {
                _fixedCharge = _fixedCharge8;
              }
            } else {
              // blocks
              rangeBlk1 = [0, _units];

              // calculations
              calculationBlk1 = '$_units x $block1Rate';
              rateBlk1 = _units * block1Rate;

              if (_units > (30 * marginMultiplier)) {
                _fixedCharge = _fixedCharge7;
              } else if (_units > (25 * marginMultiplier)) {
                _fixedCharge = _fixedCharge6;
              } else if (_units > (20 * marginMultiplier)) {
                _fixedCharge = _fixedCharge5;
              } else if (_units > (15 * marginMultiplier)) {
                _fixedCharge = _fixedCharge4;
              } else if (_units > (10 * marginMultiplier)) {
                _fixedCharge = _fixedCharge3;
              } else if (_units > (5 * marginMultiplier)) {
                _fixedCharge = _fixedCharge2;
              } else {
                _fixedCharge = _fixedCharge1;
              }
            }
            break;

          case 'Government/Non SME Industry':
            double block1Rate = 82;
            rangeBlk1 = [0, _units];

            // calculations
            calculationBlk1 = '$_units x $block1Rate';
            rateBlk1 = _units * block1Rate;

            if (_units > (20000 * marginMultiplier)) {
              _fixedCharge = 110000;
            } else if (_units > (10000 * marginMultiplier)) {
              _fixedCharge = 55000;
            } else if (_units > (4000 * marginMultiplier)) {
              _fixedCharge = 27500;
            } else if (_units > (2000 * marginMultiplier)) {
              _fixedCharge = 13750;
            } else if (_units > (1000 * marginMultiplier)) {
              _fixedCharge = 8250;
            } else if (_units > (500 * marginMultiplier)) {
              _fixedCharge = 4400;
            } else if (_units > (200 * marginMultiplier)) {
              _fixedCharge = 2750;
            } else if (_units > (100 * marginMultiplier)) {
              _fixedCharge = 1760;
            } else if (_units > (75 * marginMultiplier)) {
              _fixedCharge = 1100;
            } else if (_units > (50 * marginMultiplier)) {
              _fixedCharge = 1100;
            } else if (_units > (25 * marginMultiplier)) {
              _fixedCharge = 550;
            } else {
              _fixedCharge = 300;
            }

            break;

          case 'SME Industry':
            double block1Rate = 78;
            rangeBlk1 = [0, _units];

            // calculations
            calculationBlk1 = '$_units x $block1Rate';
            rateBlk1 = _units * block1Rate;

            if (_units > (20000 * marginMultiplier)) {
              _fixedCharge = 105000;
            } else if (_units > (10000 * marginMultiplier)) {
              _fixedCharge = 52500;
            } else if (_units > (4000 * marginMultiplier)) {
              _fixedCharge = 26250;
            } else if (_units > (2000 * marginMultiplier)) {
              _fixedCharge = 13125;
            } else if (_units > (1000 * marginMultiplier)) {
              _fixedCharge = 7875;
            } else if (_units > (500 * marginMultiplier)) {
              _fixedCharge = 4200;
            } else if (_units > (200 * marginMultiplier)) {
              _fixedCharge = 2625;
            } else if (_units > (100 * marginMultiplier)) {
              _fixedCharge = 1680;
            } else if (_units > (75 * marginMultiplier)) {
              _fixedCharge = 1050;
            } else if (_units > (50 * marginMultiplier)) {
              _fixedCharge = 1050;
            } else if (_units > (25 * marginMultiplier)) {
              _fixedCharge = 525;
            } else {
              _fixedCharge = 300;
            }

            break;

          case 'Commercial Institution':
            double block1Rate = 116;
            rangeBlk1 = [0, _units];

            // calculations
            calculationBlk1 = '$_units x $block1Rate';
            rateBlk1 = _units * block1Rate;

            if (_units > (20000 * marginMultiplier)) {
              _fixedCharge = 115000;
            } else if (_units > (10000 * marginMultiplier)) {
              _fixedCharge = 57500;
            } else if (_units > (4000 * marginMultiplier)) {
              _fixedCharge = 28750;
            } else if (_units > (2000 * marginMultiplier)) {
              _fixedCharge = 14375;
            } else if (_units > (1000 * marginMultiplier)) {
              _fixedCharge = 8625;
            } else if (_units > (500 * marginMultiplier)) {
              _fixedCharge = 4600;
            } else if (_units > (200 * marginMultiplier)) {
              _fixedCharge = 2875;
            } else if (_units > (100 * marginMultiplier)) {
              _fixedCharge = 1840;
            } else if (_units > (75 * marginMultiplier)) {
              _fixedCharge = 1150;
            } else if (_units > (50 * marginMultiplier)) {
              _fixedCharge = 1150;
            } else if (_units > (25 * marginMultiplier)) {
              _fixedCharge = 575;
            } else {
              _fixedCharge = 300;
            }

            break;

          case 'Government Hospital':
            double block1Rate = 69;
            rangeBlk1 = [0, _units];

            // calculations
            calculationBlk1 = '$_units x $block1Rate';
            rateBlk1 = _units * block1Rate;

            if (_units > (20000 * marginMultiplier)) {
              _fixedCharge = 100000;
            } else if (_units > (10000 * marginMultiplier)) {
              _fixedCharge = 50000;
            } else if (_units > (4000 * marginMultiplier)) {
              _fixedCharge = 25000;
            } else if (_units > (2000 * marginMultiplier)) {
              _fixedCharge = 12500;
            } else if (_units > (1000 * marginMultiplier)) {
              _fixedCharge = 7500;
            } else if (_units > (500 * marginMultiplier)) {
              _fixedCharge = 4000;
            } else if (_units > (200 * marginMultiplier)) {
              _fixedCharge = 2500;
            } else if (_units > (100 * marginMultiplier)) {
              _fixedCharge = 1600;
            } else if (_units > (75 * marginMultiplier)) {
              _fixedCharge = 1000;
            } else if (_units > (50 * marginMultiplier)) {
              _fixedCharge = 1000;
            } else if (_units > (25 * marginMultiplier)) {
              _fixedCharge = 500;
            } else {
              _fixedCharge = 300;
            }

            break;

          case 'Port City/Ships':
            double block1Rate = 670;
            rangeBlk1 = [0, _units];

            // calculations
            calculationBlk1 = '$_units x $block1Rate';
            rateBlk1 = _units * block1Rate;

            if (_units > (20000 * marginMultiplier)) {
              _fixedCharge = 120000;
            } else if (_units > (10000 * marginMultiplier)) {
              _fixedCharge = 60000;
            } else if (_units > (4000 * marginMultiplier)) {
              _fixedCharge = 30000;
            } else if (_units > (2000 * marginMultiplier)) {
              _fixedCharge = 15000;
            } else if (_units > (1000 * marginMultiplier)) {
              _fixedCharge = 9000;
            } else if (_units > (500 * marginMultiplier)) {
              _fixedCharge = 4800;
            } else if (_units > (200 * marginMultiplier)) {
              _fixedCharge = 3000;
            } else if (_units > (100 * marginMultiplier)) {
              _fixedCharge = 1920;
            } else if (_units > (75 * marginMultiplier)) {
              _fixedCharge = 1200;
            } else if (_units > (50 * marginMultiplier)) {
              _fixedCharge = 1200;
            } else if (_units > (25 * marginMultiplier)) {
              _fixedCharge = 600;
            } else {
              _fixedCharge = 300;
            }

            break;

          case 'BOI Industry':
            double block1Rate = 85;
            rangeBlk1 = [0, _units];

            // calculations
            calculationBlk1 = '$_units x $block1Rate';
            rateBlk1 = _units * block1Rate;

            if (_units > (20000 * marginMultiplier)) {
              _fixedCharge = 115000;
            } else if (_units > (10000 * marginMultiplier)) {
              _fixedCharge = 57500;
            } else if (_units > (4000 * marginMultiplier)) {
              _fixedCharge = 28750;
            } else if (_units > (2000 * marginMultiplier)) {
              _fixedCharge = 14375;
            } else if (_units > (1000 * marginMultiplier)) {
              _fixedCharge = 8625;
            } else if (_units > (500 * marginMultiplier)) {
              _fixedCharge = 4600;
            } else if (_units > (200 * marginMultiplier)) {
              _fixedCharge = 2875;
            } else if (_units > (100 * marginMultiplier)) {
              _fixedCharge = 1840;
            } else if (_units > (75 * marginMultiplier)) {
              _fixedCharge = 1150;
            } else if (_units > (50 * marginMultiplier)) {
              _fixedCharge = 1150;
            } else if (_units > (25 * marginMultiplier)) {
              _fixedCharge = 575;
            } else {
              _fixedCharge = 300;
            }

            break;

          case 'Bulk Supply to LA & CBO':
            double block1Rate = 30;
            rangeBlk1 = [0, _units];

            // calculations
            calculationBlk1 = '$_units x $block1Rate';
            rateBlk1 = _units * block1Rate;

            if (_units > (20000 * marginMultiplier)) {
              _fixedCharge = 110000;
            } else if (_units > (10000 * marginMultiplier)) {
              _fixedCharge = 55000;
            } else if (_units > (4000 * marginMultiplier)) {
              _fixedCharge = 27500;
            } else if (_units > (2000 * marginMultiplier)) {
              _fixedCharge = 13750;
            } else if (_units > (1000 * marginMultiplier)) {
              _fixedCharge = 8250;
            } else if (_units > (500 * marginMultiplier)) {
              _fixedCharge = 4400;
            } else if (_units > (200 * marginMultiplier)) {
              _fixedCharge = 2750;
            } else if (_units > (100 * marginMultiplier)) {
              _fixedCharge = 1760;
            } else if (_units > (75 * marginMultiplier)) {
              _fixedCharge = 1100;
            } else if (_units > (50 * marginMultiplier)) {
              _fixedCharge = 1100;
            } else if (_units > (25 * marginMultiplier)) {
              _fixedCharge = 550;
            } else {
              _fixedCharge = 300;
            }

            break;

          case 'Public Water Supply':
            double block1Rate = 15;
            rangeBlk1 = [0, _units];

            // calculations
            calculationBlk1 = '$_units x $block1Rate';
            rateBlk1 = _units * block1Rate;

            if (_units > (200 * marginMultiplier)) {
              _fixedCharge = 2500;
            } else if (_units > (100 * marginMultiplier)) {
              _fixedCharge = 1600;
            } else if (_units > (50 * marginMultiplier)) {
              _fixedCharge = 1000;
            } else if (_units > (25 * marginMultiplier)) {
              _fixedCharge = 500;
            } else {
              _fixedCharge = 300;
            }

            break;
        }

        _totUnitsCharge = rateBlk1 +
            rateBlk2 +
            rateBlk3 +
            rateBlk4 +
            rateBlk5 +
            rateBlk6 +
            rateBlk7 +
            rateBlk8 +
            rateBlk9 +
            rateBlk10;
        _totalWithoutTax = _totUnitsCharge + _fixedCharge;
        _total = _totalWithoutTax * (1 + _tax);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              "National Water Board",
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.left,
              style: AppStyle.txtGlegooBold24Pink900,
            ),
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: getPadding(
                            left: 16,
                            top: 21,
                            right: 16,
                            bottom: 21,
                          ),
                          decoration:
                              AppDecoration.outlineBluegray700b2.copyWith(
                            borderRadius: BorderRadiusStyle.roundedBorder9,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: getHorizontalSize(
                                  123,
                                ),
                                margin: getMargin(
                                  bottom: 3,
                                ),
                                child: Text(
                                  "Consumer Category\n(code)",
                                  maxLines: null,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtPoppinsMedium12,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: 195,
                          margin: getMargin(
                            left: 5,
                          ),
                          padding: getPadding(
                            left: 20,
                            top: 12.5,
                            right: 25,
                            bottom: 12.5,
                          ),
                          decoration:
                              AppDecoration.outlineBluegray700b2.copyWith(
                            borderRadius: BorderRadiusStyle.roundedBorder9,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 195,
                                child: DropdownButton_(
                                  onSelected: (value) =>
                                      _selectedCategory = value,
                                ),
                              ),
                              Padding(
                                padding: getPadding(
                                  top: 1,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16.0),
                    Form(
                      key: _formKey1,
                      child: Column(
                        children: [
                          Container(
                            color: ColorConstant.whiteA700,
                            child: TextFormField(
                              controller: _unitsController,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                border:
                                    CustomOutlineInputBorder(), // Use the custom border here
                                enabledBorder:
                                    CustomOutlineInputBorder(), // Use the custom border here
                                focusedBorder: CustomOutlineInputBorder(
                                    borderColor: Colors
                                        .blue), // Use the custom border here

                                labelText: 'Units Consumed',
                                labelStyle: const TextStyle(
                                  fontWeight: FontWeight
                                      .bold, // Set the fontWeight to bold
                                ),
                              ),
                              onEditingComplete: () {
                                if (_formKey1.currentState?.validate() ==
                                    true) {
                                  _calculateBill();
                                  FocusScope.of(context).unfocus();
                                }
                              },
                              validator: (value) {
                                // print("units" + value.toString());
                                if (value!.isEmpty) {
                                  return 'Please enter units consumed';
                                }
                                return null;
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    Container(
                      color: ColorConstant.whiteA700,
                      child: TextFormField(
                        controller: _daysController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border:
                              CustomOutlineInputBorder(), // Use the custom border here
                          enabledBorder:
                              CustomOutlineInputBorder(), // Use the custom border here
                          focusedBorder: CustomOutlineInputBorder(
                              borderColor:
                                  Colors.blue), // Use the custom border here

                          labelText: 'Number of Days',
                          labelStyle: const TextStyle(
                            fontWeight:
                                FontWeight.bold, // Set the fontWeight to bold
                          ),
                        ),
                        onEditingComplete: () {
                          if (_formKey1.currentState?.validate() == true) {
                            _calculateBill();
                            FocusScope.of(context).unfocus();
                          }
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter number of days';
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    ElevatedButton(
                      // print _billAmount in terminal
                      onPressed: () {
                        FocusScope.of(context).unfocus();
                        if (_formKey1.currentState?.validate() == true) {
                          _calculateBill();
                        }
                        // _focusNode.unfocus();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ColorConstant.blue90096,
                        padding: const EdgeInsets.symmetric(
                            vertical: 25, horizontal: 12),
                        minimumSize: const Size(150, 40),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      child: const Text(
                        'Calculate Bill',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(height: 30.0),
                    // blocks
                    Table(
                      border: TableBorder.all(color: ColorConstant.blue90096),
                      children: [
                        const TableRow(
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 93, 116, 177),
                          ),
                          children: [
                            TableCell(
                              child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  'Block',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            TableCell(
                              child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  'Calculation',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            TableCell(
                              child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  'Amount',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ],
                        ),
                        TableRow(
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                          ),
                          children: [
                            TableCell(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: rangeBlk1[1] != 0
                                    ? Text(
                                        '${rangeBlk1[0]} - ${rangeBlk1[1]}',
                                        textAlign: TextAlign.center,
                                      )
                                    : Container(),
                              ),
                            ),
                            TableCell(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: rangeBlk1[1] != 0
                                    ? Text(
                                        calculationBlk1,
                                        textAlign: TextAlign.center,
                                      )
                                    : Container(),
                              ),
                            ),
                            TableCell(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: rangeBlk1[1] != 0
                                    ? Text(
                                        'Rs. ${rateBlk1.toStringAsFixed(2)}',
                                        textAlign: TextAlign.center,
                                      )
                                    : Container(),
                              ),
                            ),
                          ],
                        ),
                        TableRow(
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                          ),
                          children: [
                            TableCell(
                              child: rangeBlk2[1] != 0
                                  ? Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        '${rangeBlk2[0]} - ${rangeBlk2[1]}',
                                        textAlign: TextAlign.center,
                                      ))
                                  : Container(),
                            ),
                            TableCell(
                              child: rangeBlk2[1] != 0
                                  ? Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        calculationBlk2,
                                        textAlign: TextAlign.center,
                                      ))
                                  : Container(),
                            ),
                            TableCell(
                              child: rangeBlk2[1] != 0
                                  ? Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        'Rs. ${rateBlk2.toStringAsFixed(2)}',
                                        textAlign: TextAlign.center,
                                      ))
                                  : Container(),
                            ),
                          ],
                        ),
                        TableRow(
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                          ),
                          children: [
                            TableCell(
                              child: rangeBlk3[1] != 0
                                  ? Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        '${rangeBlk3[0]} - ${rangeBlk3[1]}',
                                        textAlign: TextAlign.center,
                                      ))
                                  : Container(),
                            ),
                            TableCell(
                              child: rangeBlk3[1] != 0
                                  ? Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        calculationBlk3,
                                        textAlign: TextAlign.center,
                                      ))
                                  : Container(),
                            ),
                            TableCell(
                              child: rangeBlk3[1] != 0
                                  ? Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        'Rs. ${rateBlk3.toStringAsFixed(2)}',
                                        textAlign: TextAlign.center,
                                      ))
                                  : Container(),
                            ),
                          ],
                        ),
                        TableRow(
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                          ),
                          children: [
                            TableCell(
                              child: rangeBlk4[1] != 0
                                  ? Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        '${rangeBlk4[0]} - ${rangeBlk4[1]}',
                                        textAlign: TextAlign.center,
                                      ))
                                  : Container(),
                            ),
                            TableCell(
                              child: rangeBlk4[1] != 0
                                  ? Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        calculationBlk4,
                                        textAlign: TextAlign.center,
                                      ))
                                  : Container(),
                            ),
                            TableCell(
                              child: rangeBlk4[1] != 0
                                  ? Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        'Rs. ${rateBlk4.toStringAsFixed(2)}',
                                        textAlign: TextAlign.center,
                                      ))
                                  : Container(),
                            ),
                          ],
                        ),
                        TableRow(
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                          ),
                          children: [
                            TableCell(
                              child: rangeBlk5[1] != 0
                                  ? Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        '${rangeBlk5[0]} - ${rangeBlk5[1]}',
                                        textAlign: TextAlign.center,
                                      ))
                                  : Container(),
                            ),
                            TableCell(
                              child: rangeBlk5[1] != 0
                                  ? Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        calculationBlk5,
                                        textAlign: TextAlign.center,
                                      ))
                                  : Container(),
                            ),
                            TableCell(
                              child: rangeBlk5[1] != 0
                                  ? Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        'Rs. ${rateBlk5.toStringAsFixed(2)}',
                                        textAlign: TextAlign.center,
                                      ))
                                  : Container(),
                            ),
                          ],
                        ),
                        TableRow(
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                          ),
                          children: [
                            TableCell(
                              child: rangeBlk6[1] != 0
                                  ? Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        '${rangeBlk6[0]} - ${rangeBlk6[1]}',
                                        textAlign: TextAlign.center,
                                      ))
                                  : Container(),
                            ),
                            TableCell(
                              child: rangeBlk6[1] != 0
                                  ? Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        calculationBlk6,
                                        textAlign: TextAlign.center,
                                      ))
                                  : Container(),
                            ),
                            TableCell(
                              child: rangeBlk6[1] != 0
                                  ? Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        'Rs. ${rateBlk6.toStringAsFixed(2)}',
                                        textAlign: TextAlign.center,
                                      ))
                                  : Container(),
                            ),
                          ],
                        ),
                        TableRow(
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                          ),
                          children: [
                            TableCell(
                              child: rangeBlk7[1] != 0
                                  ? Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        '${rangeBlk7[0]} - ${rangeBlk7[1]}',
                                        textAlign: TextAlign.center,
                                      ))
                                  : Container(),
                            ),
                            TableCell(
                              child: rangeBlk7[1] != 0
                                  ? Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        calculationBlk7,
                                        textAlign: TextAlign.center,
                                      ))
                                  : Container(),
                            ),
                            TableCell(
                              child: rangeBlk7[1] != 0
                                  ? Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        'Rs. ${rateBlk7.toStringAsFixed(2)}',
                                        textAlign: TextAlign.center,
                                      ))
                                  : Container(),
                            ),
                          ],
                        ),
                        TableRow(
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                          ),
                          children: [
                            TableCell(
                              child: rangeBlk8[1] != 0
                                  ? Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        '${rangeBlk8[0]} - ${rangeBlk8[1]}',
                                        textAlign: TextAlign.center,
                                      ))
                                  : Container(),
                            ),
                            TableCell(
                              child: rangeBlk8[1] != 0
                                  ? Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        calculationBlk8,
                                        textAlign: TextAlign.center,
                                      ))
                                  : Container(),
                            ),
                            TableCell(
                              child: rangeBlk8[1] != 0
                                  ? Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        'Rs. ${rateBlk8.toStringAsFixed(2)}',
                                        textAlign: TextAlign.center,
                                      ))
                                  : Container(),
                            ),
                          ],
                        ),
                        TableRow(
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                          ),
                          children: [
                            TableCell(
                              child: rangeBlk9[1] != 0
                                  ? Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        '${rangeBlk9[0]} - ${rangeBlk9[1]}',
                                        textAlign: TextAlign.center,
                                      ))
                                  : Container(),
                            ),
                            TableCell(
                              child: rangeBlk9[1] != 0
                                  ? Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        calculationBlk9,
                                        textAlign: TextAlign.center,
                                      ))
                                  : Container(),
                            ),
                            TableCell(
                              child: rangeBlk9[1] != 0
                                  ? Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        'Rs. ${rateBlk9.toStringAsFixed(2)}',
                                        textAlign: TextAlign.center,
                                      ))
                                  : Container(),
                            ),
                          ],
                        ),
                        TableRow(
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                          ),
                          children: [
                            TableCell(
                              child: rangeBlk10[1] != 0
                                  ? Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        '${rangeBlk10[0]} - ${rangeBlk10[1]}',
                                        textAlign: TextAlign.center,
                                      ))
                                  : Container(),
                            ),
                            TableCell(
                              child: rangeBlk10[1] != 0
                                  ? Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        calculationBlk10,
                                        textAlign: TextAlign.center,
                                      ))
                                  : Container(),
                            ),
                            TableCell(
                              child: rangeBlk10[1] != 0
                                  ? Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        'Rs. ${rateBlk10.toStringAsFixed(2)}',
                                        textAlign: TextAlign.center,
                                      ))
                                  : Container(),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 16.0),
                    Table(
                      border: TableBorder.all(color: ColorConstant.blue90096),
                      defaultVerticalAlignment:
                          TableCellVerticalAlignment.middle,
                      children: [
                        TableRow(
                          children: [
                            TableCell(
                              child: Container(
                                padding: const EdgeInsets.all(8.0),
                                decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                ),
                                // ignore: unnecessary_null_comparison
                                child: _totUnitsCharge != null
                                    ? const Text(
                                        'Total Units Charge',
                                        // textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      )
                                    : Container(),
                              ),
                            ),
                            TableCell(
                              child: Container(
                                padding: const EdgeInsets.all(8.0),
                                decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                ),
                                // ignore: unnecessary_null_comparison
                                child: _totUnitsCharge != null
                                    ? Text(
                                        'Rs. ${_totUnitsCharge.toStringAsFixed(2)}',
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold),
                                      )
                                    : Container(),
                              ),
                            ),
                          ],
                        ),
                        TableRow(
                          children: [
                            TableCell(
                              child: Container(
                                padding: const EdgeInsets.all(8.0),
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                ),
                                // ignore: unnecessary_null_comparison
                                child: _fixedCharge != null
                                    ? const Text(
                                        'Fixed Charge',
                                        // textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      )
                                    : Container(),
                              ),
                            ),
                            TableCell(
                              child: Container(
                                padding: const EdgeInsets.all(8.0),
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                ),
                                // ignore: unnecessary_null_comparison
                                child: _fixedCharge != null
                                    ? Text(
                                        'Rs. ${_fixedCharge.toStringAsFixed(2)}',
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold),
                                      )
                                    : Container(),
                              ),
                            ),
                          ],
                        ),
                        TableRow(
                          children: [
                            TableCell(
                              child: Container(
                                padding: const EdgeInsets.all(8.0),
                                decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                ),
                                // ignore: unnecessary_null_comparison
                                child: _totalWithoutTax != null
                                    ? const Text(
                                        'Total Without Tax',
                                        // textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      )
                                    : Container(),
                              ),
                            ),
                            TableCell(
                              child: Container(
                                padding: const EdgeInsets.all(8.0),
                                decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                ),
                                // ignore: unnecessary_null_comparison
                                child: _totalWithoutTax != null
                                    ? Text(
                                        'Rs. ${_totalWithoutTax.toStringAsFixed(2)}',
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold),
                                      )
                                    : Container(),
                              ),
                            ),
                          ],
                        ),
                        TableRow(
                          children: [
                            TableCell(
                              child: Container(
                                padding: const EdgeInsets.all(8.0),
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                ),
                                // ignore: unnecessary_null_comparison
                                child: _tax != null
                                    ? const Text(
                                        'Tax',
                                        // textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      )
                                    : Container(),
                              ),
                            ),
                            TableCell(
                              child: Container(
                                padding: const EdgeInsets.all(8.0),
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                ),
                                // ignore: unnecessary_null_comparison
                                child: _tax != null
                                    ? Text(
                                        '${_tax * 100} %',
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold),
                                      )
                                    : Container(),
                              ),
                            ),
                          ],
                        ),
                        TableRow(
                          children: [
                            TableCell(
                              child: Container(
                                padding: const EdgeInsets.all(8.0),
                                decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                ),
                                // ignore: unnecessary_null_comparison
                                child: _total != null
                                    ? const Text(
                                        'Total',
                                        // textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      )
                                    : Container(),
                              ),
                            ),
                            TableCell(
                              child: Container(
                                padding: const EdgeInsets.all(8.0),
                                decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                ),
                                // ignore: unnecessary_null_comparison
                                child: _total != null
                                    ? Text(
                                        'Rs. ${_total.toStringAsFixed(2)}',
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold),
                                      )
                                    : Container(),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    ButtonBar(alignment: MainAxisAlignment.center, children: [
                      ElevatedButton(
                        onPressed: () async {
                          // Call the generatePdf function and wait for the result
                          final filePath = await generatePdf(
                              rangeBlk1,
                              rangeBlk2,
                              rangeBlk3,
                              rangeBlk4,
                              rangeBlk5,
                              rangeBlk6,
                              rangeBlk7,
                              rangeBlk8,
                              rangeBlk9,
                              rangeBlk10,
                              calculationBlk1,
                              calculationBlk2,
                              calculationBlk3,
                              calculationBlk4,
                              calculationBlk5,
                              calculationBlk6,
                              calculationBlk7,
                              calculationBlk8,
                              calculationBlk9,
                              calculationBlk10,
                              rateBlk1,
                              rateBlk2,
                              rateBlk3,
                              rateBlk4,
                              rateBlk5,
                              rateBlk6,
                              rateBlk7,
                              rateBlk8,
                              rateBlk9,
                              rateBlk10,
                              _totUnitsCharge,
                              _fixedCharge,
                              _tax,
                              _totalWithoutTax,
                              _total,
                              "National Water Board");

                          // Open the PDF file
                          OpenResult result = await OpenFile.open(filePath);

                          // Check if the file was successfully opened
                          if (result.type != ResultType.done) {
                            // Show an error dialog if the file couldn't be opened
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: Text('Error'),
                                content: Text('Could not open the PDF file.'),
                                actions: [
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text('OK'),
                                  ),
                                ],
                              ),
                            );
                          } else {
                            // Show a dialog indicating that the PDF was opened successfully
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: Text('PDF Opened'),
                                content: Text('The PDF file has been opened.'),
                                actions: [
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text('OK'),
                                  ),
                                ],
                              ),
                            );
                          }
                        },
                        child: const Text('Generate PDF'),
                      ),
                    ]),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
