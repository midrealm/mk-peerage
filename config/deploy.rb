# config valid only for current version of Capistrano
lock '3.6.1'

set :application, 'laurel'
set :repo_url, 'mrio@caroso.elkiss.com:/srv/repos/laurel.git'

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

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


set :rbenv_ruby, '2.3.0'
set :rbenv_path, '/home/mrio/.rbenv'

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
          execute :rake, 'fake_data:all DISABLE_DATABASE_ENVIRONMENT_CHECK=1'
        end
      end
    end
  end
  #before :finishing, :init_db
  after  :finishing, :restart
end
