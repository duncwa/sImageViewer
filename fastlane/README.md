fastlane documentation
================
# Installation

Make sure you have the latest version of the Xcode command line tools installed:

```
xcode-select --install
```

Install _fastlane_ using
```
[sudo] gem install fastlane -NV
```
or alternatively using `brew install fastlane`

# Available Actions
## iOS
### ios generate_rls_ipa
```
fastlane ios generate_rls_ipa
```
Run unit tests for sFastIcon iOS App
### ios generate_dev_ipa
```
fastlane ios generate_dev_ipa
```

### ios test_ios_pra
```
fastlane ios test_ios_pra
```
Run unit tests for sFastIcon iOS App
### ios test_ios_qe
```
fastlane ios test_ios_qe
```
Run simulator tests for sFastIcon iOS App
### ios run_ios_ins
```
fastlane ios run_ios_ins
```
Run simulator tests for sFastIcon iOS App
### ios screenshots
```
fastlane ios screenshots
```
Generate new localized screenshots for sFastIcon
### ios ios_danger
```
fastlane ios ios_danger
```
Run Danger for PRA Commit to Repo Comments

----

This README.md is auto-generated and will be re-generated every time [fastlane](https://fastlane.tools) is run.
More information about fastlane can be found on [fastlane.tools](https://fastlane.tools).
The documentation of fastlane can be found on [docs.fastlane.tools](https://docs.fastlane.tools).
