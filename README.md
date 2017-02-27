# Ferris [![Build Status](https://travis-ci.org/automation-wizards/ferris.svg?branch=master)](https://travis-ci.org/automation-wizards/ferris)

## Synopsis

An un-opinionated testing framework built on top of WATIR which provides massive power with minimal DSL. 

## Installation

Ensure that you have the most up to date version of chromedriver installed, this can be done using brew:

    $ brew update
    $ brew install chromedriver
    
Or you can download it directly here : https://sites.google.com/a/chromium.org/chromedriver/downloads

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
    
    Wikipedia
      can search
      can check a region is present
      can check a page is loaded
      can check an elements keyword
      can throw a .loaded? exception
      can throw a .present? exception
    
    Finished in 11.82 seconds (files took 0.39788 seconds to load)
    6 examples, 0 failures
