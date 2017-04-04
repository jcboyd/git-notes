#!/bin/bash

cd ; mkdir github-repo ; cd github-repo ; echo "github-repo\n" >> README.md

# Initialise a repository

git init

# Stage files

git add README.md

# and finally commit them

git commit -m 'first commit'

# This above is the fundamental workflow of git. Each commit is a pointer to a 
# tree describing a snapshot of the repository at a given time. The tree 
# consists of a HEAD pointer that indicates the current snapshot.

# On a git server such as GitHub, the local repository is declared as having its
# origin on a remote server, such as,

git remote add origin https://github.com/jcboyd/github-repo

# then pushed with

git push -u origin master

# git will record the parameter for pushing to the remote origin in future 
# pushes,

git push

# Branching is a functionality of git that is particularly well designed. We can
# display all available branches with,

git branch

# Initially, there will be just one branch, denoted master by default. There is 
# nothing special about the name master, and it any alternative name is 
# permitted. One can create a branch in a repository with,

git branch branch-name

# We can start to work on this branch with

git checkout branch-name

# HEAD now points to branch-name. We can make changes here,

echo 'an interactive introduction to git\n' >> README.md

git add README.md ; git commit -m 'added README description'

# and return to the master branch,

git checkout master

# git returns the working directory to the snapshot corresponding to the 
# last commit in master. Thus, README.md will not include the description. 
# Moreover, had we created new files in the new branch, they would now disappear
# from the working directory, stored somewhere in the hidden .git directory. To 
# merge the change to the master branch we call,

git merge branch-name

# The change will be merged seamlessly, as it conists of an edit to a
# non-overlapping part of a text file. Git may require a merge message, which
# serves as a commit message.

# To display information on the commit 
# history, we use,

git log --oneline --decorate

# with various options. To depict the graph of all branches, one may call,

git log --graph --all

# Having merged the changes, we can delete the branch,

git branch -d branch-name

# If on the other hand we were to make an overlapping change,

git checkout -b branch-name

sed -i -e 's/interactive/instructive/g' README.md

git add README.md ; git commit -m 'modified README description'

git checkout master ; git merge branch-name

# git will not try to merge the changes,

git status

# and we would need to intervene manually, deciding which changes to keep. Once
# satisfied, we could stage the changes,

git add README.md

# If we are working with other collaborators on a repository hosted remotely, we
# should stage and commit our changes, then call,

git pull

# the pull command knowing the remote URI specified at initialisation. Conflicts
# may require manual fixes.

# Forking is a feature of GitHub (though exists conceptually in other version
# control platforms), rather than git specifically. It is a mechanism to foster
# open-source collaboration: a developer will fork an existing project via the
# GitHub interface, clone it to his or her system, commit changes, push back to
# GitHub, before finally making a pull request. A pull request opens a thread on
# the repository's page so as to open a discussion with the main developer.
# GitHub also assesses whether the change can be merged seamlessly or not.
