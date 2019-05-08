# Capybara Watcher

Watch body elements and wait for changes in Capybara integration tests.

[![Build with Ruby](http://img.shields.io/badge/made%20with-Ruby-7f1c1f.svg?style=for-the-badge&logo=ruby&labelColor=c1282c)](https://rubyonrails.org/)
[![Powered by Vim](http://img.shields.io/badge/powered%20by-vim-019733.svg?style=for-the-badge&logo=vim&logoColor=fff&labelColor=555)](https://www.vim.org/)

[![Buy me a coffee](https://www.buymeacoffee.com/assets/img/custom_images/orange_img.png)](https://www.buymeacoffee.com/ricvillagrana)

## Getting Started

To use capybara watcher you only have to add `wait_for_changes` on any integration test.

# How does it work

Capybara Watcher gets te current body content and then watch for changes on it, a change trigger your lines of code that lies bellow the watch line.

Example:
#### Approach 1
```ruby
fill_in 'Name', with 'My name'
click_on 'Submit'

wait_for_changes

# Perform any action
expect(body).to have_content(/Name was saved!/i)
```

#### Approach 2
```ruby
fill_in 'Name', with 'My name'
before_wait do
  click_on 'Submit'
end

# Perform any action
expect(body).to have_content(/Name was saved!/i)
```

#### Approach 3
```ruby
fill_in 'Name', with 'My name'
click_on 'Submit'

# Perform any action
wait_until_content_has('Name was saved!') do |text|
  expect(body).to have_content(text)
end
```

You can even wait for many changes, i.e. "A modal closes and then a notification is triggered".
This can be  done with:
```ruby
wait_for_changes(2)
before_wait(2) { click_on 'Submit' }
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

On your `rails_helper.rb`
```ruby
...
config.include CapybaraWatcher, type: :feature
...
```

#### Configuring
On your `rails_helper.rb`
```ruby
CapybaraWatcher.configure do |options|
  options.timeout = 5 # Time in seconds
end
```

> The timeout option has a default value of 2 (seconds), and this means that a when CapybaraWatcher wait more than this time, it automatically continue with the program.

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

