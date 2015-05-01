# Global settings 
set :application, "test-application"
set :domain,      "#{application}.we-create.be"
set :deploy_to,   "/var/sites/#{domain}"
set :app_path,    "app"

server "#{domain}", :app, :web, :primary => true

# Source code
set :repository, "ssh://git@github.com:jdecoster/capifony-example.git"
set :scm, :git # Or: `accurev`, `bzr`, `cvs`, `darcs`, `subversion`, `mercurial`, `perforce`, or `none`
set :deploy_via, :remote_cache # keep remotely cached git-repo
set :branch, "master"

# Target directories
set :app_path, "app"
set :web_path, "web"

#  files
set :shared_files, ["app/config/parameters.yml"]
#set :shared_children, [app_path + "/sessions", app_path + "/logs"]
set :use_sudo,      false


# Migrations (IF needed)
# before "symfony:cache:warmup", "symfony:doctrine:migrations:migrate"
# set :interactive_mode, false # if true, the task deploy:migrations will ask for confirmation

# Assets
set :dump_assetic_assets, true

# Vendors (don't share, but copy)
set :composer_bin, "./composer.phar"
set :use_composer, true
#set :composer_options, '--verbose --prefer-source --optimize-autoloader --no-progress'
set :update_vendors, false # true for 'composer update', false for 'composer install'
#before 'symfony:composer:install', 'composer:copy_vendors'
#before 'symfony:composer:update', 'composer:copy_vendors'

# Clean up
set :keep_releases,  4
after "deploy:update", "deploy:cleanup"

# EXTRA SETTINGS 
default_environment["TERM"] = 'xterm'
ssh_options[:forward_agent] = true

# Be more verbose by uncommenting the following line
#logger.level = Logger::MAX_LEVEL
