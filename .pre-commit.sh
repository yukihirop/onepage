git diff master --name-only | grep _spec | xargs -n1 bin/rspec
