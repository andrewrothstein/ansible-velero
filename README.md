andrewrothstein.velero
=========
[![Build Status](https://travis-ci.org/andrewrothstein/ansible-velero.svg?branch=master)](https://travis-ci.org/andrewrothstein/ansible-velero)

Installs Heptio's [velero](https://velero.io/)

Requirements
------------

See [meta/main.yml](meta/main.yml)

Role Variables
--------------

See [defaults/main.yml](defaults/main.yml)

Dependencies
------------

See [meta/main.yml](meta/main.yml)

Example Playbook
----------------

```yml
- hosts: servers
  roles:
    - andrewrothstein.velero
```

License
-------

MIT

Author Information
------------------

Andrew Rothstein <andrew.rothstein@gmail.com>
