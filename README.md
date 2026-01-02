# Linux Backup & Log Rotation Script


## Overview
This project is a Bash-based automation script that creates timestamped backups of a target directory and manages log rotation and retention.

It is designed to demonstrate Linux fundamentals, shell scripting, and automation principles used in DevOps environments.



## Architecture / Flow
1. Validate input directories
2. Create a compressed backup archive
3. Write execution logs
4. Remove backups older than the retention period


## Features
- Timestamped '.tar.gz' backups
- Configurable retention period
- Structured logging
- Safe input validation


## Requirements
- Linux (Ubuntu recommended)
- Bash 4+
- tar, gzip


## Installation
'''bash
git clone <repo-url>
cd devops-week1-linux-bash
chmod +x backup.sh


## Usage
'''bash
./backup.sh <source_directory> <backup_directory>


## Configuration
Configuration will be held inside backup.sh


## How It Works
The script uses standard Linux utilites such as tar, date, and find to automate backup creation and cleanup.


## Error Handling
- Script exits if required arguments are missing
- Script exits if directories do not exist


## Improvements
- Cron scheduling
- Email notifications
- Backup encryption


## Author
Timothy Lowe
Aspiring DevOps / Cloud Engineer
