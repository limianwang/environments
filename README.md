# My Configurations

These include the configurations for development.

- .zshrc
- .vimrc

# Setup Mac

Generating SSH keys:

```
ssh-keygen -t rsa -b 4096 -C "my@email.com"
```

More will be added as I find out cool tips. Let me know if you want to share some of your tips.


# Homebrew

To generate the Brewfile

```
brew bundle dump --file=updated_brewfile
```

Then do a comparison to see what's missing. This can change based on envs.

To install packages

```
brew bundle
```
