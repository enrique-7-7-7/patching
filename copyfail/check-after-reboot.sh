#!/bin/bash
sudo grubby --info=ALL | grep initcall_blacklist
