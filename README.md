# oss-audit-24BCE10537

This is my Open Source Software lab repo for auditing **Git** on **Ubuntu 24.04 (WSL2)**.

I’m **Sumit kumar** (`sumitkumar`, reg no `24BCE10537`). I wrote a few small shell scripts to pull basic system info, check package info, audit a couple of directories, and scan a log file for keyword matches.

## What’s inside

- `script1.sh` - System Identity Report (kernel, distro, uptime, etc.)
- `script2.sh` - FOSS Package Inspector for `git`
- `script3.sh` - Disk and Permission Auditor for a few common folders
- `script4.sh` - Log file analyzer (counts keyword matches)
- `script5.sh` - Open Source Manifesto Generator (interactive)
- `manifesto_sumitkumar.txt` - Example output from the manifesto generator

## How to run the scripts

From the repo directory (`/home/sumitkumar/oss-audit-24BCE10537`):

1. **Make them executable (one-time):**
   - `chmod +x script1.sh script2.sh script3.sh script4.sh script5.sh`

2. **Run them:**
   - `./script1.sh`
   - `./script2.sh`
   - `./script3.sh`
   - `sudo ./script4.sh /var/log/syslog error`
     - If you don’t pass the keyword, it defaults to `error`.
   - `./script5.sh`
     - It asks 3 questions and writes `manifesto_sumitkumar.txt`

## Notes (things I ran into)

- For `script2.sh`, the lab manual mentions `rpm`, but Ubuntu is Debian-based, so I used `dpkg -l` to check whether `git` is installed.
- `script4.sh` needs `sudo` when I point it at `/var/log/syslog` (normal user permissions can block reading that file).
- If `script1.sh` complains about `lsb_release`, install `lsb-release`:
  - `sudo apt install lsb-release`

