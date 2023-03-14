import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';

class ArticleScreen extends StatefulWidget {
  @override
  _ArticleScreenState createState() => _ArticleScreenState();
}

class _ArticleScreenState extends State<ArticleScreen> {
  QuillController _controller = QuillController.basic();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Article'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: QuillEditor(
                  controller: _controller,
                  readOnly: false,
                  expands: false,
                  padding: EdgeInsets.zero,
                  autoFocus: true,
                ),
              ),
              SizedBox(height: 16),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      _formKey.currentState.save();
                      String articleContent = _controller.document.toPlainText();
                      // Save the article content to storage
                      // Display a success message
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Article posted'),
                          duration: Duration(seconds: 1),
                        ),
                      );
                      Navigator.pop(context);
                    }
                  },
                  child: Text('Post Article'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

