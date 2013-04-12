require "bundler/capistrano"

set :application, "turismoapp"
set :domain, '54.244.78.108'

set :scm, 'git' 
set :repository,  "git@github.com:nascimento/testedeletar.git"
set :scm_passphrase, ""

# You can set :scm explicitly or Capistrano will make an intelligent guess based on known version control directory names
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

set :user, "ubuntu"

set :deploy_to, "/var/www/turismoapp"

server "54.244.78.108", :app, :primary => true

role :web, domain                          # Your HTTP server, Apache/etc
role :app, domain                          # This may be the same as your `Web` server
role :db,  domain, :primary => true # This is where Rails migrations will run
role :db,  domain

# if you want to clean up old releases on each deploy uncomment this:
before "deploy:restart", "bundle:install"
after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end

namespace :bundle do
  desc "run bundle install and ensure all gem requirements are met"
  task :install do
    run "cd #{current_path} && bundle install --without=test"
  end
end
