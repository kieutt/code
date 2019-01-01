# Online Judge System
## cms installer on ubuntu 18.04
### run patch before run

v1.4.rc1: Version 1.4.rc1

https://github.com/cms-dev/cms/releases/

## Installation

```
chmod a+x install.sh
./install install
```

Now CMS is installed.

## Running CMS

```
source /usr/local/lib/cms/bin/activate
... # your commands here
deactivate
```

For example,

```
source /usr/local/lib/cms/bin/activate
cmsInitDB
cmsAddAdmin -p 12345678 admin
cmsAdminWebServer
# Now visit localhost:8889, you should see the admin page.
deactivate
```
