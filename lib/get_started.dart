import 'package:rebuilder_docs/documentation/documentations.dart';
import 'package:rebuilder_docs/main.dart';

class GetStartedPage extends StatelessWidget {
  const GetStartedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('States Rebuilder'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Card(
              color: Colors.blue[100],
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(settings().borderRadius),
              ),
              child: Column(
                children: [
                  Text(
                    'Introduction to States Rebuilder',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ).pad(),
                  Text(
                    'An elegant state management solution with zero boilerplate. '
                    'It separates UI from business logic and supports both '
                    'immutable and mutable states, making development predictable and controllable.',
                  ).pad(),
                ],
              ).pad(),
            ).pad(),
            Card(
              color: Colors.green[100],
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(settings().borderRadius),
              ),
              child: Column(
                children: [
                  Text(
                    'Key Features',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ).pad(),
                  Text(
                    '- Elegant and lightweight syntax\n'
                    '- Built-in dependency injection\n'
                    '- Easy to test and mock dependencies\n'
                    '- SetState & Animation in StatelessWidget\n'
                    '- Navigation without BuildContext',
                  ).pad(),
                ],
              ).pad(),
            ).pad(),
            ElevatedButton(
              onPressed: () => navigator.to(DocumentationUI()),
              child: Text('Get Started').pad(),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue, // Button color
                textStyle: TextStyle(fontSize: 18),
              ),
            ).pad(),
          ],
        ),
      ).pad(),
    );
  }
}
