# Jooktube
A real-time playlist engine, built for collaboration.

This repository houses the entire web app and API.

## Development

Clone the repository
```
git clone https://github.com/tom-sherman/jooktube.git
```

Enter into the directory and run bundle install
```
cd jooktube
bundle install
```

Install javascript dependencies.
```
npm install
```

Start the rails server.
```
rails s
```

Run gulp to watch and recompile assets on the fly.
```
gulp
```

## Deployment
To avoid git messiness and redundant rebases and merge conflicts, it's usually a good idea to `.gitignore` your compiled assets. This means you'll have to have them compile as part of your deploy process. In short, you'll need to ensure the following:

1. Node is installed
2. `npm install` runs
3. `gulp build` runs on `postinstall` (specified in package.json)

These steps must complete **before** starting the Rails server.

### Heroku
Heroku makes deploying SUPER easy, but there are a couple of things you'll need to do to get this running.

Since we're using Ruby (to run Rails) AND Node (to compile our assets with Gulp) in our setup, we need both running on our server. Heroku will automatically detect ONE of these at a time based on the presense of a `Gemfile` or `package.json`, but to get both running simultaneously, we need to [specify multiple buildpacks](https://devcenter.heroku.com/articles/using-multiple-buildpacks-for-an-app) in the order we want.

```bash
heroku buildpacks                     # view current buildpacks
heroku buildpacks:clear               # clear current buildpacks, if necessary
heroku buildpacks:add heroku/nodejs   # add the buildpacks we want ...
heroku buildpacks:add heroku/ruby     # ... in the order we want them
```

Now, when we deploy to Heroku, first `npm install` will run, then our `postinstall` script specified in `package.json`, and then `bundle install` will run.

Take note of the following:
```rb
  #production.rb line 25
  config.serve_static_files = ENV['RAILS_SERVE_STATIC_FILES'].present?
```
Heroku requires `config.serve_static_files` to be enabled, so be sure to either add `RAILS_SERVE_STATIC_FILES` as a config var in your Heroku settings, or manually set this to true in your `production.rb` file.

### Capistrano

All we need to do is add a task to run `npm install` before we compile the assets.

The example below shows an example of using [nvm](https://github.com/creationix/nvm) (node version manager) to use the specified node version for your application.

```rb
# ./config/deploy.rb

before "deploy:assets:precompile", "deploy:npm_install"

namespace :deploy do
  desc "Run npm install"
  task :npm_install do
    invoke_command "bash -c '. /home/deploy/.nvm/nvm.sh && cd #{release_path} && npm install'"
  end
end
```

# Credits
Front end build pipeline forked from [`gulp-rails-pipeline`](https://github.com/vigetlabs/gulp-rails-pipeline)
