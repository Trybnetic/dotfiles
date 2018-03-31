```
  __  __                           __ _                       _   _                 __ _ _           
 |  \/  |_   _     ___ ___  _ __  / _(_) __ _ _   _ _ __ __ _| |_(_) ___  _ __     / _(_) | ___  ___ 
 | |\/| | | | |   / __/ _ \| '_ \| |_| |/ _` | | | | '__/ _` | __| |/ _ \| '_ \   | |_| | |/ _ \/ __|
 | |  | | |_| |  | (_| (_) | | | |  _| | (_| | |_| | | | (_| | |_| | (_) | | | |  |  _| | |  __/\__ \
 |_|  |_|\__, |   \___\___/|_| |_|_| |_|\__, |\__,_|_|  \__,_|\__|_|\___/|_| |_|  |_| |_|_|\___||___/
         |___/                          |___/                                                        
```

This repository contains the configuration files for some of the programs I use on my machine. 
They are tracked in the way [@joaofcosta](https://github.com/joaofcosta/) suggests in 
[his dotfile repo](https://github.com/joaofcosta/dotfiles), except that I add files by hand 
and not via script.

## Load this dotfiles
The following steps should get you a copy of this repository with the config files in the right folders:

1. Create a new bare git repository in your `$HOME` folder.
```
git init --bare $HOME/.myconf
```
2. Add an alias to your .bashrc file.
```
alias dotfiles="/usr/bin/git --git-dir=$HOME/.myconf/ --work-tree=$HOME"
```
3. Configure this git repository to not display untracked files.
```
dotfiles config status.showUntrackedFiles no
```
4. Add this remote to your repository
```
git remote add origin https://github.com/trybnetic/dotfiles.git
```
5. Pull the files
```
git pull
```

## Set up your own dotfile repo
1. Create a new bare git repository in your `$HOME` folder.
```
git init --bare $HOME/.myconf
```
2. Add an alias to your .bashrc file.
```
alias dotfiles="/usr/bin/git --git-dir=$HOME/.myconf/ --work-tree=$HOME"
```
3. Configure this git repository to not display untracked files.
```
dotfiles config status.showUntrackedFiles no
```
4. Create a new repository e.g. on github, a server or on a external harddrive
5. Add this remote to your repository
```
git remote add origin path-or-url/to/repo
```
6. Add the config files you want to track
```
git add /path/to/file
```
7. Push the files to the remote repository
```
git push
```
