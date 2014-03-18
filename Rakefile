task :install do
  sh "ln -s #{File.expand_path('../.vimrc', __FILE__)} ~/.vimrc"
  sh "ln -s #{File.expand_path('../.vim', __FILE__)} ~/.vim"
end

task :update do
  sh "git submodule foreach git pull"
end

task :default => [:update, :install]

