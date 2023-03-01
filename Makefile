install:
	bundle install
lint:
	bundle exec rubocop lib/ test/
test:
	bundle exec rake test