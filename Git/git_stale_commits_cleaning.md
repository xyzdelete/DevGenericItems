git for-each-ref refs/agents --format="%(refname) %(objectname:short) %(subject)"

git for-each-ref --format="%(refname)" refs/agents | ForEach-Object { git update-ref -d $_ }