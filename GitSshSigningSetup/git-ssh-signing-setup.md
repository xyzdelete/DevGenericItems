# Git, SSH, Signing Setup (GitHub)
## Step 1 — Install tools
Make sure you have:
- Git
- SSH (OpenSSH)
- VS Code
## Step 2 — Generate SSH keys
### Example:
```
ssh-keygen -t ed25519 -C "you@example.com" -f ~/.ssh/id_ed25519_github_auth_key
ssh-keygen -t ed25519 -C "you@example.com" -f ~/.ssh/id_ed25519_github_sign_key
```
- -t ed25519 = key type
- -C = label/comment
- -f = file location
## Step 3 — Add public keys to GitHub
### Example:
- id_ed25519_github_auth_key.pub
- id_ed25519_github_sign_key.pub
## Step 4 — Setup allowed_signers (for commit verification)
### Create / Edit:
- ~/.ssh/allowed_signers
### Example:
```
you@example.com ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIXXXXXX
```
## Step 5 — Configure SSH
### Edit:
- ~/.ssh/config
### Example:
```
Host github.com
  User git
  IdentityFile ~/.ssh/id_ed25519_github_auth_key
  IdentitiesOnly yes
```
---
### Host github.com
- Applies rules only for GitHub connections.
---
### User git
- Required because GitHub SSH always uses:
```
git@github.com
```
---
### IdentityFile
- Path to private SSH key used for authentication.
---
### IdentitiesOnly yes
#### Forces SSH to:
- Use ONLY this key
- Ignore others
#### Prevents:
- Wrong key being tried
- Authentication failures
---
## Step 6 — Configure Git globally
- Check content of the file and then run it
```
bash setup-git-global.sh
```
## Step 7 — Test everything
```
ssh -T git@github.com
git config --global --list
```