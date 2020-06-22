#!/bin/bash

apt-get install -y git

git clone -b monolith https://github.com/express42/reddit.git /home/yc-user/

cd /home/yc-user/reddit && bundle install

cd /home/yc-user/reddit && puma -d -p 3030


