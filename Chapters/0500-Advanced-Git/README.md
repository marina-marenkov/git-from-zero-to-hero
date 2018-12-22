# Some cool/Advanced comands

This section contains:
* What is HEAD
* Bisect
* assume-unchanged
* Advanced log 
* rerere


### Grab a single file from a stash
    git checkout stash@{0} -- path

### Show all untracked files
    git ls-files --others -i --exclude-standard

### Create new working tree 
    git worktree add -b <branch> <path> <SHA-1>

### Show all commits in the current branch yet to be merged to master
    git cherry -v master <branch; default = HEAD>

### Print ignored files
    git check-ignore * -v
    