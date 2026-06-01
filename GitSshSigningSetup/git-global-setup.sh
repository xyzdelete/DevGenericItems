# Git identity
git config --global user.name "Your Name"
git config --global user.email "you@example.com"

# Editor
git config --global core.editor "code --wait"

# SSH signing
# Use SSH instead of GPG for signing
git config --global gpg.format ssh
# SSH program used for verifying signatures
git config --global gpg.ssh.program ssh-keygen
# Auto-sign all commits
git config --global commit.gpgsign true
# Auto-sign tags
git config --global tag.forceSignAnnotated true
# Verifying signed commits
git config --global gpg.ssh.allowedSignersFile ~/.ssh/allowed_signers