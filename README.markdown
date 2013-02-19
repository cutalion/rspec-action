[![Build Status](https://secure.travis-ci.org/cutalion/rspec-action.png)](http://travis-ci.org/#!/cutalion/rspec-action)
[![Code Climate](https://codeclimate.com/badge.png)](https://codeclimate.com/github/cutalion/rspec-action)

# rspec-action

An extension to rspec, which provides an `action` command to rspec examples

# Description

rspec-action is an extension to rspec2, which allows you to specify the last before hook.
I named it `action`, because it's quite helpful for me in the controller specs.

*IMPORTANT*  
Use rspec-action 1.0.0 for Rspec 2.11 or lower.

I prefer to write

```ruby
describe "GET index" do
  action { get :index }

  context 'if user signed in' do
    before { sign_in user }
    it { should respond_with :success }
  end

  context 'if user signed out' do
    it { should redirect_to sign_in_path }
  end
end
```

instead of

```ruby
describe "GET index" do
  context 'if user signed in' do
    before { sign_in user }
    before { get :index }
    it { should respond_with :success }
  end

  context 'if user signed out' do
    before { get :index }
    it { should redirect_to sign_in_path }
  end
end
```

# Requirements

* [rspec2](https://github.com/rspec/rspec) ~> 2.0

# Installation

  gem install rspec-action
