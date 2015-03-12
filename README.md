# Multi Module Scripts 

This small project contains some useful scripts for working with multiple git repositories and 
multiple maven projects.

These scripts are written using the windows shell only.

## Setup

Please clone this project into your projects-directory (eg. \projects on my machine).

## git commands

### Checkout all configured repositories

Sometimes you need to initialize the project tree on a (new) machine. This script can help you.

Create a new file (scripts/git-scripts/config/git-repos.txt) with all projects you would like to use, 
please use an own line for each project.

You can then call:

```
scripts\git-clone.cmd
```

and will retrieve a full tree with all configured projects in the current directory.

### Other useful scripts and commands

To use the following command, you will need to call the git-scripts script with the corresponding
command, eg.:

```
scripts\git-scripts.cmd pull
```

The following commands are currently implemented:

* pull
* push
* status
* changes-since-last-tag - lists all Changes since the last tag for all projects

## maven commands

There are a couple of implemented useful maven commands, which can be triggered with the script mvb-scripts.cmd.

This can be called with:

```
scripts\mvn-scripts.cmd clean
```

The following commands are currently implemented:

* clean - calls "mvn clean"
* clean-install  - calls "mvn clean install"
* site-deploy - calls "mvn site:site site:deploy"
* edit-pom - opens a texteditor for all poms
* master-update - this one needs some configuration in the provided XSLT-file, but prints out all poms, which need to 
get updated to a later version of the parent pom.
* list-dependencies - lists all dependencies of all projects
