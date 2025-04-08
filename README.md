# My Configurations

These include the configurations for development.

- .zshrc
- .vimrc

# Setup Mac

Generating SSH keys:

```
ssh-keygen -t rsa -b 4096 -C "my@email.com"
```

```
# First generate a key
gpg --full-generate-key
# Then do:
gpg --list-secret-keys --keyid-format=long
# Grab the ID
gpg --armor --export <ID>
```

More will be added as I find out cool tips. Let me know if you want to share some of your tips.


# Homebrew

To generate the Brewfile

```
brew bundle dump --file=updated_brewfile --no-vscode
```

Then do a comparison to see what's missing. This can change based on envs.

To install packages

```
brew bundle
```
