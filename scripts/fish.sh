# install fish
sudo apt-get install fish

# Set fish as default shell
echo $(which fish) | sudo tee -a /etc/shells

# Change default shell
chsh -s $(which fish)