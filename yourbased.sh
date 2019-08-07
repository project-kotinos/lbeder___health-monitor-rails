
#!/usr/bin/env bash
set -ex

export DEBIAN_FRONTEND=noninteractive

bundle install --jobs=3 --retry=3
bundle exec rake rubocop
