# dot-back

## Table of Contents

  - [About](#about)
  - [Requirements](#requirements)
  - [Installation](#installation)
  - [FAQ](#faq)

## About

Dot-back is a shell script that copies a user's dot-files to a local, version-controlled directory. This project ensures a known working copy of a dot file matched from a preconfigured list can be kept safe. 

I created this project to ensure that I could always roll back to the known-good version whenever I sullied a file. Once a User's home directory `~` has dot `.` files present, `dot-back.sh` dynamically copies files after detecting the current Operating System type and creates a `cron` job to execute the script at a set frequency.

## Requirements

Dot-back has been tested with macOS (`11.0.x`) and Ubuntu (`20.04.x LTS`). 

The script will copy **[**✔️**]** and omit **[**❌**]** the following directories and files:

|         File/Directory                        | Ubuntu              |  MacOS          |
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

⁜   _Additional files and directories are excluded in the project's `.gitignore`_

⁜⁜   _Symlinks with matching filenames are ignored_ **[**_**Ubuntu** only_**]**


## Installation
1. [Fork](https://docs.github.com/en/github/collaborating-with-pull-requests/working-with-forks) this project
2. In the command line, `cd` to the project folder
3. Execute the script:
    ```bash
    $SHELL ./dot-back.sh
    ```
    - **MacOS**: If prompted in Terminal, click [ **OK** ] to allow access.
4. Confirm the following:
    - The `cron` job was added:
        ```bash
        crontab -l
        ```
    - The `.CronSetupDone` file was created:
        ```bash
        ls ./cron
        ```

## FAQ

### How can I remove the cron job
Use `crontab -r` to delete all user created `crontab`s, `man crontab` for more information.

### How do I edit the frequency of dot-back
Edit `L23` in `./cron/cron-setup.sh` with your [preferred frequency](https://crontab.guru/).

Once updated, delete `./cron/.CronSetupDone` and run `./dot-back.sh`.