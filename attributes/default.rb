default['apt-mirror']['base_path']          = '/var/spool/apt-mirror'
default['apt-mirror']['defaultarch']        = 'amd64'
default['apt-mirror']['run_postmirror']     = 0
default['apt-mirror']['nthreads']           = 20
default['apt-mirror']['_tilde']             = 0
default['apt-mirror']['cron']['active']     = false
default['apt-mirror']['cron']['minute']     = 0
default['apt-mirror']['cron']['hour']       = 5
default['apt-mirror']['cron']['day']        = '*'
default['apt-mirror']['cron']['weekday']    = '*'
default['apt-mirror']['repository_locations'] = [
    'deb http://gb.archive.ubuntu.com/ubuntu trusty main restricted universe multiverse',
    'deb http://gb.archive.ubuntu.com/ubuntu trusty-security main restricted universe multiverse',
    'deb http://gb.archive.ubuntu.com/ubuntu trusty-updates main restricted universe multiverse',    
    'deb-src http://gb.archive.ubuntu.com/ubuntu trusty main restricted universe multiverse',
    'deb-src http://gb.archive.ubuntu.com/ubuntu trusty-security main restricted universe multiverse',
    'deb-src http://gb.archive.ubuntu.com/ubuntu trusty-updates main restricted universe multiverse' ]                

default['apt-mirror']['clean_locations'] = [
    'http://gb.archive.ubuntu.com/ubuntu']
    
#deb http://gb.archive.ubuntu.com/ubuntu trusty-proposed main restricted universe multiverse
#deb http://gb.archive.ubuntu.com/ubuntu trusty-backports main restricted universe multiverse
#deb-src http://gb.archive.ubuntu.com/ubuntu trusty-proposed main restricted universe multiverse
#deb-src http://gb.archive.ubuntu.com/ubuntu trusty-backports main restricted universe multiverse