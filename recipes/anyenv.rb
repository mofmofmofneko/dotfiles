execute "git clone https://github.com/anyenv/anyenv #{ENV['HOME']}/.anyenv" do
  not_if "test -e #{ENV['HOME']}/.anyenv"
end

link "#{ENV['HOME']}/.zshrc.d/anyenv.zsh" do
  to "#{ENV['HOME']}/.dotfiles/conf/zshrc.d/anyenv.zsh"
end

execute "/bin/zsh -lc 'source #{ENV['HOME']}/.zshrc; anyenv install --force-init'" do
  not_if "test -d #{ENV['HOME']}/.config/anyenv/anyenv-install"
end

execute "/bin/zsh -lc 'source #{ENV['HOME']}/.zshrc; anyenv install rbenv'" do
  not_if "test -d #{ENV['HOME']}/.anyenv/envs/rbenv"
end

execute "git clone https://github.com/sstephenson/ruby-build.git #{ENV['HOME']}/.anyenv/envs/rbenv/ruby-build" do
  not_if "test -d #{ENV['HOME']}/.anyenv/envs/rbenv/plugins/ruby-build"
end

execute "/bin/zsh -lc 'source #{ENV['HOME']}/.zshrc; rbenv install 3.2.2; rbenv global 3.2.2'" do
  not_if "test -d #{ENV['HOME']}/.anyenv/envs/rbenv/versions/3.2.2"
end

execute "/bin/zsh -lc 'source #{ENV['HOME']}/.zshrc; anyenv install pyenv'" do
  not_if "test -d #{ENV['HOME']}/.anyenv/envs/pyenv"
end

execute "/bin/zsh -lc 'source #{ENV['HOME']}/.zshrc; pyenv install 3.9.12; pyenv global 3.9.12'" do
  not_if "test -d #{ENV['HOME']}/.anyenv/envs/pyenv/versions/3.9.12"
end

execute "/bin/zsh -lc 'source #{ENV['HOME']}/.zshrc; pip install powerline-status'" do
  not_if "/bin/zsh -lc 'source #{ENV['HOME']}/.zshrc; pip list | grep powerline-status'"
end
