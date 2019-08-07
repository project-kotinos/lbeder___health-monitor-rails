
#!/usr/bin/env bash
set -ex

export DEBIAN_FRONTEND=noninteractive
gem install bundler
gem install tzinfo
gem install tzinfo-data
bundle install --jobs=3 --retry=3
bundle exec rake rubocop
bundle exec rspec
