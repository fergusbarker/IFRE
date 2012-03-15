default_run_options[:pty] = true
set :application, "IFRE"
set :repository,  "git@github.com:fergusbarker/IFRE.git"

set :scm, :git
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

set :deploy_to, "/var/ifre"
set :user, "serv"
set :password, "5469726f6e"
set :branch, "master"
set :deploy_via, :remote_cache

ssh_options[:port] = 223

role :web, "patriot.dyndns.biz"                          # Your HTTP server, Apache/etc
role :app, "patriot.dyndns.biz"                          # This may be the same as your `Web` server
role :db,  "patriot.dyndns.biz", :primary => true # This is where Rails migrations will run

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
