# Capybara Watcher

Watch body elements and wait for changes in Capybara integration tests.

## Getting Started

To use capybara watcher you only have to add `wait_for_changes` on any integration test.

# How does it work

Capybara Watcher gets te current body content and then watch for changes on it, a change trigger your lines of code that lies bellow the watch line.

Example:
```ruby
fill_in 'Name', with 'My name'
click_on 'Submit'

wait_for_changes

# Perform any action
expect(body).to have_content(/Name was saved!/i)
```
You can even wait for many changes, i.e. "A modal closes and then a notification is triggered".
This can be  done with:
```ruby
wait_for_changes(2)
```

### Prerequisites

- Rails
- RSpec

### Installing

Install `capybara_watcher`

```
gem install capybara_watcher
```

Or in Gemfile
```ruby
gem 'capybara_watcher'
```

## Built With

* [Ruby](https://www.ruby-lang.org/es/) - A PROGRAMMER'S BEST FRIEND

## Contributing

Please read [CONTRIBUTING.md](CONTRIBUTING.md) for details on our code of conduct, and the process for submitting pull requests to us.

## Versioning

We use [SemVer](http://semver.org/) for versioning. For the versions available, see the [tags on this repository](https://github.com/ricvillagrana/capybara_watcher/tags). 

## Authors

* **Ricardo Villagrana** - [ricvillagrana](https://github.com/ricvillagrana)

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details

