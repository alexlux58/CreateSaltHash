#!/bin/bash

gitCreateNewRepo() {
    FILE=README.md
    if [ -f "$FILE" ]; then
        return
    else
        echo "Please enter what you want to put in your README.md"
        read readme
        echo "Please enter your commit message"
        read message
        echo "# $readme" >> README.md
        git init
        git add .
        git commit -m "$message"
        git branch -M main
        echo "Please enter your GitHub repositories link"
        read link
        git remote add origin "$link"
        git push -u origin main
    fi
}

gitPushExistingRepo() {
    echo "Please enter your GitHub repositories link"
    read link
    git remote add origin "$link"
    git branch -M main
    git push -u origin main
}

gitUpdateRepo() {
    git status
    git add .
    echo "Please enter your commit message"
    read message
    git commit -m "$message"
    git push -u origin main
}

echo "Do you want to (Enter a 1, 2, 3):\n"
echo "1. Create a new repository"
echo "2. Push an existing repository"
echo "3. Update an existing repository"
read choice

if [[ $choice == 1 ]]; then
    gitCreateNewRepo
elif [[ $choice == 2 ]]; then
    gitPushExistingRepo
elif [[ $choice == 3 ]]; then
    gitUpdateRepo
else
    echo "Invalid choice"
fi

echo "finished"