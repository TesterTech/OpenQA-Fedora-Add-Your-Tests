# OpenQA-Fedora-Add-Your-Tests
Code for the YouTube video https://youtu.be/UgqrQKfgQ-4

## What actually is OpenQA
OpenQA is an open source GUI testing tool which uses image recognition to validate expected versus actual outcome.
Uses OpenCV to search for a needle (expected image) in a haystack (actual screen output)

Supports various asserting functions and also:
- SendKeys 
- Click
- Wait for
- More on the internal API can be found here: https://open.qa/api/testapi/

When a OpenQA testing session is started, a Virtual Machine using Virtualization software is started and OpenQA connects to it using VNC. 

It uses OpenCV to validate expected images versus actual images. To create those expected images you must create needles for the applications you want to test. You can use the OpenQA webUI to create or update those needles. 

## Fedora's tests Pagure
- https://pagure.io/fedora-qa/os-autoinst-distri-fedora
- https://pagure.io/fork/endegraaf/fedora-qa/os-autoinst-distri-fedora

- Note: I remove the existing tests from the machine and replace that with the tests from my fork.

## Light version (example) 
- https://pagure.io/fork/endegraaf/fedora-qa/os-autoinst-distri-fedora/blob/master/f/templates-light.fif.json
- After that use the fifloader.py to update your OpenQA installation. 
- ```python ./fifloader.py --load <your template file.fif.json>```

## Clone a Test Job from Fedora
```sudo openqa-clone-job --from openqa.fedoraproject.org 937916 --skip-chained-deps _SKIP_POST_FAIL_HOOKS=1```

## Post the ISO

```openqa-client isos post DISTRI=fedora VERSION="*" ISO=Fedora-Workstation-Live-x86_64-Rawhide-20210729.n.0.iso ARCH=x86_64 FLAVOR=Workstation-live-iso```
 
