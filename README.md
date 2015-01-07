
GDC Haskell
============

Clone and initialize
--------------------

Just clone project is simple.
```sh

# Clone homework skeleton project.
git clone https://github.com/gdc-haskell/homework.git

```

If you want to track upstream tests, add homework-tests repo as a subtree.

```sh

# Add homework-tests repo as a remote and fetch.
git remote add subtree/tests https://github.com/gdc-haskell/homework-tests.git
git fetch subtree/tests

# Add homework-tests remote as subtree. (squashing history)
git subtree add -P tests subtree/tests master --squash

# To update subtree at a later date, (squashing history)
git fetch subtree/tests master
git subtree pull -P tests subree/tests master --squash

```

FIrst Setup
---------

```sh

cabal install --only-dependencies

```

How to run test
-------------

### run all test.

```sh

cabal test

```

### run only one test.

```sh

cabal test test4

cabal test test5

```

How to add test
------------

1. Import homework file in Spec.hs
2. Add test case like other tests.
3. Push to gdc-haskell/homework repository
4. Share the update with study!
