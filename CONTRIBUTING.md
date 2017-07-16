# Contributing to `hello-sense`

Thank you for your interest in contributing to the `hello-sense` gem! We welcome any contributions: code, bug reports, documentation, and more.

## Bug reports

There’s a number of reasons to file a bug report:

* incorrect or unexpected results
* bugs
* misleading or incorrect documentation

Opening an issue is as easy as following [this link](https://github.com/stilist/hello-sense/issues/new) and filling out the fields. You can reference the [template](.github/ISSUE_TEMPLATE.md) to see what information will be the most helpful.

## Development environment

To install the development dependencies, run these commands:

```bash
$ gem install bundler
$ bundle install
```

## Making changes

When you make changes to the code, make sure you’re keeping the [test suite](http://rspec.info) and [inline documentation](http://yardoc.org) updated.

When you’re done making your changes, run `rake build`. This automatically generates documentation (`rake doc`), [lints the code](https://github.com/bbatsov/rubocop) (`rake lint`), and runs the test suite (`rake spec`) before building the `.gem` file. If `rake build` finishes without any errors and builds the `.gem`, your changes are ready for a pull request.

## Pull requests

We use pull requests as a simple, consistent way to make updates to the project. GitHub has some [great documentation][pull-requests] on using the Pull Request feature. We use the ‘fork and pull’ model described there.

[pull-requests]: https://help.github.com/articles/using-pull-requests/

Please make pull requests against the `master` branch. We have a [pull request template](PULL_REQUEST_TEMPLATE.md) to help guide you.

## Coding conventions

Hello doesn't publicly document the Sense API, so this gem's documentation includes request and response data to demonstrate each API endpoint. To keep personal information out of the example data, use these values whenever you add or change documentation:

* email address: `drisha.wabudeya@example.org`
* name: [Drisha](http://www.bachpan.com/Meaning-Of-Drisha.aspx) [Wabudeya](http://www.americanlastnames.us/last-names/Ugandan/W/W-0.html)
* password: `'My super secure password!'`
* device id: `ABCDEF1234567890` or `0987654321FEDCBA`
* create timestamp: `1420099200000` (`2015-01-01T00:00:00-0800`)
* update timestamp: `1483257600000` (`2017-01-01T00:00:00-0800`)
* [UUID](https://en.wikipedia.org/wiki/Universally_unique_identifier): `FDED667B-9E91-43F5-91DE-258AC1FEE9C2` (generated with [an online tool](https://guidgenerator.com/online-guid-generator.aspx))
