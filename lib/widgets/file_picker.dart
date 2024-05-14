// ignore_for_file: library_private_types_in_public_api, avoid_print

import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

class CustomFilePicker extends StatefulWidget {
  final String labelText;

  const CustomFilePicker({Key? key, required this.labelText}) : super(key: key);

  @override
  _CustomFilePickerState createState() => _CustomFilePickerState();
}

class _CustomFilePickerState extends State<CustomFilePicker> {
  List<String> _filePaths = [];

  Future<void> _pickFiles() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        allowMultiple: true,
        type: FileType.custom, // Specify the file types you want to pick
        allowedExtensions: ['pdf', 'doc', 'docx','jpg','png','html'], // Example file types
      );

      if (result != null) {
        setState(() {
          _filePaths = result.paths.map((path) => path!).toList();
        });
      }
    } catch (e) {
      print('Error picking files: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ElevatedButton(
          onPressed: _pickFiles,
          child: Text(widget.labelText),
        ),
        const SizedBox(height: 10),
        Text(
          'عدد الملفات : ${_filePaths.length}',
          style: const TextStyle(fontSize: 16),
        ),
        // Display file names or paths
        ListView.builder(
          shrinkWrap: true,
          itemCount: _filePaths.length,
          itemBuilder: (context, index) {
            return Text(" اسم الملف ${_filePaths[index]}");
          },
        ),
      ],
    );
  }
}
