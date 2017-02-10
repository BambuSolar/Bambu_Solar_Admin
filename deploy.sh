#!/usr/bin/env bash

bundle exec rake db:migrate

rake db:seed

curl -X POST --data-urlencode 'payload={"channel": "#general", "username": "webhookbot", "text": "Deploy.", "icon_emoji": ":ghost:"}' https://hooks.slack.com/services/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
