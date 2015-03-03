root = "/home/kotraders_web/app/current"
working_directory root
pid "#{root}/tmp/pids/unicorn.pid"
stderr_path "#{root}/log/unicorn.log"
stdout_path "#{root}/log/unicorn.log"

listen "/tmp/unicorn.kotraders_web_production.sock"
worker_processes 4
timeout 600