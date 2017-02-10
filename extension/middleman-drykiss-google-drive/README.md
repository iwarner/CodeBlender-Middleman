# Project : Middleman Google Drive

## Introduction

Collects documents and locale documents from a specific google folder.

## DryKISS

DryKISS is a full service internet and mobile digital production house. Our core
services span consulting, strategy; planning; development; testing and
analytics. Using cutting edge technologies within disciplined processes.

## Usage

activate :drykiss_google_drive

# @usage

ruby -r "./google-drive.rb" -e "GoogleDrive.new"


ruby -r "./google-drive.rb" -e "GoogleDrive.new.listFile"


Run as a standalone will take the file in the cache and transform this to enable some testing

$ ruby -r "./google-drive.rb" -e "GoogleDrive.new.parseFile"
