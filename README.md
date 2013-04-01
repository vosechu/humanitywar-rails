[![Code Climate](https://codeclimate.com/github/portlandcodeschool/humanitywar-rails.png)](https://codeclimate.com/github/portlandcodeschool/humanitywar-rails)

# Humanity War

What happens when you cross Cards Against Humanity with Kittenwar?

Take your favorite combinations from your games and see how they stack up against all the other terrible people!

## Class project

This project was an in-class teaching project worked on by everyone in session #2 of the Portland Code School. The core idea was proposed by @neilmakn and built on by the whole class. We really thought it was going to be a proper student project but the content was judged too... questionable, to be used as a portfolio project.

But we still wanted to do it, so there you are.

If you are learning Rails, please feel free to use this project as a base.

## Project initializer script

If you would like to see the commands used to create this project please check out `script/project_create.sh`. This is the file I ran to create this project (before even running `rails new <project>`).

## Key gems

* simple_form: [Simple Form](https://github.com/plataformatec/simple_form) is the form builder of choice for this project. It really makes selecting associated models quite easy while also supporting Bootstrap and other structured form markup.
* haml-rails: [Haml-rails](https://github.com/indirect/haml-rails) allows us to use Haml as the preferred markup for scaffolded views. We use both ERb and Haml throughout the site, but Haml makes writing code on the board easier so we use it.
* chosen-rails: [Chosen-rails](https://github.com/tsechingho/chosen-rails) is the beautiful implementation of the Chosen.js library. Chosen makes long dropdowns and multi-selects a joy to work with.
* will_paginate: [will_paginate](https://github.com/mislav/will_paginate) is the old standby pagination gem for Rails. We also considered [Kaminari](https://github.com/amatsuda/kaminari), which is excellent as well, but the students didn't believe that we would need any special theming, so chose to go with the stable and very well understood option instead.

## Contributing

1. Fork it
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Added some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create new Pull Request
