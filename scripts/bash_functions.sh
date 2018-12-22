# Console colors
DEFAULT=$(echo -en '\033[0m')
RED=$(echo -en '\033[00;31m')
GREEN=$(echo -en '\033[00;32m')
YELLOW=$(echo -en '\033[00;33m')
BLUE=$(echo -en '\033[00;34m')
MAGENTA=$(echo -en '\033[00;35m')
PURPLE=$(echo -en '\033[00;35m')
CYAN=$(echo -en '\033[00;36m')
LIGHTGRAY=$(echo -en '\033[00;37m')
LRED=$(echo -en '\033[01;31m')
LGREEN=$(echo -en '\033[01;32m')
LYELLOW=$(echo -en '\033[01;33m')
LBLUE=$(echo -en '\033[01;34m')
LMAGENTA=$(echo -en '\033[01;35m')
LPURPLE=$(echo -en '\033[01;35m')
LCYAN=$(echo -en '\033[01;36m')
WHITE=$(echo -en '\033[01;37m')

# Clear prevoius outputs
clear

# This function print out the log 
printLog(){
  spacer
  echo 'Log: '
  echo '-----------------------------------------------------------'
  git log --all --graph --decorate --oneline 
  echo '-----------------------------------------------------------'
  spacer
}

spacer(){
  printf '\n'
}

header(){
  spacer
  echo ${YELLOW}$1${DEFAULT}
}

task(){
  echo ${GREEN}  - $1${DEFAULT}
}

addCommits(){
  # Get the branch name
  branch_name=$1
  show_log=$2
  task 'Committing 3 commits on '$branch_name
  
  # Check to see if the branch exist
  if [ `git branch --list $branch_name` ]
  then
    git checkout $branch_name --quiet
  else  
    git checkout -b $branch_name --quiet
  fi
  
  for i in `seq 1 3`;
    do
      echo $branch_name >> $branch_name.txt
      git add .
      git commit --quiet -m"Commit on "$branch_name 
    done  
  
  if [ "$show_log" != "false" ] 
  then
      printLog
  fi
  
}

generateRandomCommits(){
  echo 'generating random content'
  
  for (( filenumber = 1; filenumber <= $1 ; filenumber++ )); 
  do
      echo -en "Some new random text: $RANDOM" >> random1.txt
      git add random1.txt 
      git commit --quiet -m"A random change of $RANDOM"
      printf '\r%d'$filenumber/$1
  done
}

generateRandomFiles(){
  for (( filenumber = 1; filenumber <= $1 ; filenumber++ )); 
  do
      echo "Some new random text: $RANDOM" >> random$filenumber.txt
      git add .
      git commit --quiet -m"A random change in random$filenumber.txt"
  done

}