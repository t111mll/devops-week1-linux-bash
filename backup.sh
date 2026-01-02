#!/usr/bin/env bash

set -e

# ---- VARIABLES ----
SOURCE_DIR="$1"
BACKUP_DIR="$2"
TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")
BACKUP_NAME="backup_${TIMESTAMP}.tar.gz"

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
tar -czf "$BACKUP_DIR/$BACKUP_NAME" -C "$SOURCE_DIR" .

echo "Backup created successfully:"
echo "$BACKUP_DIR/$BACKUP_NAME"
