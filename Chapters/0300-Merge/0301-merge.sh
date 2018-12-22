#!/bin/sh

source ../../scripts/bash_functions.sh
repo_path=/tmp/merge-demo

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


task 'Generating [branch1.txt] on branch1'
git checkout branch1 --quiet
echo 'branch1' >> branch1.txt
git add branch1.txt
task 'Committing [branch1.txt] on branch1'
git commit --quiet -m"Commit#2 on branch1" 
printLog

header 'Merging'

task 'Merging fast-forward with no conflicts (Fast-forward)'
git checkout master --quiet
git merge branch1
printLog

task 'Merging Non fast-forward with no conflicts (--no-ff)'
git reset HEAD^ --hard --quiet
git merge branch1 --no-ff --no-edit
printLog

header 'Generating Conflicts'
task 'Editing [master.txt] on branch1'
git checkout branch1 --quiet
task 'Merging master to branch1 (Fast-Forward)'
git merge --quiet master
echo 'Line3' >> master.txt
git add master.txt 
git commit --quiet -m"Commit#3 on branch1"

task 'Editing [master.txt] on master'
git checkout master --quiet
echo 'Line2' >> master.txt
git add master.txt 
git commit --quiet -m"Commit#3 on master"

printLog

header 'Merging Conflicts'
task 'Executing: git merge branch1'
git merge branch1
task 'Executing: git status'
git status
spacer
git diff

header 'Resolving Conflicts and commiting'
echo -e 'master\n--- Conflict occured here ---' > master.txt
header 'Conflict resolution'
cat master.txt
git add .
git commit --quiet --no-edit
printLog

