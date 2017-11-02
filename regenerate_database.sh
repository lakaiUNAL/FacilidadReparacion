#!/bin/bash
rails db:drop
rails db:migrate
rails db:seed

