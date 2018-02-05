# yauh.java8
Ansible role for setting up Oracle Java 8

## Requirements
SSH access to the remote machine

## Role Variables
None

## Dependencies
None

## Example Playbook
The tasks in this role require `sudo` privileges.

```
- hosts: all
  roles:
     - { role: yauh.java8 }
  sudo: yes
```

## License
BSD

## Author Information
Stephan Hochhaus stephan@yauh.de

[https://github.com/yauh](https://github.com/yauh)
