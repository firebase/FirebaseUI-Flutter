import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_ui_storage/firebase_ui_storage.dart';
import 'package:firebase_ui_storage_example/firebase_options.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

String get emulatorHost {
  if (defaultTargetPlatform == TargetPlatform.android) {
    return '10.0.0.2';
  }

  return 'localhost';
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await FirebaseStorage.instance.useStorageEmulator(emulatorHost, 9199);

  final storage = FirebaseStorage.instance;

  final config = FirebaseUIStorageConfiguration(
    storage: storage,
  );

  await FirebaseUIStorage.configure(config);

  runApp(const FirebaseUIStorageExample());
}

class FirebaseUIStorageExample extends StatelessWidget {
  const FirebaseUIStorageExample({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FirebaseUI Storage Example',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        useMaterial3: true,
      ),
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;
  GlobalKey key = GlobalKey();

  Widget buildList() {
    return StorageListView(
      key: key,
      ref: FirebaseStorage.instance.ref('/'),
      itemBuilder: (context, ref) {
        return AspectRatio(
          aspectRatio: 1,
          child: StorageImage(
            ref: ref,
            fit: BoxFit.cover,
          ),
        );
      },
    );
  }

  Widget buildGrid() {
    return StorageGridView(
      key: key,
      ref: FirebaseStorage.instance.ref('/'),
      itemBuilder: (context, ref) {
        return AspectRatio(
          aspectRatio: 1,
          child: StorageImage(
            ref: ref,
            fit: BoxFit.cover,
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FirebaseUI Storage Example'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              setState(() {
                key = GlobalKey();
              });
            },
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) => setState(() => _selectedIndex = index),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'List',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.grid_on),
            label: 'Grid',
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: switch (_selectedIndex) {
              0 => buildList(),
              1 => buildGrid(),
              _ => throw UnimplementedError(),
            },
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Builder(builder: (context) {
              return UploadButton(
                onError: (error, _) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(error.toString())),
                  );
                },
                onUploadComplete: (ref) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Upload complete')),
                  );

                  setState(() {
                    key = GlobalKey();
                  });
                },
              );
            }),
          )
        ],
      ),
    );
  }
}
