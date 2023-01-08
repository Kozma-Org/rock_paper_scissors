# Getting Started

Welcome to `Rock - Paper - Scissors` application. I assume you're a new contributor looking to getting
started.

## Setup

Fork the `rock_paper_scissors` repository to your own account by clicking "Fork" up in the top right of this screen.

Check out the source code.

    cd ~/workspace
    git clone git@github.com:YOUR_USERNAME/rock_paper_scissors.git
    cd tmdb
    git remote add upstream git@github.com:kozmasz/rock_paper_scissors.git


### System dependencies

* Ruby 3.1.2
    * [RVM](https://www.ruby-lang.org/en/documentation/installation/)
    * [rbenv](https://github.com/rbenv/rbenv)
    * [asdf](https://github.com/asdf-vm/asdf-ruby)
* NVM
    * [NVM GitHub](https://github.com/nvm-sh/nvm)
    * `curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash`
    * `nvm install —lts` in my case it was `v18.13.0`

### Installation

* `gem install bundler`
* `bundle install`
* `rails db:migrate`
* `rails javascript:install:esbuild`
* `rails css:install:bootstrap` DO NOT OVERWRITE the css, choose `n` during the installation

### Configuration

* `touch .env`

* add `PRODUCTION_URL` environment variable


    PRODUCTION_URL="path.to/api"

    The provided production is unfortunately not working:
    "https://5eddt4q9dk.execute-api.us-east-1.amazonaws.com/rps-stage/throw"

    The provided mock server url is unfortunately always returns with `rock`:
    "https://private-anon-44b339bffa-curbrockpaperscissors.apiary-mock.com/rps-stage/throw"

    In order to setup the `PRODUCTION_URL` choose one of these urls.

    Without the correct settings it will automatically return with a random generated `rock`, `paper` or `scissors` value by the Rails application. 

### Run the application

* `./bin/dev` from Rails root directory
* open `http://localhost:3000/` from your browser

### Run tests

* `rails db:create db:schema:load`
* `bundle exec rspec`