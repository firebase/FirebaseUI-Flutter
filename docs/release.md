# How to cut a new release of Firebase UI

1. Switch to `main` branch locally.
2. Run `git pull origin main`.
3. Run `git pull --tags` to make sure all tags are fetched.
4. Create new branch with the signature "release/[year]-[month]-[day]".
5. Run `melos version --no-git-tag-version` to automatically version packages and update Changelogs.
6. Run `melos publish` to dry run and confirm all packages are publishable.
7. After successful dry run, commit all changes with the signature "chore(release): prepare for release".
8. Run `git push origin [RELEASE BRANCH NAME]` & open pull request for review on GitHub.
9. After successful review and merge of the pull request, switch to `main` branch locally, & run `git pull origin main`.
10. Run `melos publish --no-dry-run --git-tag-version` to now publish to Pub.dev.
11. Run `git push --tags` to push tags to repository.
12. Ping @kevinthecheung to get the changelog in Firebase releases.
