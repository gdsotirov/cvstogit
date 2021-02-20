#!/bin/sh
# Rereate SlackBuilds repository in Git
#
# This scripts recreates SlackBuilds repository in Git, because proper
# migration is not possible due to its structure and the modifications of this
# structure done manually in CVS in the past. The different build scripts are
# organized as separate repositories and incorporated in this superproject as
# submodules.
#

mkdir repo; cd repo

git init

cp ../COPYING ../README .
git add COPYING README
GIT_COMMITTER_DATE="Sat Jan 22 20:31:42 2005 +0200" \
git commit --no-gpg-sign --date "Sat Jan 22 20:31:42 2005 +0200" \
            -m 'Initial version' COPYING README

git submodule add -b SLACK-10_2 \
    https://github.com/gdsotirov/net-snmp.SlackBuild.git net-snmp
GIT_COMMITTER_DATE="Sat Jan 22 20:48:22 2005 +0200" \
git commit --no-gpg-sign --date "Sat Jan 22 20:48:22 2005 +0200" \
            -m 'Add net-snmp' .gitmodules net-snmp

git submodule add -b SLACK-10_2 \
    https://github.com/gdsotirov/hddtemp.SlackBuild.git hddtemp
GIT_COMMITTER_DATE="Thu Mar 03 17:25:16 2005 +0200" \
git commit --no-gpg-sign --date "Thu Mar 03 17:25:16 2005 +0200" \
            -m 'Add hddtemp' .gitmodules hddtemp

git submodule add -b SLACK-10_2 \
    https://github.com/gdsotirov/mysql.SlackBuild.git mysql
GIT_COMMITTER_DATE="Fri Mar 11 23:01:00 2005 +0200" \
git commit --no-gpg-sign --date "Fri Mar 11 23:01:00 2005 +0200" \
            -m 'Add mysql' .gitmodules mysql

git submodule add -b SLACK-10_2 \
    https://github.com/gdsotirov/php.SlackBuild php
GIT_COMMITTER_DATE="Sat Mar 12 15:06:01 2005 +0200" \
git commit --no-gpg-sign --date "Sat Mar 12 15:06:01 2005 +0200" \
            -m 'Add php' .gitmodules php

# TODO: Add more commits here.

