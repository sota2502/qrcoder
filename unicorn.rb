# coding: utf-8

# プロジェクトディレクトリへのパス
@path = Dir.pwd + '/'

worker_processes 1 # CPUのコア数に揃える
working_directory @path
timeout 300
# listen '/tmp/app1.sock'
listen 3000
pid "#{@path}tmp/pids/unicorn.pid" # pidを保存するファイル
# logを保存するファイル
stderr_path "#{@path}log/unicorn.stderr.log"
stdout_path "#{@path}log/unicorn.stdout.log"
preload_app true
