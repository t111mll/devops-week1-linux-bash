#!/usr/bin/env bash

set -e

# ---- CONFIG ----
#TODO: Allow RETENTION_DAYS to be overidden via environment variable
RETENTION_DAYS=7
LOG_DIR="./logs"
LOG_FILE="$LOG_DIR/backup.log"

# ---- VARIABLES ----
SOURCE_DIR="$1"
BACKUP_DIR="$2"
TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")
BACKUP_NAME="backup_${TIMESTAMP}.tar.gz"

# ---- LOGGING SETUP ----
mkdir -p "$LOG_DIR"

log() {
	echo "$(date +"%Y-%m-%d %H:%M:%S") - $1" | tee -a "$LOG_FILE"
}

# ---- VALIDATION ----
if [ -z "$SOURCE_DIR" ] || [ -z "$BACKUP_DIR" ]; then
	echo "Usage:$0 <source_directory> <backup_directory>"
	exit 1
fi

if [ ! -d "$SOURCE_DIR" ]; then
	echo "Error: Source directory does not exist: $SOURCE_DIR"
	exit 1
fi

if [ ! -d "$BACKUP_DIR" ]; then
	echo "Error: Backup directory does not exist: $BACKUP_DIR"
	exit 1
fi

# ---- BACKUP ----
log "Starting backup"
log "Source: $SOURCE_DIR"
log "Destination: $BACKUP_DIR"

tar -czf "$BACKUP_DIR/$BACKUP_NAME" -C "$SOURCE_DIR" .

log "Backup created: $BACKUP_DIR / $BACKUP_NAME"

# ---- RETENTION ----
log "Removing backups older than $RETENTION_DAYS days"
find "$BACKUP_DIR" -type f -name "backup_*.tar.gz" -mtime +"$RETENTION_DAYS" -exec rm {} \;

echo "Backup created successfully:"
echo "$BACKUP_DIR/$BACKUP_NAME"

# Log script start explicitly
#Improve log wording
