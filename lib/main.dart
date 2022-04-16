import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';

void main() {
  Beamer.setPathUrlStrategy();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final routerDelegate = BeamerDelegate(
    locationBuilder: RoutesLocationBuilder(routes: {
      // Return either Widgets or BeamPages if more customization is needed
      '/': (context, state, data) => const MyHomePage(),
      '/event/:eventId': (context, state, data) => EventPage(eventId: state.pathParameters['eventId']),
      // '/books/:bookId': (context, state, data) {
      //   // Take the path parameter of interest from BeamState
      //   final bookId = state.pathParameters['bookId']!;
      //   // Collect arbitrary data that persists throughout navigation
      //   final info = (data as MyObject).info;
      //   // Use BeamPage to define custom behavior
      //   return BeamPage(
      //     key: ValueKey('book-$bookId'),
      //     title: 'A Book #$bookId',
      //     popToNamed: '/',
      //     type: BeamPageType.scaleTransition,
      //     child: BookDetailsScreen(bookId, info),
      //   );
    }),
  );

  MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routeInformationParser: BeamerParser(),
      routerDelegate: routerDelegate,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("test"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class EventPage extends StatelessWidget {
  final String? eventId;

  const EventPage({Key? key, this.eventId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(eventId ?? "null"),
      ),
    );
  }
}
