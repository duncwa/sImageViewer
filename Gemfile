#!/usr/bin/env groovy
#
#   Gemfile
#   sImageViewer
#   Created by Duncan Wallace 09/08/2020
#   Copyright © 2020. Duncwa LLC.  All rights reserved

# source 'https://github.com/danger'
source 'https://rubygems.org'
  gem 'octokit'
  gem 'gitlab'
  gem 'aws-sdk-s3'
  gem 'fastlane'
  gem 'danger'
  gem 'jenkins_api_client'
  gem 'xcpretty-json-formatter'
  gem 'artifactory'
  gem 'fastlane-plugin-appcenter', '~> 1.11.1'
# gem 'trainer'
# gem 'fastlane-plugin-trainer'
  gem 'cocoapods'
  gem 'json'
  gem 'nokogiri'
  gem 'plist'
  gem 'pry'
  gem 'psych'
  gem 'rubyzip'
  gem 'time'
  gem 'xcode-install'
# gem 'golint'
# gem 'danger-ruby-swiftlint' #A Danger plugin for SwiftLint.
# gem 'danger-xcode_summary' #A Danger plugin showing all build errors, warnings and unit tests results from xcodebuild.
# gem 'danger-xcov' #Danger plugin to validate the code coverage of the files changed in a pull request.
# gem 'danger-mention' #Danger plugin to automatically mention potential reviewers on pull requests.
# gem 'danger-xcprofiler' #Danger plugin for asserting Swift compilation time.
# gem 'danger-prose' #Danger plugin to lint your blog posts with proselint.
# gem 'danger-junit' #Lets you report your test suite problems back to the PR elegantly.
# gem 'danger-commit_lint' #Use Danger to lint your commit messages.
# gem 'danger-code_style_validation' #Danger plugin for code style validation based on clang-format.
# gem 'danger-ktlint' #A Danger Plugin to lint kotlin files using ktlint command line interface.
# gem 'danger-android_lint' #A Danger plugin for Android Lint.
# gem 'danger-lgtm' #Let Danger say LGTM!
# gem 'Danger-Slather' #Danger plugin for Slather framework.
# gem 'danger-pronto' #A Danger plugin to lint files through Pronto.
# gem 'danger-xcodebuild' #Exposes warnings, errors and test results.
# gem 'danger-synx' #A Danger plugin for Synx.
# gem 'danger-clorox' #A Danger plugin for Clorox.
# gem 'danger-the_coding_love' #Danger plugin that prints markdown containing a random post from thecodinglove.com
# gem 'danger-pep8' #A Danger plugin for Python's PEP 8.
# gem 'danger-checkstyle_format' #Danger plugin for checkstyle formatted xml file.
# gem 'danger-findbugs' #Danger plugin for findbugs formatted xml file.
# gem 'danger-pmd' #Danger plugin for PMD formatted XML file.
# gem 'danger-missed_localizable_strings' #A Danger plugin to remind developers to localize strings.
# gem 'danger-todoist' #Danger plugin to look for todo/fixme comments in pull requests.
# gem 'danger-ios_logs' #Danger plugin to detect any NSLog/print entries left in the code.
# gem 'danger-hlint' #A Danger plugin for Hlint.
# gem 'eslintrb' #A Danger plugin for linting javascript with eslint.
# gem 'danger-jira' #Danger plugin to link JIRA issues in a pull request.
# gem 'danger-ruby-swiftformat' #A danger plugin to check Swift formatting using SwiftFormat.
# gem 'danger-vale' #Vale plugin for Danger.
# gem 'danger-slack' #Post a notification to slack in a Dangerfile.
# gem 'danger-review_requests' #Danger plugin to request a review in pull requests.
# gem 'danger-brakeman' #A Danger plugin for Brakeman.
# gem 'danger-go' #A Danger plugin for Golang.
# gem 'danger-kotlin-android-lint-plugin'
gem 'rspec'
gem 'rspec_junit_formatter'
gem 'rubocop'
gem 'rubocop-performance'
gem 'simplecov'
gem 'simplecov-json'

plugins_path = File.join(File.dirname(__FILE__), 'fastlane', 'Pluginfile')
eval_gemfile(plugins_path) if File.exist?(plugins_path)
