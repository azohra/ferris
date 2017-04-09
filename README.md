# Ferris [![Build Status](https://travis-ci.org/automation-wizards/ferris.svg?branch=master)](https://travis-ci.org/automation-wizards/ferris) [![Coverage Status](https://coveralls.io/repos/github/automation-wizards/ferris/badge.svg?branch=master)](https://coveralls.io/github/automation-wizards/ferris?branch=master)

## Synopsis

An opinionated testing framework built on top of WATIR which provides massive power with minimal DSL. 

## Installation

Add this line to your gemfile:

    gem 'ferris_drops' git: 'https://github.com/automation-wizards/ferris.git'

And install it using:

    $ bundle install
    
To use this library in your code:

    require 'ferris'

## Running the demo specs in this repo

Clone this repo and cd into it.

Run:

    $ bundle install
    $ bundle exec rspec
    
Ferris should run a number of tests against wikipedia and you should see an output like this in your terminal:

    [Coveralls] Set up the SimpleCov formatter.
    [Coveralls] Using SimpleCov's default settings.
    
    Ferris
      Page
        visit
        title
        url
      Region
        exists?
        present?
        click
      Element
        set keyword
        do
        do!
    
    Finished in 2.98 seconds (files took 1.26 seconds to load)
    9 examples, 0 failures
