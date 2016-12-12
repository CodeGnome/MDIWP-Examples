# MDIWP-Examples
Code examples from "Managing Docker Instances with Puppet", *Linux
Journal*, pub. pending.

## Copyright and Licensing

### Copyright Notice

The copyright for the software, documentation, and associated files are
held by the author.

    Copyright © 2016 Todd A. Jacobs
    All rights reserved.

The AUTHORS file is also included in the source tree.

### Software License

![GPLv3 Logo](http://www.gnu.org/graphics/gplv3-88x31.png)

The software is licensed under the
[GPLv3](http://www.gnu.org/copyleft/gpl.html). The LICENSE file is
included in the source tree.

### README License

![Creative Commons BY-NC-SA
Logo](http://i.creativecommons.org/l/by-nc-sa/3.0/us/88x31.png)

This README is licensed under the [Creative Commons
Attribution-NonCommercial-ShareAlike 3.0 United States
License](http://creativecommons.org/licenses/by-nc-sa/3.0/us/).

## Purpose

These files are provided as a resource to accompany an article. While
code listings are generally included in my technical articles, it can be
more convenient to download the examples rather than having to type them
in.

## Installation and Setup
Installation of [VirtualBox][2] and [Vagrant][1] are prerequisites.

    dir="$HOME/Documents/puppet-docker"
    mkdir -p "$dir"
    cd "$dir"
    git clone https://github.com/CodeGnome/MDIP-Examples

## Command-Line Usage

    # Configure the example VM with Vagrant and VirtualBox.
    ./vagrant_provisioning.sh

## Caveats

Most of the "how-to" associated with these scripts will be in the body
of the article (when published). While these scripts may have some
indepdenent utility, you'll have to wait for the article to see print if
you want a walkthrough of what each script does, and what it's intended
to demonstrate.

----

[Project Home Page](https://github.com/CodeGnome/MDIWP-Examples)

[1]: https://www.vagrantup.com/
[2]: https://www.virtualbox.org/
