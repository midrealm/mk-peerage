# config valid only for current version of Capistrano
lock '3.10.1'

set :application, 'laurel'
set :repo_url, 'git@github.com:niquerio/mk-peerage.git'

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp
set :branch, ENV['BRANCH'] if ENV['BRANCH']

# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, '/srv/www/laurel_demo'

# Default value for :scm is :git
set :scm, :git

# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: 'log/capistrano.log', color: :auto, truncate: :auto

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
set :linked_files, fetch(:linked_files, []).push('.env', 'config/secrets.yml')
# append :linked_files, 'config/database.yml', 'config/secrets.yml'

# Default value for linked_dirs is []
# append :linked_dirs, 'log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'public/system'

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
# set :keep_releases, 5


set :rbenv_ruby, '2.5.0'
set :rbenv_path, '/home/mrio/.rbenv'

set :nvm_type, :user # or :system, depends on your nvm setup
set :nvm_node, 'v9.5.0'
set :nvm_map_bins, %w{node npm yarn}

namespace :deploy do
  desc 'Restart application'
  task :restart do
   on roles(:app) do
     execute :sudo, '/bin/systemctl', 'restart', 'laurel_demo'
   end
  end

  task :init_db do
    on primary fetch(:migration_role) do
      within release_path do
        with rails_env: fetch(:rails_env)  do
          execute :rake, 'fake_data:all  DISABLE_DATABASE_ENVIRONMENT_CHECK=1'
        end
      end
    end
  end
  desc 'Run yarn:install'
  task :yarn_install do
    on roles(:app) do
      within release_path do
        execute("cd #{release_path} && yarn install --ignore-engines")
      end
    end
  end
  desc 'Run rake webpack_deploy'
  task :webpack_deploy do
    on roles(:app) do
      within release_path do
        execute("cd #{release_path} && npm run webpack:deploy ")
      end
    end
  end
  after :updating, :yarn_install
  after :updating, :webpack_deploy
  before :finishing, :init_db
  after  :finishing, :restart
end
