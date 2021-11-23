import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class InternalScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _InternalScreenState();
  }
}


class _InternalScreenState extends State<InternalScreen> {
  final ImagePicker _picker;

  _InternalScreenState() : _picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    _prepare();
  }

  Future<void> _prepare() async {
    await Future.delayed(Duration(seconds: 5));
    if (mounted) {
      setState(() {});
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('initial'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("internal screen"),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(10);
              },
              child: Text("10"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(20);
              },
              child: Text("20"),
            ),
            IconButton(
              onPressed: () async {
                final XFile? photo = await _picker.pickImage(source: ImageSource.camera);
              },
              icon: const Icon(Icons.camera),
            )
          ],
        ),
      ),
    );
  }
}
