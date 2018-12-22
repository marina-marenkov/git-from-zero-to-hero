#!/bin/sh

source ../../scripts/bash_functions.sh
repo_path=/tmp/rebase-demo

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

task 'Generating [master.txt] on branch master'
echo 'master' > master.txt
git add master.txt
task 'Committing [master.txt] on branch master'
git commit --quiet -m"Commit#1 on master" 

task 'Creating branch named [branch1] based upon master'
git branch branch1
printLog

addCommits branch1
addCommits master

task 'Merging with rebase (master is our base branch)'
git checkout branch1
git rebase master
printLog

addCommits branch1
addCommits master
git checkout branch1
printLog
git rebase master
printLog

task 'Merging with --no-ff. branch1 into master'
git checkout --quiet master
git merge --no-ff branch1 --quiet --no-edit
printLog