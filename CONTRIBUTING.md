# How to Contribute

We'd love to accept your patches and contributions to this project.

## Before you begin

### Sign our Contributor License Agreement

Contributions to this project must be accompanied by a
[Contributor License Agreement](https://cla.developers.google.com/about) (CLA).
You (or your employer) retain the copyright to your contribution; this simply
gives us permission to use and redistribute your contributions as part of the
project.

If you or your current employer have already signed the Google CLA (even if it
was for a different project), you probably don't need to do it again.

Visit <https://cla.developers.google.com/> to see your current agreements or to
sign a new one.

### Review our Community Guidelines

This project follows [Google's Open Source Community
Guidelines](https://opensource.google/conduct/).

### Code Reviews

All submissions, including submissions by project members, require review. We
use GitHub pull requests for this purpose. Consult
[GitHub Help](https://help.github.com/articles/about-pull-requests/) for more
information on using pull requests.

## Contribution process

### 1. Things you will need

- Linux, Mac OS X, or Windows.
- [git](https://git-scm.com) (used for source version control).
- An ssh client (used to authenticate with GitHub).
- An IDE such as [Android Studio](https://developer.android.com/studio) or [Visual Studio Code](https://code.visualstudio.com/).
- [`flutter_plugin_tools`](https://pub.dev/packages/flutter_plugin_tools) locally activated.
- [`clang-format`](https://clang.llvm.org/docs/ClangFormat.html) (available via brew on macOS, apt on Ubuntu, maybe via llvm on chocolatey for Windows)
- [`swiftformat`](https://github.com/nicklockwood/SwiftFormat) (available via brew on macOS)

### 2. Forking & cloning the repository

- Ensure all the dependencies described in the previous section are installed.
- Fork `https://github.com/firebase/FirebaseUI-Flutter` into your own GitHub account. If
  you already have a fork, and are now installing a development environment on
  a new machine, make sure you've updated your fork so that you don't use stale
  configuration options from long ago. If you don't know what "fork" means – learn more
  [here](https://docs.github.com/en/get-started/quickstart/fork-a-repo).
- If you haven't configured your machine with an SSH key that's known to github, then
  follow [GitHub's directions](https://help.github.com/articles/generating-ssh-keys/)
  to generate an SSH key.
- `git clone git@github.com:<your_name_here>/FirebaseUI-Flutter.git`
- `git remote add upstream git@github.com:firebase/FirebaseUI-Flutter.git` (So that you
  fetch from the master repository, not your clone, when running `git fetch`
  et al.)

### 3. Environment Setup

FirebaseUI-Flutter uses [Melos](https://github.com/invertase/melos) to manage the project and dependencies.

To install Melos, run the following command from your SSH client:

```bash
dart pub global activate melos
```

Next, at the root of your locally cloned repository bootstrap the projects dependencies:

```bash
melos bootstrap
```

The bootstrap command locally links all dependencies within the project without having to
provide manual [`dependency_overrides`](https://dart.dev/tools/pub/pubspec). This allows all
plugins, examples and tests to build from the local clone project.

> - You do not need to run `flutter pub get` once bootstrap has been completed.
> - If you're using [fvm](https://fvm.app/) you might need to specify the sdk-path: `melos bs --sdk-path=/Users/user/fvm/default/`

### 4. Contributing code

We gladly accept contributions via GitHub pull requests.

Please peruse the
[Flutter style guide](https://github.com/flutter/flutter/wiki/Style-guide-for-Flutter-repo) and
[design principles](https://flutter.io/design-principles/) before
working on anything non-trivial. These guidelines are intended to
keep the code consistent and avoid common pitfalls.

To start working on a patch:

1. `git fetch upstream`
2. `git checkout upstream/master -b <name_of_your_branch>`
3. Hack away!

Once you have made your changes, ensure that it passes the internal analyzer & formatting checks. The following
commands can be run locally to highlight any issues before committing your code:

```bash
# Run the analyze check
melos run analyze

# Format code
melos run format
```

Assuming all is successful, commit and push your code:

1. `git commit -a -m "<your informative commit message>"`
2. `git push origin <name_of_your_branch>`

Before submitting your pull request, you need to sign the [Contributor License Agreement](https://cla.developers.google.com/clas).

- Go to `https://github.com/firebase/FirebaseUI-Flutter` and click the
  "Compare & pull request" button

Please make sure all your check-ins have detailed commit messages explaining the patch.

When naming the title of your pull request, please follow the [Conventional Commits](https://www.conventionalcommits.org/en/v1.0.0-beta.4/)
guide. For example, for a fix to the `firebase_ui_auth` plugin:

`fix(ui_auth): fixed a bug!`

Plugins tests are run automatically on contributions using GitHub Actions. Depending on
your code contributions, various tests will be run against your updated code automatically.

Once you've gotten an LGTM from a project maintainer and once your PR has received
the green light from all our automated testing, wait for one the package maintainers
to merge the pull request.

If you create a new file, do not forget to add the [license header](https://github.com/firebase/FirebaseUI-Flutter/blob/main/header_template.txt). You can add it manually, or use
[`addlicense`](https://github.com/google/addlicense) to add the license to all
necessary files.

To install `addlicense`, run:

```bash
go install github.com/google/addlicense@latest
```

Do not forget to add `$HOME/go/bin` to your `PATH`. If you are using Bash on
Linux or macOS, you need to add `export PATH="$HOME/go/bin:$PATH"` to your
`.bash_profile`.

To add the license header to all files, run from the root of the repository:

```bash
melos run add-license-header
```

This command uses `addlicense` with all necessary flags.

## The release process

We push releases manually, using [Melos](https://github.com/invertase/melos)
to take care of the hard work.

Changelogs and version updates are automatically updated by a project maintainer
(via [Melos](https://github.com/invertase/melos)). The new version is automatically
generated via the commit types and changelogs via the commit messages.

Some things to keep in mind before publishing the release:

- Has CI ran on the master commit and gone green? Even if CI shows as green on
  the PR it's still possible for it to fail on merge, for multiple reasons.
  There may have been some bug in the merge that introduced new failures. CI
  runs on PRs as it's configured on their branch state, and not on tip of tree.
  CI on PRs also only runs tests for packages that it detects have been directly
  changed, vs running on every single package on master.
- [Publishing is
  forever.](https://dart.dev/tools/pub/publishing#publishing-is-forever)
  Hopefully any bugs or breaking in changes in this PR have already been caught
  in PR review, but now's a second chance to revert before anything goes live.
- "Don't deploy on a Friday." Consider carefully whether or not it's worth
  immediately publishing an update before a stretch of time where you're going
  to be unavailable. There may be bugs with the release or questions about it
  from people that immediately adopt it, and uncovering and resolving those
  support issues will take more time if you're unavailable.

### Run a release

1. Switch to `main` branch locally.
2. Run `git pull origin main`.
3. Run `git pull --tags` to make sure all tags are fetched.
4. Create new branch with the signature "release/[year]-[month]-[day]".
5. Run `melos version --no-git-tag-version` to automatically version packages and update Changelogs.
6. Run `melos publish` to dry run and confirm all packages are publishable.
7. After successful dry run, commit all changes with the signature `chore(release): prepare for release`.
8. Run `git push origin [RELEASE BRANCH NAME]` & open pull request for review on GitHub.
9. After successful review and merge of the pull request, switch to `main` branch locally, & run `git pull origin main`.
10. Run `melos publish --no-dry-run --git-tag-version` to now publish to Pub.dev.
11. Run `git push --tags` to push tags to repository.

### Graduate packages

Sometimes you may need to 'graduate' a package from a 'dev' or 'beta' (versions tagged like this: `0.10.0-dev.4`) to a stable version. Melos can also be used
to graduate multiple packages using the following steps:

1. Switch to `master` branch locally.
2. Run 'git pull origin master'.
3. Run `git fetch --all` to make sure all tags and commits are fetched.
4. Run `melos version --graduate` to prompt a list of all packages to be graduated (You may also specifically select packages using the scope flag like this: `--scope="*firestore*"`)
5. Run `git push --follow-tags` to push the auto commits and tags to the remote repository.
6. Run `melos publish` to dry run and confirm all packages are publishable.
7. Run `melos publish --no-dry-run` to now publish to Pub.dev.
