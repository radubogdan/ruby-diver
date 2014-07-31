# Diver

Simple, ad-hoc access to elements of deeply nested structures.

## Installation

Add this line to your application's Gemfile:

    gem 'diver'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install diver

## Usage

Use dive method to pull out a value from a nested data structure.

Example:

```ruby
> x = {"a" => {"b" => {"c" => "d"}}}

> x.dive("a", "b") # sugar for x["a"]["b"]

{"c" => "d"}

```

Use diveSet method to create a nested data structure.

```ruby
> x = {}
> x.diveSet("a", "b", "c", "d")
> p x
{"a" => {"b" => {"c" => "d"}}}
```

## Contributing

1. Fork it ( https://github.com/radubogdan/ruby-diver/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Regards
Thanks to [Tye McQueen](http://search.cpan.org/~tyemq/) who made this first long time ago for the Perl Community.
