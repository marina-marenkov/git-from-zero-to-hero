### Build the repo for bisect
BISECT_DIR=/tmp/bisect-demo

source ../../scripts/bash_functions.sh

rm -rf mkdir $BISECT_DIR
mkdir $BISECT_DIR

# Copy the test script to the demo folder
cp ./0502-test_script.sh $BISECT_DIR

cd $BISECT_DIR

git init
git config --local core.safecrlf false

generateRandomFiles 5
generateRandomCommits 1000
echo 'Here is the bug.' >> random3.txt
git add . && git commit -m "The bug is in this commit"
generateRandomCommits 1000

echo 'Number of commits: ' . $(git rev-list --all --count)

###
echo 'Start the bisect'
# Set the first commit as good one
git bisect good $(git rev-list --max-parents=0 HEAD)
# Set the current as bad one
git bisect bad HEAD
git bisect run ./0502-test_script.sh