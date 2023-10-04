import 'package:flutter/material.dart';
import 'package:cal4/core/app_export.dart';
import 'package:cal4/customWidgets/custom_outlineBorder.dart';
import 'package:cal4/functions/pdf_generator_elec.dart';
import 'package:open_file/open_file.dart';

const List<String> _categoryList = [
  'Domestic',
  'Religious',
  'General Purpose -1',
  'Hotel -1',
  'Government -1',
  'Industrial -1'
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
      icon: const Icon(Icons.arrow_drop_down_outlined),
      elevation: 16,
      style: TextStyle(
          color: Colors.black,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w500,
          fontSize: getFontSize(12)),
      underline: Container(
        height: 2,
        color: Colors.black,
      ),
      onChanged: (String? value) {
        // This is called when the user selects an item.
        setState(() {
          dropdownValue = value!;
          widget.onSelected(dropdownValue);
        });
      },
      alignment: Alignment.centerLeft,
      items: _categoryList.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}

class CebBillWidget extends StatefulWidget {
  @override
  const CebBillWidget({Key? key}) : super(key: key);
  _CebBillWidgetState createState() => _CebBillWidgetState();
}

class _CebBillWidgetState extends State<CebBillWidget> {
  final _formKey = GlobalKey<FormState>();
  final _formKey1 = GlobalKey<FormState>();

  String? _selectedCategory;
  late int _units = 0;
  late int _days = 0;

  var rangeBlk1 = [0, 0];
  var rangeBlk2 = [0, 0];
  var rangeBlk3 = [0, 0];
  var rangeBlk4 = [0, 0];
  var rangeBlk5 = [0, 0];

  late String calculationBlk1;
  late String calculationBlk2;
  late String calculationBlk3;
  late String calculationBlk4;
  late String calculationBlk5;

  late double rateBlk1;
  late double rateBlk2;
  late double rateBlk3;
  late double rateBlk4;
  late double rateBlk5;

  late double _totUnitsCharge = 0;
  late double _fixedCharge = 0;
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

        calculationBlk1 = '';
        calculationBlk2 = '';
        calculationBlk3 = '';
        calculationBlk4 = '';
        calculationBlk5 = '';

        rateBlk1 = 0;
        rateBlk2 = 0;
        rateBlk3 = 0;
        rateBlk4 = 0;
        rateBlk5 = 0;

        _units = int.parse(_unitsController.text);
        _days = int.parse(_daysController.text);
        double marginMultiplier = _days / 30;
        switch (_selectedCategory) {
          case 'Domestic':
            int margin = (60 * marginMultiplier).round();

            if (_units > margin) {
              // block 1
              double block1Rate = 42;
              double _fixedCharge1 = 650;
              int margin1 = (90 * marginMultiplier).round();

              // block 2
              double block2Rate = 50;
              double _fixedCharge2 = 1500;
              int margin2 = (180 * marginMultiplier).round();

              // block 3
              double block3Rate = 75;
              double _fixedCharge3 = 2000;

              if (_units > margin2) {
                // blocks
                rangeBlk1 = [0, margin1];
                rangeBlk2 = [margin1, margin2];
                rangeBlk3 = [margin2, _units];

                // calculations
                calculationBlk1 = '$margin1 x $block1Rate';
                rateBlk1 = margin1 * block1Rate;

                calculationBlk2 = '${margin2 - margin1} x $block2Rate';
                rateBlk2 = (margin2 - margin1) * block2Rate;

                calculationBlk3 = '${_units - margin2} x $block3Rate';
                rateBlk3 = (_units - margin2) * block3Rate;

                _fixedCharge = _fixedCharge3;
              } else if (_units > margin1) {
                // blocks
                rangeBlk1 = [0, margin1];
                rangeBlk2 = [margin1, _units];

                // calculations
                calculationBlk1 = '$margin1 x $block1Rate';
                rateBlk1 = margin1 * block1Rate;

                calculationBlk2 = '${_units - margin1} x $block2Rate';
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
            } else {
              // block 1
              double block1Rate = 30;
              double _fixedCharge1 = 400;
              int margin1 = (30 * marginMultiplier).round();

              // block 2
              double block2Rate = 37;
              double _fixedCharge2 = 550;

              if (_units > margin1) {
                // blocks
                rangeBlk1 = [0, margin1];
                rangeBlk2 = [margin1, _units];

                // calculations
                calculationBlk1 = '$margin1 x $block1Rate';
                rateBlk1 = margin1 * block1Rate;

                calculationBlk2 = '${_units - margin1} x $block2Rate';
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
            }
            break;

          case 'Religious':
            // block 1
            double block1Rate = 30;
            double _fixedCharge1 = 400;
            int margin1 = (30 * marginMultiplier).round();

            // block 2
            double block2Rate = 37;
            double _fixedCharge2 = 550;
            int margin2 = (90 * marginMultiplier).round();

            // block 3
            double block3Rate = 42;
            double _fixedCharge3 = 650;
            int margin3 = (120 * marginMultiplier).round();

            // block 4
            double block4Rate = 45;
            double _fixedCharge4 = 1500;
            int margin4 = (180 * marginMultiplier).round();

            // block 5
            double block5Rate = 50;
            double _fixedCharge5 = 2000;

            if (_units > margin4) {
              // blocks
              rangeBlk1 = [0, margin1];
              rangeBlk2 = [margin1, margin2];
              rangeBlk3 = [margin2, margin3];
              rangeBlk4 = [margin3, margin4];
              rangeBlk5 = [margin4, _units];

              // calculations
              calculationBlk1 = '$margin1 x $block1Rate';
              rateBlk1 = margin1 * block1Rate;

              calculationBlk2 = '${margin2 - margin1} x $block2Rate';
              rateBlk2 = (margin2 - margin1) * block2Rate;

              calculationBlk3 = '${margin3 - margin2} x $block3Rate';
              rateBlk3 = (margin3 - margin2) * block3Rate;

              calculationBlk4 = '${margin4 - margin3} x $block4Rate';
              rateBlk4 = (margin4 - margin3) * block4Rate;

              calculationBlk5 = '${_units - margin4} x $block5Rate';
              rateBlk5 = (_units - margin4) * block5Rate;

              _fixedCharge = _fixedCharge5;
            } else if (_units > margin3) {
              // blocks
              rangeBlk1 = [0, margin1];
              rangeBlk2 = [margin1, margin2];
              rangeBlk3 = [margin2, margin3];
              rangeBlk4 = [margin3, _units];

              // calculations
              calculationBlk1 = '$margin1 x $block1Rate';
              rateBlk1 = margin1 * block1Rate;

              calculationBlk2 = '${margin2 - margin1} x $block2Rate';
              rateBlk2 = (margin2 - margin1) * block2Rate;

              calculationBlk3 = '${margin3 - margin2} x $block3Rate';
              rateBlk3 = (margin3 - margin2) * block3Rate;

              calculationBlk4 = '${_units - margin3} x $block4Rate';
              rateBlk4 = (_units - margin3) * block4Rate;

              _fixedCharge = _fixedCharge4;
            } else if (_units > margin2) {
              // blocks
              rangeBlk1 = [0, margin1];
              rangeBlk2 = [margin1, margin2];
              rangeBlk3 = [margin2, _units];

              // calculations
              calculationBlk1 = '$margin1 x $block1Rate';
              rateBlk1 = margin1 * block1Rate;

              calculationBlk2 = '${margin2 - margin1} x $block2Rate';
              rateBlk2 = (margin2 - margin1) * block2Rate;

              calculationBlk3 = '${_units - margin2} x $block3Rate';
              rateBlk3 = (_units - margin2) * block3Rate;

              _fixedCharge = _fixedCharge3;
            } else if (_units > margin1) {
              // blocks
              rangeBlk1 = [0, margin1];
              rangeBlk2 = [margin1, _units];

              // calculations
              calculationBlk1 = '$margin1 x $block1Rate';
              rateBlk1 = margin1 * block1Rate;

              calculationBlk2 = '${_units - margin1} x $block2Rate';
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

          case 'General Purpose -1':
            double block1Rate = 40;
            double _fixedCharge1 = 1000;
            double block2Rate = 47;
            double _fixedCharge2 = 1600;
            int margin = (180 * marginMultiplier).round();

            if (_units >= 0 && _units <= margin) {
              rangeBlk1 = [0, _units];
              calculationBlk1 = '$_units x $block1Rate';
              rateBlk1 = block1Rate * _units;
              _fixedCharge = _fixedCharge1;
            } else {
              rangeBlk2 = [0, _units];
              calculationBlk2 = '$_units x $block2Rate';
              rateBlk2 = block2Rate * _units;
              _fixedCharge = _fixedCharge2;
            }
            break;

          case 'Hotel -1':
            double block1Rate = 40;
            double _fixedCharge1 = 1000;
            double block2Rate = 47;
            double _fixedCharge2 = 1600;
            int margin = (180 * marginMultiplier).round();

            if (_units >= 0 && _units <= margin) {
              rangeBlk1 = [0, _units];
              calculationBlk1 = '$_units x $block1Rate';
              rateBlk1 = block1Rate * _units;
              _fixedCharge = _fixedCharge1;
            } else {
              rangeBlk2 = [0, _units];
              calculationBlk2 = '$_units x $block2Rate';
              rateBlk2 = block2Rate * _units;
              _fixedCharge = _fixedCharge2;
            }
            break;

          case 'Government -1':
            double block1Rate = 40;
            double _fixedCharge1 = 1000;
            double block2Rate = 47;
            double _fixedCharge2 = 1600;
            int margin = (180 * marginMultiplier).round();

            if (_units >= 0 && _units <= margin) {
              rangeBlk1 = [0, _units];
              calculationBlk1 = '$_units x $block1Rate';
              rateBlk1 = block1Rate * _units;
              _fixedCharge = _fixedCharge1;
            } else {
              rangeBlk2 = [0, _units];
              calculationBlk2 = '$_units x $block2Rate';
              rateBlk2 = block2Rate * _units;
              _fixedCharge = _fixedCharge2;
            }
            break;

          case 'Industrial -1':
            double block1Rate = 26;
            double _fixedCharge1 = 1200;
            double block2Rate = 26;
            double _fixedCharge2 = 1600;
            int margin = (300 * marginMultiplier).round();

            if (_units >= 0 && _units <= margin) {
              rangeBlk1 = [0, _units];
              calculationBlk1 = '$_units x $block1Rate';
              rateBlk1 = block1Rate * _units;
              _fixedCharge = _fixedCharge1;
            } else {
              rangeBlk2 = [0, _units];
              calculationBlk2 = '$_units x $block2Rate';
              rateBlk2 = block2Rate * _units;
              _fixedCharge = _fixedCharge2;
            }
        }

        _totUnitsCharge = rateBlk1 + rateBlk2 + rateBlk3 + rateBlk4 + rateBlk5;
        _total = _totUnitsCharge + _fixedCharge;
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
              "Ceylon Electricity Board",
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
                        Flexible(
                          child: Container(
                            margin: getMargin(
                              left: 5,
                            ),
                            padding: getPadding(
                              left: 20.5,
                              top: 12.5,
                              right: 20.5,
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
                                DropdownButton_(
                                  onSelected: (value) =>
                                      _selectedCategory = value,
                                ),
                                Padding(
                                  padding: getPadding(
                                    top: 1,
                                  ),
                                  child: SizedBox(
                                    width: getHorizontalSize(
                                      148,
                                    ),
                                    child: Divider(
                                      height: getVerticalSize(
                                        1,
                                      ),
                                      thickness: getVerticalSize(
                                        1,
                                      ),
                                      color: ColorConstant.whiteA700,
                                    ),
                                  ),
                                ),
                              ],
                            ),
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
                                if (value!.isEmpty) {
                                  return 'Please enter units consumed';
                                }
                                return null;
                              },
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
                                    borderColor: Colors
                                        .blue), // Use the custom border here

                                labelText: 'Number of Days',
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
                                if (value!.isEmpty) {
                                  return 'Please enter number of days';
                                }
                                return null;
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    ElevatedButton(
                      onPressed: () {
                        FocusScope.of(context).unfocus();
                        if (_formKey1.currentState?.validate() == true) {
                          _calculateBill();
                        }
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
                                child: _total != null
                                    ? const Text(
                                        'Total',
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
                              calculationBlk1,
                              calculationBlk2,
                              calculationBlk3,
                              calculationBlk4,
                              calculationBlk5,
                              rateBlk1,
                              rateBlk2,
                              rateBlk3,
                              rateBlk4,
                              rateBlk5,
                              _totUnitsCharge,
                              _fixedCharge,
                              _total,
                              "Ceylon Electricity Board");

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
