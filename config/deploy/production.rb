# conohaのサーバーのIP、ログインするユーザー名、サーバーの役割
# xxxの部分はサーバーのIPアドレス
# 10022はポートを変更している場合。通常は22
<<<<<<< HEAD
server '160.251.234.68', user: 'root', roles: %w{app db web}, port: 50022
=======
server '160.251.167.135', port: 50022, user: 'vpsuser', roles: %w{app db web}
>>>>>>> 21c32e5a0842d782d302d6c3b2f6c7328709d697

#デプロイするサーバーにsshログインする鍵の情報。サーバー編で作成した鍵のパス
set :ssh_options, keys: '~/downloads/key-2024-12-27-14-58.pem'
