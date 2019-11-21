#!/bin/sh -l
echo "::set-output name=conflicts::"

if
    grep -lr -R --exclude-dir={node_modules,vendor,.git} --exclude=conflictFinder '<<<<<<<' .;
then
    printf "\033[1;31mFound merge conflicts.\033[0m\n"
    exit 1;
else
    printf "\033[0;32mNo merge conflicts found.\033[0m\n"
    exit 0;
fi
