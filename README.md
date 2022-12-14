[![Actions Status](https://github.com/m-larin/rails-project-63/workflows/hexlet-check/badge.svg)](https://github.com/m-larin/rails-project-63/actions?query=workflow:hexlet-check)
[![Actions Status](https://github.com/m-larin/rails-project-63/workflows/test/badge.svg)](https://github.com/m-larin/rails-project-63/actions?query=workflow:test)
[![Actions Status](https://github.com/m-larin/rails-project-63/workflows/lint/badge.svg)](https://github.com/m-larin/rails-project-63/actions?query=workflow:lint)

# HexletCode

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/hexlet_code`. To experiment with that code, run `bin/console` for an interactive prompt.


## Installation

Install the gem and add to the application's Gemfile by executing:

    $ bundle add hexlet_code

If bundler is not being used to manage dependencies, install the gem by executing:

    $ gem install hexlet_code

## Usage
Create tag
    
    HexletCode::Tag.build('img', src: 'path/to/image')

Create form

    User = Struct.new(:name, :job, :gender, keyword_init: true)
    user = User.new name: 'rob', job: 'hexlet', gender: 'm'
    
    HexletCode.form_for user do |f|
      # Проверяет есть ли значение внутри name
      f.input :name
      # Проверяет есть ли значение внутри job
      f.input :job, as: :text
    end
    
    # Для удобства пример указан с переносами строк. Но реализовать их необязательно
    # <form action="#" method="post">
    #   <input name="name" type="text" value="rob">
    #   <textarea name="job" cols="20" rows="40">hexlet</textarea>
    # </form>

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/m-larin/rails-project-63.
