# Contributing to Bigcommerce

We welcome your contribution! You're encouraged to submit [pull requests](https://github.com/bigcommerce/bigcommerce-api-ruby/pulls), [propose features, and discuss issues](https://github.com/bigcommerce/bigcommerce-api-ruby/issues).

#### Fork the Project

Fork the [project on Github](https://github.com/bigcommerce/bigcommerce-api-ruby) and check out your copy.

```
git clone your_forked_version_of_bigcommerce_api_ruby
cd bigcommerce-api-ruby
git remote add upstream https://github.com/bigcommerce/bigcommerce-api-ruby.git
```

#### Create a Feature Branch

Make sure your fork is up-to-date and create a topic branch for your feature or bug fix.

```
git checkout master
git pull upstream master
git checkout -b my-feature-branch
```

#### Bundle Install and Test

Ensure that you can build the project and run tests.

```
bin/setup
```

#### Installing the gem locally (useful to run examples)

This will build the gem locally into the pkg directory, you can then install it manually by targeting that directory specifically.

```
bundle exec rake build
gem install pkg/bigcommerce-1.x.x.gem
```

#### Write Tests

Try to write a test that reproduces the problem you're trying to fix or describes a feature that you want to build. Add to [spec/bigcommerce](spec/bigcommerce).

We definitely appreciate pull requests that highlight or reproduce a problem, even without a fix.

#### Write Code

Implement your feature or bug fix.

Ruby style is enforced with [Rubocop](https://github.com/bbatsov/rubocop), run `bundle exec rubocop` and fix any style issues highlighted.

Make sure that `bundle exec rake` completes without errors.

#### Write Documentation

Document any external behavior in the [README](README.md).

#### Update Changelog

Add a line to [CHANGELOG](CHANGELOG.md) under *Next Release*. Make it look like every other line, including your name and link to your Github account.

#### Commit Changes

Make sure git knows your name and email address:

```
git config --global user.name "Your Name"
git config --global user.email "contributor@example.com"
```

Writing good commit logs is important. A commit log should describe what changed and why.

```
git add ...
git commit
```

#### Push

```
git push origin my-feature-branch
```

#### Make a Pull Request

Go to https://github.com/contributor/bigcommerce-api-ruby and select your feature branch. Click the 'Pull Request'
button and fill out the form. Pull requests are usually reviewed within a few days.

#### Rebase

If you've been working on a change for a while, rebase with upstream/master.

```
git fetch upstream
git rebase upstream/master
git push origin my-feature-branch -f
```

#### Update CHANGELOG Again

Update the [CHANGELOG](CHANGELOG.md) with the pull request number. A typical entry looks as follows.

```
* [#123](https://github.com/bigcommerce/bigcommerce-api-ruby/pull/123): Added products resource - [@contributor](https://github.com/contributor).
```

Amend your previous commit and force push the changes.

```
git commit --amend
git push origin my-feature-branch -f
```

#### Check on Your Pull Request

Go back to your pull request after a few minutes and see whether it passed muster with CircleCI. Everything should
look green, otherwise fix issues and amend your commit as described above.
