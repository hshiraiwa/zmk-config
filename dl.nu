#!/usr/bin/env nu

let firmware_dir = $"/home/beatrice/Downloads/zmk/firmware-(date now | format date '%y-%m-%d')"
mkdir $firmware_dir

let run_id = (gh run list --json databaseId | from json | first | get databaseId)
gh run watch $run_id
gh run download $run_id -D $firmware_dir
