# EC2サーバーのIP、EC2サーバーにログインするユーザー名、サーバーのロールを記述
server '54.95.126.208', user: 'ec2-user', roles: %w{app web db}

set :ssh_options, {
  # capistranoコマンド実行者の秘密鍵
  keys: %w(~/.ssh/id_rsa),
  forward_agent: true,
  auth_methods: %w(publickey)
}

# set :ssh_options, {
#   # capistranoコマンド実行者の秘密鍵
#   keys: %w(~/.ssh/id_rsa),
#   forward_agent: true,
#   auth_methods: %w(publickey)
# }

# set :stage, :production
# set :rails_env, :production
# set :branch, 'master'
# server '54.95.126.208', user: 'deploy', roles: %w[web app db]

# # nginx
# set :nginx_config_name, fetch(:application).to_s