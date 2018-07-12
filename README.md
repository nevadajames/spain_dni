# SpainDni

A tool for validating Spanish DNI/NIE numbers. Checks for validity, can calculate the check letter
and return type of id (DNI or NIE).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'spain_dni'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install spain_dni

## Usage

Create a new instance of Dni class:
```ruby
dni = SpainDni::Dni.new('53428132Y')

dni.valid?
=> true

dni.valid_letter
=> 'Y'
```

Id type can be checked by using:
```ruby
dni.id_type
=> 'DNI'
```
Or using the helper methods:
```
dni.dni?
=>true

dni.nie?
=> false 
```


```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
