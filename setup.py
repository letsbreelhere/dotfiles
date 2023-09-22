#!/usr/bin/env python

import argparse
import os
import shutil

parser = argparse.ArgumentParser(description="Setup script")
parser.add_argument("-v", "--verbose", action="store_true", help="Run verbosely")
parser.add_argument("-d", "--dry-run", action="store_true", help="Run but do not create symlinks (implies verbosity)")
args = parser.parse_args()
verbose = args.verbose or args.dry_run
dry_run = args.dry_run

IGNORED_DIRS = {".git/"}
IGNORED_FILES = {"setup", "README.md"}

for root, dirs, files in os.walk(".", topdown=True):
    for file in files:
        full_path = os.path.abspath(os.path.join(root, file))
        relative_path = os.path.relpath(full_path, start=os.getcwd())

        if (
            not os.path.isdir(full_path)
            and not any(relative_path.startswith(ignored_dir) for ignored_dir in IGNORED_DIRS)
            and file not in IGNORED_FILES
        ):
            new_path = os.path.expanduser(os.path.join("~", relative_path))
            new_dir = os.path.dirname(new_path)

            if verbose:
                print(f"{full_path} -> {new_dir}")

            if not dry_run:
                os.makedirs(new_dir, exist_ok=True)
                try:
                    os.symlink(full_path, new_path)
                except OSError:
                    os.remove(new_path)
                    os.symlink(full_path, new_path)
