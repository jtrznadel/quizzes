import 'package:flutter/material.dart';
import 'package:quiz_app/core/errors/file_read_exception.dart';
import 'core/services/file_reader.dart';

class TempScreen extends StatelessWidget {
  const TempScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Temp Screen'),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () async {
                var content = '';
                try{
                  content = await FileReader.pickFileAndRead();
                } on FileReadException catch (exception){
                  content = exception.message;
                }
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('File Read'),
                    content: SingleChildScrollView(
                      child: Column(
                        children: [
                          Text(content),
                        ],
                      ),
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: const Text('OK'),
                      ),
                    ],
                  ),
                );
              },
              child: const Text('pick a file'),
            ),
          ],
        ),
      ),
    );
  }
}
