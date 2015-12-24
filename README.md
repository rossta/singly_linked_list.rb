# LinkedList

A singly linked list exercise in Ruby

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'singly_linked_list'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install singly_linked_list

## Usage

Initialize the list:

```ruby
list = LinkedList.new
```

Push data to the list:

```ruby
list << 1
list << 2
list << 3
```

Retrieve head, tail nodes from the list

```ruby
list.head #=> #<struct LinkedList::Node value=1, next=#<struct LinkedList::Node value=2, next=...>>
list.tail #=> #<struct LinkedList::Node value=3, next=nil>
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/rossta/singly_linked_list.rb. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

