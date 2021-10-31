#!/bin/bash

###################################################
# user
###################################################
git config --global user.name "<your name>"
git config --global user.email "<mail@sample.com>"

###################################################
# core
###################################################
git config --global core.autocrlf input
git config --global core.safecrlf true
git config --global core.ignorecase true
git config --global core.quotepath false

###################################################
# basic command alias
###################################################
git config --global alias.a add
git config --global alias.b branch
git config --global alias.ch checkout
git config --global alias.co commit
git config --global alias.cp cherry-pick
git config --global alias.d diff
git config --global alias.f fetch
git config --global alias.g grep
git config --global alias.l log
git config --global alias.ls ls-files
git config --global alias.m merge
git config --global alias.pl pull
git config --global alias.ps push
git config --global alias.rb rebase
git config --global alias.rl reflog
git config --global alias.rs reset
git config --global alias.rt remote
git config --global alias.rv revert
git config --global alias.s status

###################################################
# add
###################################################
git config --global alias.aa "add -A"
git config --global alias.ap "add -p"
git config --global alias.au "add -u"


###################################################
# branch
###################################################
git config --global alias.ba "branch -a"
git config --global alias.br "branch -r"
git config --global alias.bl "branch -l"
git config --global alias.bv "branch -v"
git config --global alias.bvv "branch -vv"
git config --global alias.bav "branch -avv"
git config --global alias.bsu "branch --set-upstream"
git config --global alias.busp "branch --unset-upstream"　
git config --global alias.bm "branch -m"
git config --global alias.bmm "branch -M"
git config --global alias.bc "branch -c"
git config --global alias.bcc "branch -C"
git config --global alias.bd "branch -d"
git config --global alias.bdd "branch -D"
git config --global alias.bmg "branch --merged"
git config --global alias.bnmg "branch --no-merged"

###################################################
# commit
###################################################
git config --global alias.coa "commit --amend"
git config --global alias.coan "commit --amend --no-edit"
git config --global alias.coam "commit --amend -m"
git config --global alias.coi "commit --interactive"
git config --global alias.com "commit -m"
git config --global alias.cof "commit --allow-empty -m \"Initial commit\""

###################################################
# checkout
###################################################
git config --global alias.chb "checkout -b"

###################################################
# cherry-pick
###################################################
git config --global alias.cpnx "cherry-pick --no-commit -x"

###################################################
# diff
###################################################
git config --global alias.dc "diff --cached"
git config --global alias.ds "diff --staged"
git config --global alias.dw "diff --word-diff"

###################################################
# log
###################################################
git config --global alias.lg "log --graph"
git config --global alias.lo "log --oneline"
git config --global alias.lp "log --path"
git config --global alias.lt "log --topo-order"
git config --global alias.ll "log --graph --oneline --decorate --date=short --pretty='format:%C(yellow)%h %C(cyan)%ad %C(green)%an%Creset%x09%s %C(red)%d%Creset'"
git config --global alias.la "log --graph --oneline --decorate --branches --tags --remotes"

###################################################
# merge
###################################################
git config --global alias.mgf "merge --ff"
git config --global alias.mgnf "merge --no-ff"

###################################################
# push
###################################################
git config --global alias.psf "push --force-with-lease"

###################################################
# pull
###################################################
git config --global alias.plf "!git fetch -p && git pull"

###################################################
# rebase
###################################################
git config --global alias.rbi "rebase -i"
git config --global alias.rbc "rebase --continue"
git config --global alias.rbs "rebase --skip"
git config --global alias.rba "rebase --abort"

###################################################
# remote
###################################################
git config --global alias.rtu "remote update"
git config --global alias.rts "remote show"
git config --global alias.rtp "remote prune"

###################################################
# reset
###################################################
git config --global alias.rss "reset --soft HEAD~1"
git config --global alias.rsh "reset --hard HEAD~1"
git config --global alias.rsc '!git reset --hard HEAD~1 && git clean -fd'

###################################################
# revert
###################################################
git config --global alias.rvn "revert --no-commit"

###################################################
# status
###################################################
git config --global alias.ss "status --short"
git config --global alias.ssb "status --short --branch"

###################################################
# upstream
###################################################
git config --global alias.publish '!f() { [ $# = 1 ] && git push -u origin $1 || git push -u origin $(git cur-bname); }; f'
git config --global alias.unpublish '!f() { [ $# = 1 ] && git push origin :$(git cur-bname); }; f'

###################################################
# alias management
###################################################
# show alias list
git config --global alias.alias '!git config -l | grep "alias\." | sed "s/alias\.\([^=]*\)=\(.*\)/\1\\t => \2/" | sort'

# Add alias
git config --global alias.alias-add '!f() { [ $# = 3 ] && git config $1 alias.$2 $3 && return 0 || echo "\033[33mUsage:\033[00m git alias-add-(l|g) <new alias name> <original command>" >&2 && return 1; }; f'
git config --global alias.alias-add-l '!git alias-add --local'
git config --global alias.alias-add-g '!git alias-add --global'

# Rename alias
git config --global alias.alias-rn '!f() { [ $# = 3 ] && [ $2 != $3 ] && [ ! -z "$(git config $1 --get alias.$2)" ] && [ -z "$(git config $1 alias.$3)" ] && git config $1 alias.$3 "$(git config $1 --get alias.$2)" && git config $1 --unset alias.$2 && return 0 || echo "\033[33mUsage:\033[00m git alias-rn-(l|g) <existing alias name> <new alias name>\n       The alias you are going to rename must exist and new must not exist." >&2 && return 1; }; f'
git config --global alias.alias-rn-l '!git alias-rn --local'
git config --global alias.alias-rn-g '!git alias-rn --global'

# Delete alias
git config --global alias.alias-rm '!f() { [ $# = 2 ] && git config $1 --unset alias."$2" && return 0 || [ $# = 2 ] && [ -z "$(git config $1 --get alias.$2)" ] && echo "\033[31mError: [alias.$2] Alias name does not exist.\033[00m" && return 1 || echo "\033[33mUsage:\033[00m git alias-dl-(l|g) <remove alias name>" >&2 && return 1; }; f'
git config --global alias.alias-rm-l '!git alias-rm --local'
git config --global alias.alias-rm-g '!git alias-rm --global'
git config --global alias.alias-rma-l '!git config --local --remove-section alias'
git config --global alias.alias-rma-g '!git config --global --remove-section alias'

###################################################
# config management
###################################################
git config --global alias.confls '!f() { git config $1 -l | grep "alias\." -v; }; f'
git config --global alias.confls-l '!git confls --local'
git config --global alias.confls-g '!git confls --global'
git config --global alias.confls-s '!git confls --system'
git config --global alias.confgr '!f() { [ $# = 2 ] && git config $1 --get-regexp $2 || echo "\033[33mUsage:\033[00m git confgr-(l|g|s) <grep text>" >&2; }; f'
git config --global alias.confgr-l '!git confgr --local'
git config --global alias.confgr-g '!git confgr --global'
git config --global alias.confgr-s '!git confgr --system'

###################################################
# shell scripting aliases
###################################################
git config --global alias.cur-bname '!git symbolic-ref --short HEAD'
