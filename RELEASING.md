# Releasing Bigcommerce API Client

There are no particular rules about when to release the Bigcommerce API client. Release bug fixes frequently, features
not so frequently, and breaking API changes rarely.

### Before A Release

Run tests, check that all tests succeed locally.

```sh
bundle install
bundle exec rake
```

This will ensure both style and that all the specs pass locally. Next, check that the last build succeeded 
in [CircleCI](https://app.circleci.com/pipelines/github/bigcommerce/bigcommerce-api-ruby) for all supported platforms.

Increment the version, modify [lib/bigcommerce/version.rb](lib/bigcommerce/version.rb).

* Increment the third number (minor version) if the release has bug fixes and/or very minor features, only (eg. change `1.0.1` to `1.0.2`).
* Increment the second number (patch version) if the release contains major features or breaking API changes (eg. change `1.0.10` to `1.1.0`).

Change "Next Release" in [CHANGELOG.md](CHANGELOG.md) to the new version.

```markdown
1.1.0 (4/13/2015)
=================
```

Commit your changes.

```sh
git add CHANGELOG.md lib/bigcommerce/version.rb
git commit -m "Preparing for release, 1.1.0."
git push origin master
```

### Release :tada:

```sh
$ rake release

bigcommerce 1.1.0 built to pkg/bigcommerce-1.1.0.gem.
Tagged v1.1.0.
Pushed git commits and tags.
Pushed bigcommerce 1.1.0 to rubygems.org.
```

### Prepare for the Next Version

Add the next release to [CHANGELOG.md](CHANGELOG.md).

```markdown
Next Release
============

* Your contribution here.
```

Commit your changes.

```sh
git add CHANGELOG.md README.md
git commit -m "Preparing for next release."
git push origin master
```
