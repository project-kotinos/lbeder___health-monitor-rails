
#!/usr/bin/env bash
set -ex

export DEBIAN_FRONTEND=noninteractive
gem install bundler -v '< 2.0'
bundle install --jobs=3 --retry=3
bundle exec rake rubocop
bundle exec rspec
