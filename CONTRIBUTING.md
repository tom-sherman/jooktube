# Contributing to Jooktube

## Style Guide
* [RuboCop](https://github.com/bbatsov/rubocop) styles for Ruby

* [Javascript Standard Style](https://github.com/feross/standard) for js.

## Issue Contributions
When opening issues please make sure to include all details in your original
issue body text. This can include:

* Expected behaviour vs actual behaviour

* Steps to reproduce

* Stacktrace

* Specifications like the version of the project, operating system, and
hardware.

## Code Contributions

### Step 1: Fork
Form the project on Github and clone your fork locally.

```
git clone git@github.com:username/jooktube.git
cd jooktube
git remote add upstream https://github.com/tom-sherman/jooktube.git
```

#### Which branch?
Use the `master` branch for new features and bug fixes.

### Step 2: Branch
Create a branch and start hacking:
```
git checkout -b my-branch -t origin/master
```
All code should follow the Style Guide, including comments and documentation.

### Step 3: Commit
Make sure git knows your name and email address:

```
git config --global user.name "J. Random User"
git config --global user.email "j.random.user@example.com"
```

Add and commit:
```
git add my/changed/files
git commit
```

### Commit message guidelines

The commit message should describe what changed and why.

1. The first line should:
   - contain a short description of the change
   - be 50 characters or less
   - be entirely in lowercase with the exception of proper nouns, acronyms, and
   the words that refer to code, like function/variable names
   - be prefixed with the name of the changed subsystem and start with an
   imperative verb. Check the output of `git log --oneline files/you/changed` to
   find out what subsystems your changes touch.

   Examples:
   - `net: add localAddress and localPort to Socket`
   - `src: fix typos in node_lttng_provider.h`


2. Keep the second line blank.
3. Wrap all other lines at 72 columns.

4. If your patch fixes an open issue, you can add a reference to it at the end
of the log. Use the `Fixes:` and the issue number. For other references
use `Refs:` along with full URLs.

   Examples:
   - `Fixes: #1337`
   - `Refs: http://eslint.org/docs/rules/space-in-parens.html`
   - `Refs: https://github.com/nodejs/node/pull/3615`

### Step 4: Rebase
Use `git rebase` (not `git merge`) to synchronize your work with the main
repository.

```
git fetch upstream
git rebase upstream/master
```

### Step 5: Test
Bug fixes and features should come with tests. Use npm to run the full test
suite on front and back end code.

```
npm test
```

### Step 6: Push
```
git push origin my-branch
```

### Step 7: Discuss and update

You will probably get feedback or requests for changes to your Pull Request.
This is a big part of the submission process so don't be discouraged!

To make changes to an existing Pull Request, make the changes to your branch.
When you push that branch to your fork, GitHub will automatically update the
Pull Request.

You can push more commits to your branch:

```text
$ git add my/changed/files
$ git commit
$ git push origin my-branch
```

Or you can rebase against master:

```text
$ git fetch --all
$ git rebase origin/master
$ git push --force-with-lease origin my-branch
```

Or you can amend the last commit (for example if you want to change the commit
log).

```text
$ git add any/changed/files
$ git commit --amend
$ git push --force-with-lease origin my-branch
```

**Important:** The `git push --force-with-lease` command is one of the few ways
to delete history in git. Before you use it, make sure you understand the risks.
