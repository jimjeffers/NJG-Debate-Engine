default_run_options[:pty] = true

set :keep_releases,   5
set :application,     "notjustagame.com"
set :repository,      "git@github.com:jimjeffers/NJG-Debate-Engine.git"
set :scm,             "git"
set :user,            "notjusta"
set :password,        "f00tb4ll"
set :branch,          "master"
set :deploy_via,      :remote_cache
set :deploy_to,       "/data/apps/#{application}"
role :app,            "174.143.233.183"
role :web,            "174.143.233.183"
role :db,             "174.143.233.183", :primary => true
set :port,            30000

desc "Link shared files"
task :before_symlink do
  run "rm -f #{release_path}/config/database.yml"
  run "ln -s #{shared_path}/config/database.yml #{release_path}/config/database.yml"
  run "rm -rf #{release_path}/log/"
  run "ln -nfs #{shared_path}/log #{release_path}/log"
  run "rm -rf #{release_path}/tmp/"
  run "ln -nfs #{shared_path}/tmp #{release_path}/tmp"
end

[:start, :restart, :stop].each do |action|
  desc "Restarts passenger."
  deploy.task action do
    sudo "touch #{shared_path}/tmp/restart.txt"
  end
end

after "deploy", "deploy:cleanup"
after "deploy:migrations" , "deploy:cleanup"