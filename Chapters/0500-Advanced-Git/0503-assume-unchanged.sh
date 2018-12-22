#!/bin/sh

source ../../scripts/bash_functions.sh
repo_path=/tmp/assume-demo

################
# Preparations #  
################
header 'Preparing the repository for the demo'
task   'Removing old content'
rm -rf $repo_path
mkdir $repo_path

task 'Initializing git repository in '${MAGENTA}$repo_path
cd $repo_path
git init --quiet
git config --local core.safecrlf false

header 'Generating content'

task 'Generating content on branch master'
echo -e 'A=1\nB=2\nC=3' > config.txt
git add . 
git commit --quiet -m"Config on master"

task 'Generating content on branch1 master'
git checkout -b branch1 --quiet
echo -e 'D=4' >> config.txt
git add .
git commit --quiet -m"Config on branch1"

task 'Simple merging - get the changes'
git checkout --quiet master
git merge branch1

echo '------------- Master content -------------'
cat config.txt
echo '------------------------------------------'

task 'Add more changes on branch1'
git checkout --quiet branch1
echo -e 'E=5' >> config.txt
git add .
git commit --quiet -m"Config E=5 on branch1"

task 'Switch to master and add changes'
git checkout --quiet master
echo -e 'F=6' >> config.txt
echo '------------- Master content -------------'
git status
printf '\n'
git diff 
echo '------------------------------------------'

task 'Show the diffrence between the branches'
echo '---------- master vs branch1 -------------'
git show master..branch1
echo '------------------------------------------'

task 'Tell git to ignore local changes'
task 'git update-index --assume-unchanged -- config.txt'
git update-index --assume-unchanged --skip-worktree config.txt
git ls-files -v|grep '^S'
echo '---------- local master content ----------'
cat config.txt
echo '---------- master vs branch1 -------------'
git show master..branch1
echo '------------------------------------------'

task 'git status should not track the local changes'
git status

git merge branch1

