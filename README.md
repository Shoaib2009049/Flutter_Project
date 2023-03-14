# Flutter_Project
It is the project of simple profile page which contains name,gender,country,hobbies etc. The most interesting part is that it allow users to post articles in the live presence of project that make a joyful of being era of thecnology.
Let's get started!

Step 1: Create a new Flutter project
To get started, open up Android Studio (or your preferred IDE) and create a new Flutter project. You can name it whatever you like.

Step 2: Set up the basic app structure
In your main.dart file, set up the basic structure of your app by creating a MaterialApp widget. You can also create a separate file for your home page, which will contain the profile page.
Step 3: Create the profile page
In your home_page.dart file, create the profile page. You can use a Form widget to handle the validation of the required fields.
In this code, we define a `Form` widget with a `_formKey` that we'll use to validate and save the data. We create `TextFormField` widgets for each of the required fields (name, age, gender, country, and hobbies). We also define a `Center` widget containing an `ElevatedButton` that triggers the validation and saving of the form data.

## Step 4: Create the article posting screen

Next, we'll create a screen for users to create and post articles in rich text format. For this, we'll use the `FlutterQuill` package, which provides a rich text editor for Flutter.

First, we need to add the `flutter_quill` package to our project. To do this, open up your `pubspec.yaml` file and add the following line to the dependencies section:

```yaml
flutter_quill: ^2.0.0-rc.2
Then run flutter pub get in your terminal to download the package.

Next, create a new file called article_screen.dart and add the following code:

dart
Copy code
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
In this code, we define a QuillController and a _formKey just like we did for the profile page. We also create a QuillEditor widget, which is the rich text






