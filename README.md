# profanity openQA test suite

Based on the [os-autoinst-distri-example](https://github.com/os-autoinst/os-autoinst-distri-example) template.

This project was started during [Hackweek 18](https://hackweek.suse.com/18/projects/write-openqa-testsuite-for-profanity) at SUSE.

## Installation
Please follow the openQA [installation guide](http://open.qa/docs/#installing) to install it.
Then clone this repo to `/var/lib/openqa/tests/openqa-profanity-testsuite`:

```
cd /var/lib/openqa/tests
git clone https://github.com/profanity-im/openqa-profanity-testsuite
```

## Running the test
For now we clone existing jobs from openSUSE.

Go to https://openqa.opensuse.org/tests/973501#next_previous and click on *latest job for this scenario*.
Then read *Results for 973501* where 973501 will be a different number.
Use this number to clone the job:

```
openqa-clone-job --skip-chained-deps --host http://localhost/ --from https://openqa.opensuse.org --show-progress 973501 TEST=proftest DISTRI=openqa-profanity
```

