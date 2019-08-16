# Ruby on Rails Members Only application

Ruby on Rails sample app excercise following [Michael Hartl](http://www.michaelhartl.com/) tutorial.

## Getting started

To get started with the app, clone the repo and then install the needed gems:

```console
 bundle install --without production
```

Next, migrate the database:

```console
 rails db:migrate
```

Finally, run the test suite to verify that everything is working correctly:

```console
 rails test
```

If the test suite passes, you'll be ready to run the app in a local server:

```console
 rails server
```

For more information, see the
[*Ruby on Rails Tutorial* book](https://www.railstutorial.org/book).
