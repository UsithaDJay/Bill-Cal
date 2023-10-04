import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/widgets.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

Future<String> generatePdf(
  List<int> rangeBlk1,
  List<int> rangeBlk2,
  List<int> rangeBlk3,
  List<int> rangeBlk4,
  List<int> rangeBlk5,
  String calculationBlk1,
  String calculationBlk2,
  String calculationBlk3,
  String calculationBlk4,
  String calculationBlk5,
  double rateBlk1,
  double rateBlk2,
  double rateBlk3,
  double rateBlk4,
  double rateBlk5,
  double totUnitsCharge,
  double fixedCharge,
  double total,
  String name,
) async {
  final pdf = pw.Document();

  // Create the first table
  final table1 = pw.Table(
    border: pw.TableBorder.all(color: PdfColors.black),
    columnWidths: {
      0: const pw.FlexColumnWidth(1),
      1: const pw.FlexColumnWidth(2),
      2: const pw.FlexColumnWidth(1),
    },
    defaultVerticalAlignment: TableCellVerticalAlignment.middle,
    children: [
      pw.TableRow(
        verticalAlignment: TableCellVerticalAlignment.middle,
        children: [
          pw.Container(
              height: 32,
              alignment: Alignment.center,
              child: pw.Text('Block',
                  textAlign: pw.TextAlign.center,
                  style: pw.TextStyle(
                      fontWeight: pw.FontWeight.bold, color: PdfColors.white))),
          pw.Text('Calculation',
              textAlign: pw.TextAlign.center,
              style: pw.TextStyle(
                  fontWeight: pw.FontWeight.bold, color: PdfColors.white)),
          pw.Text('Amount',
              textAlign: pw.TextAlign.center,
              style: pw.TextStyle(
                  fontWeight: pw.FontWeight.bold, color: PdfColors.white)),
        ],
        decoration: const pw.BoxDecoration(
          color: PdfColors.blue900,
        ),
      ),
      if (rangeBlk1[1] != 0)
        pw.TableRow(
          children: [
            pw.Container(
              height: 16,
              alignment: Alignment.center,
              child: pw.Text(
                rangeBlk1.join(' - '),
                textAlign: pw.TextAlign.center,
              ),
            ),
            pw.Text(
              calculationBlk1.toString() + ' ',
              textAlign: pw.TextAlign.right,
            ),
            pw.Text(
              'Rs. ${rateBlk1.toStringAsFixed(2)} ',
              textAlign: pw.TextAlign.right,
            ),
          ],
        ),
      if (rangeBlk2[1] != 0)
        pw.TableRow(
          children: [
            pw.Container(
              height: 16,
              alignment: Alignment.center,
              child: pw.Text(
                rangeBlk2.join(' - '),
                textAlign: pw.TextAlign.center,
              ),
            ),
            pw.Text(
              calculationBlk2.toString() + ' ',
              textAlign: pw.TextAlign.right,
            ),
            pw.Text(
              'Rs. ${rateBlk2.toStringAsFixed(2)} ',
              textAlign: pw.TextAlign.right,
            ),
          ],
        ),
      if (rangeBlk3[1] != 0)
        pw.TableRow(
          children: [
            pw.Container(
              height: 16,
              alignment: Alignment.center,
              child: pw.Text(
                rangeBlk3.join(' - '),
                textAlign: pw.TextAlign.center,
              ),
            ),
            pw.Text(
              calculationBlk3.toString() + ' ',
              textAlign: pw.TextAlign.right,
            ),
            pw.Text(
              'Rs. ${rateBlk3.toStringAsFixed(2)} ',
              textAlign: pw.TextAlign.right,
            ),
          ],
        ),
      if (rangeBlk4[1] != 0)
        pw.TableRow(
          children: [
            pw.Container(
              height: 16,
              alignment: Alignment.center,
              child: pw.Text(
                rangeBlk4.join(' - '),
                textAlign: pw.TextAlign.center,
              ),
            ),
            pw.Text(
              calculationBlk4.toString() + ' ',
              textAlign: pw.TextAlign.right,
            ),
            pw.Text(
              'Rs. ${rateBlk4.toStringAsFixed(2)} ',
              textAlign: pw.TextAlign.right,
            ),
          ],
        ),
      if (rangeBlk5[1] != 0)
        pw.TableRow(
          children: [
            pw.Container(
              height: 16,
              alignment: Alignment.center,
              child: pw.Text(
                rangeBlk5.join(' - '),
                textAlign: pw.TextAlign.center,
              ),
            ),
            pw.Text(
              calculationBlk5.toString() + ' ',
              textAlign: pw.TextAlign.right,
            ),
            pw.Text(
              'Rs. ${rateBlk5.toStringAsFixed(2)} ',
              textAlign: pw.TextAlign.right,
            ),
          ],
        ),
    ],
  );

  // Create the second table
  final table2 = pw.Table(
    // border: pw.TableBorder.all(color: ),
    children: [
      pw.TableRow(
        children: [
          pw.Container(
            height: 16,
            alignment: Alignment.center,
            child: pw.Text('Total Units Charge',
                style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
          ),
          pw.Text('Rs. ${totUnitsCharge.toStringAsFixed(2)}'),
        ],
      ),
      pw.TableRow(
        children: [
          pw.Container(
            height: 16,
            alignment: Alignment.center,
            child: pw.Text('Fixed Charge',
                style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
          ),
          pw.Text('Rs. ${fixedCharge.toStringAsFixed(2)}'),
        ],
      ),
      pw.TableRow(
        children: [
          pw.Container(
            height: 16,
            alignment: Alignment.center,
            child: pw.Text('Total',
                style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
          ),
          pw.Text('Rs. ${total.toStringAsFixed(2)}'),
        ],
      ),
    ],
  );

  // Add both tables to the same page

  pdf.addPage(
    pw.Page(
      build: (pw.Context context) {
        return pw.Container(
          padding: const pw.EdgeInsets.all(16),
          decoration: pw.BoxDecoration(
            border: pw.Border.all(
              color: PdfColors.black,
              width: 2,
            ),
          ),
          child: pw.Column(
            children: [
              buildHeader(name),
              pw.Container(
                //I want to create a just a line to seperate the header from the tables below
                height: 1,
                width: double.infinity,
                color: PdfColors.blue900,
              ),
              pw.SizedBox(height: 8),
              pw.Container(
                  child: table1,
                  padding: const pw.EdgeInsets.only(
                      top: 12, bottom: 8, left: 8, right: 8)),
              pw.SizedBox(height: 8),
              pw.Container(child: table2, padding: pw.EdgeInsets.all(8)),
            ],
          ),
        );
      },
    ),
  );

  // Generate the PDF document and return the file path
  final pdfBytes = await pdf.save();

  final directory = await getTemporaryDirectory();
  final filePath = '${directory.path}/generated_pdf.pdf';
  final file = File(filePath);
  await file.writeAsBytes(pdfBytes.toList());

  return filePath;
}

Widget buildHeader(String name) => Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 1 * PdfPageFormat.cm),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(
              "Utility Calc",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              name,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        )
      ],
    );
