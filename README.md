# dot-back

## About

Dot-back is a shell script which copies a user's dot-files to a local, version controlled directory. This project helps ensures known working backup copy of a preconfigured list of dot files can always be kept. 

Simply put I created this project to ensure if I sullied a file, I could always roll back to known-good version. Once a User's home directory `~` has dot `.` files present, `dot-back.sh` dynamically copies files after detecting the Operating System type and creates a cron job to repeat the function at a preconfigured frequency.

## Requirements

Dot-back has been tested with macOS (`11.0.x`) and Ubuntu (`20.04.x LTS`). The script will search for and copy the following directories and files:

|                                 | Ubuntu              |  MacOS          |
| --------------------------      | :----------------:  | :-------------: |
| 📄 `~/.bashrc`           |         ✔️         |        ✔️        |
| 📄 `~/.bash_history`            |         ❌         |        ❌        |
| 📄 `~/.bash_logout`            |         ❌         |        ❌        |
| 📄 `~/.bash_profile`                |         ✔️         |        ✔️       |
| 📁 `~/.config/coc`                |         ✔️         |        ✔️       |
| 📁 `~/.config/nvim`                |         ✔️         |        ✔️       |
| 📁 `~/.config/powerline`                |         ✔️         |        ✔️       |
| 📄 `~/.config/starship.toml`                |         ✔️         |        ✔️       |
| 📄 `~/.fzf.bash`      |         ✔️         |        ✔️        |
| 📄 `~/.fzf.zsh`        |         ✔️         |        ✔️        |
| 📄 `~/.NerdTree*`      |         ✔️         |        ✔️        |
| 📄 `~/.ssh*`      |         ❌         |        ❌        |
| 📄 `~/.tmux*`      |         ✔️         |        ✔️        |
| 📄 `~/.tmux*`      |         ✔️         |        ✔️        |
| 📁 `~/.vim`      |         ✔️         |        ❌        |
| 📄 `~/.zshrc`      |         ✔️         |        ✔️        |
📄 `~/.zcompdump*`            |         ❌         |        ❌        |
📄 `~/.zsh_history`            |         ❌         |        ❌        |
⁜ _Additional files and directories are excluded in the project's `.gitignore`_
⁜⁜ _Symlinks with matching filenames are ignored_ `Ubuntu` only


## Installation
1. [Fork](https://docs.github.com/en/github/collaborating-with-pull-requests/working-with-forks) this project
2. In the command line, `cd` to the project folder
3. Run the script:
```bash
$SHELL ./dot-back.sh
```
4. Confirm the following:
    - The cron job was added:
        ```bash
        crontab -l
        ```
    - The `.CronSetupDone` file was created:
        ```bash
        ls ./cron
        ```

