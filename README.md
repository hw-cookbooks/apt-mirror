Description
===========

This cookbook installs and configures apt-mirror. This will automate the creation of
repository mirrors for Ubuntu and for additional APT repositories.

Requirements
------------

* Ubuntu 10.04 / Ubuntu 12.04
* Data Bag named apt-mirror

```json
{
  "id": "sensu",
  "source": "deb  http://repos.sensuapp.org/apt sensu main",
  "fqdn": "repos.sensuapp.org"
}
```

Attributes
----------

*  node['apt-mirror']['base_path'] - Base path for mirror files.
*  node['apt-mirror']['nodearch'] - To specify which platform arch to mirror. Default is amd64.
*  node['apt-mirror']['run_postmirror'] - 
*  node['apt-mirror']['nthreads'] - Set number of threads to use for downloading packages.
*  node['apt-mirror']['_tilde'] - 
*  node['apt-mirror']['cron']['active'] - Have Chef schedule to run in cron.
*  node['apt-mirror']['cron']['minute'] - Minute
*  node['apt-mirror']['cron']['hour'] - Hour
*  node['apt-mirror']['cron']['day'] - Day.
*  node['apt-mirror']['cron']['weekday'] - Weekday. Default is everyday.
*  node['apt-mirror']['nginx']['port'] - Set port for nginx to run.

Usage
-----
Include `recipe[apt-mirror]` in the run_list.
Include `recipe[apt-mirror::nginx]` in the run_list to include a web server front end.

Repository
----------

https://github.com/hw-cookbooks/apt-mirror

License and Authors
-------------------

Author:: Aaron Baer (<aaron@hw-ops.com>)
