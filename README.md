Description
===========

This cookbook installs and configures apt-mirror. This will automate the creation of a
mirrored repository of one or more apt repositories.

Requirements
------------

#### packages

Attributes
----------
TODO: List you cookbook attributes here.

Usage
-----
Include `recipe[apt-mirror]` in the run_list.


```json
{
  "name":"my_node",
  "run_list": [
    "recipe[apt-mirror]"
  ]
}
```

Contributing
------------
TODO: (optional) If this is a public cookbook, detail the process for contributing. If this is a private cookbook, remove this section.

e.g.
1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write you change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

Repository
----------

https://github.com/hw-cookbooks/apt-mirror

License and Authors
-------------------

Author:: Aaron Baer (<aaron@hw-ops.com>)
