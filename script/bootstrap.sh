#!/bin/bash
# Run this script when you clone the repo for the first time
export DB_UN="root"
export DB_PW=""
perl -pi -e "s/username: root/username: $DB_UN/g" config/database.yml
perl -pi -e "s/password:/password: $DB_PW/g" config/database.yml
rake db:create
rake db:migrate
rake db:seed