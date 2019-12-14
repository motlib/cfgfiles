# CfgFiles

This repository contains some of my configuration files from my Linux home directory. 

The `.gitignore` file is set up to ignore all files, but then exclude some files 
from the ignore list (i.e. not ignore them again) by prepending the exclamation mark. 

## Usage

This repository is supposed to be cloned directly to the home directory. As git
does not like to clone into a non-empty directory, you need to apply some
workaround:

```shell
# In your home directory
git init .
git remote add https://github.com/motlib/cfgfiles.git
git fetch
git checkout master
```

