#!/bin/bash
# Run this script when you need to start the server
rails server &
open http://localhost:3000/entries
fg