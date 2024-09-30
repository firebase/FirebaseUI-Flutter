# Email verification in Firebase UI

Firebase UI provides a pre-built `EmailVerificationScreen`:

```dart
class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: FirebaseAuth.instance.currentUser == null
        ? '/login'
        : '/profile',
      routes: {
        '/login': (context) {
          return SignInScreen(
            actions: [
              AuthStateChangeAction<SignedIn>((context, state) {
                if (!state.user!.isEmailVerified) {
                  Navigator.pushNamed(context, '/verify-email');
                } else {
                  Navigator.pushReplacementNamed(context, '/profile');
                }
              }),
            ]
          );
        },
        '/profile': (context) => ProfileScreen(),
        '/verify-email': (context) => EmailVerificationScreen(
          actionCodeSettings: ActionCodeSettings(...),
          actions: [
            EmailVerifiedAction(() {
              Navigator.pushReplacementNamed(context, '/profile');
            }),
            AuthCancelledAction((context) {
              FirebaseUIAuth.signOut(context: context);
              Navigator.pushReplacementNamed(context, '/');
            }),
          ],
        ),
      }
    )
  }
}
```

Once opened, it triggers a verification email to be sent and will wait for a dynamic link to be received by the app (on supported platforms).

Note: `EmailVerifiedAction` does not poll the verification state in realtime. Is only fired after the user has verified their email and the application has resumed. This represents a typical user flow (leave the app and check email). In development (i.e. iOS simulator), it is necessary to suspend and resume the app for `EmailVerifiedAction` to be called (e.g. by minimising app and reopening in app switcher).

## Using `EmailVerificationController`

If you want to build a custom email verification screen, you could use `EmailVerificationController`:

```dart
class MyEmailVerificationScreen extends StatefulWidget {
  const MyEmailVerificationScreen({super.key});

  @override
  State<MyEmailVerificationScreen> createState() =>
      _MyEmailVerificationScreenState();
}

class _MyEmailVerificationScreenState extends State<MyEmailVerificationScreen> {
  late final ctrl = EmailVerificationController(FirebaseAuth.instance)
    ..addListener(() {
      // trigger widget rebuild to reflect new state
      setState(() {});
    });

  @override
  void dispose() {
    ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    switch (ctrl.state) {
      case EmailVerificationState.unresolved:
      case EmailVerificationState.unverified:
        return TextButton(
          onPressed: () {
            ctrl.sendVerificationEmail(
              Theme.of(context).platform,
              ActionCodeSettings(...),
            );
          },
          child: Text('Send verification email'),
        );
      case EmailVerificationState.dismissed:
        return Text("Ok, let's verify your email next time");
      case EmailVerificationState.pending:
      case EmailVerificationState.sending:
        return CircularProgressIndicator();
      case EmailVerificationState.sent:
        return Text('Check your email');
      case EmailVerificationState.verified:
        return Text('Email verified');
      case EmailVerificationState.failed:
        return Text('Failed to verify email');
    }
  }
}
```
