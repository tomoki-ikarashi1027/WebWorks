# # config valid for current version and patch releases of Capistrano
# lock "~> 3.15.0"

# set :application, "WebWorks"
# set :repo_url, "git@github.com:tomoki-ikarashi1027/WebWorks.git"
# set :deploy_to, "/home/ec2-user/WebWorks"
# set :rbenv_ruby, '2.6.3'
# set :linked_files, %w{config/master.key .env}
# append :linked_dirs, "log", "public", "tmp"




lock "~> 3.15.0"

# Capistranoのログの表示に利用する
set :application, "WebWorks"

# どのリポジトリからアプリをpullするかを指定する
set :repo_url, "git@github.com:tomoki-ikarashi1027/WebWorks.git"

# サーバ上でのソースの配置先
set :deploy_to, "/home/ec2-user/WebWorks"

# Rubyをrbenv経由で使う
set :rbenv_type, :system
set :rbenv_ruby, File.read('.ruby-version').strip
set :rbenv_prefix, "RBENV_ROOT=#{fetch(:rbenv_path)} #{fetch(:rbenv_path)}/bin/rbenv exec"

# アプリケーションで使用するgemをリリース間で共有
append :linked_dirs, '.bundle'

# サーバの並列数
set :bundle_jobs, 2

# リリース間での共有リソース定義
append :linked_files, "config/master.key"
append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets"
