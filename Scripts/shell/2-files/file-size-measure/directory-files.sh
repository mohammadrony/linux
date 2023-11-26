#!/bin/bash

sudo du -hcsx -- /* | sort -rh | head

# or 

sudo du -hcsx -- .[!.]* /* | sort -rh | head
