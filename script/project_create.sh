#!/bin/bash
# This is the script used to create the project the first time
export DB_UN="root"
export DB_PW=""
gem install rails
rails new humanitywar-rails --skip-test-unit --skip-bundle --database=mysql
cd humanitywar-rails
echo "gem 'haml-rails'" >> Gemfile
echo "group :development, :test do
  gem 'rspec-rails'
end" >> Gemfile
bundle
be rails generate rspec:install
be rails generate scaffold WhiteCard text:string
be rails generate scaffold BlackCard text blanks:integer
be rails generate scaffold Playa email
be rails generate scaffold Entry playa:references white_card:references black_card:references wins:integer loses:integer draws:integer
perl -pi -e "s/username: root/username: $DB_UN/g" config/database.yml
perl -pi -e "s/password:/password: $DB_PW/g" config/database.yml
rake db:create
rake db:migrate
wget -q -O db/seeds.rb https://gist.github.com/vosechu/5110876/raw/431722548f541b04853be98f874b31ba73f5956b/seeds.rb
perl -pi -e 's/end/  has_many :entries\nend/g' app/models/playa.rb
perl -pi -e 's/end/  has_many :entries\nend/g' app/models/black_card.rb
perl -pi -e 's/end/  has_many :entries\nend/g' app/models/white_card.rb
rake db:seed
rm public/index.html
rails server &
open http://localhost:3000/entries
fg