Description
===========

Chef cookbook to install and configure apt-mirror. This will automate the creation of
repository mirrors for Ubuntu and for additional APT repositories.

Requirements
------------

* Tested on Ubuntu 14.04

Attributes
----------

* node['apt-mirror']['base_path'] - Base path for mirror files. Default `/var/spool/apt-mirror`.
* node['apt-mirror']['defaultarch'] - To specify which platform arch to mirror. Default `amd64`.
* node['apt-mirror']['run_postmirror'] - Execute the postmirror script. Default `0`
* node['apt-mirror']['nthreads'] - Set number of threads to use for downloading packages. Default `20`.
* node['apt-mirror']['_tilde'] - 
* node['apt-mirror']['cron']['active'] - Have Chef schedule to run in cron. Default `false`.
* node['apt-mirror']['cron']['minute'] - Minute
* node['apt-mirror']['cron']['hour'] - Hour
* node['apt-mirror']['cron']['day'] - Day.
* node['apt-mirror']['cron']['weekday'] - Weekday. Default is everyday.
* node['apt-mirror']['nginx']['port'] - Set port for nginx to run. Default `80`.
* node['apt-mirror']['nginx']['aliases'] - The nginx alias locations
* node['apt-mirror']['repository_locations'] - List of repository locations to set in mirror.list
* node['apt-mirror']['clean_locations'] - List of clean locations to set in mirror.list

Usage
-----
Include `recipe[apt-mirror]` in the run_list.
Include `recipe[apt-mirror::nginx]` in the run_list to include a web server front end.

Repository
----------

https://github.com/rich-murray/apt-mirror.git

License and Authors
-------------------

Author:: Aaron Baer (aaron@hw-ops.com)
Author:: Richard Murray (richard.murray@gmail.com)
Author:: Graham Weldon (graham.weldon@mail.rakuten.com)

