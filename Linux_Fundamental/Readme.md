# Linux Fundamentals Homework

Here is a summary of what I learned from the tasks.

## Task 1: Soft Links vs Hard Links
I practiced making and deleting soft and hard links and learned how they differ:
- **Soft Link (Symbolic Link)**: It acts like a shortcut. It just points to the file name. If the original file is deleted, the soft link breaks and won't work anymore.
  - Command: `ln -s target_file link_name`
- **Hard Link**: It points directly to the file's data (the inode) on the disk. If the original file gets deleted, the hard link still works and holds the data. 
  - Command: `ln target_file link_name`

This definitely seems like an important interview question.

## Task 2: adduser vs useradd
I learned why we use one over the other:
- `useradd`: This is a low-level command. If you just run it, it creates the user but won't set up a home directory, ask for a password, or set a default shell unless you add a bunch of flags.
- `adduser`: This is a friendly interactive script. It automatically creates the home folder, prompts for a password, and copies over default settings. 

`adduser` is the recommended command on Ubuntu because it sets everything up for you easily. I practiced this by making a test user:
`sudo adduser testuser`

## Task 3: journalctl
I learned that `journalctl` is used to look at system and service logs collected by systemd. It's really helpful when something breaks.
- To see all system logs, I just typed: `journalctl`
- To check the logs for a specific service (which is very useful), I used the `-u` flag. For example: `journalctl -u ssh.service`

## Task 4: Command Cheat Sheet
I reviewed the Linux command cheat sheet and spent some time typing the commands out in the terminal to practice. I worked on navigation (`ls`, `cd`, `pwd`), file operations (`cp`, `mv`, `rm`), and viewing file contents (`cat`, `tail`, `grep`). Feeling a bit more comfortable with the terminal now!
