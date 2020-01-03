<dl>
  <div class="headerWrapper" style="display:flex;flex-direction:column;align-items:center;margin:25px 0; text-align:center">
<img src="./images/manback.png" style="margin: 0 auto" height="100px" margin="auto">
<h1>Your friendly neighbor, who knows a little bit too much about music</h1>
</div>
  </dl>

## Test it yourself
You can join the [**Example Inc. slack server**](https://join.slack.com/t/example-inc-hq/shared_invite/enQtODkyODYzMTE5OTU4LTdkYTgxZmVjNzY2MWJhMWY5NjRlZDJmMjdkOWNmMjI0N2M1ZDc5NGIyNjY0YzEwYmIyMGU2NmYzNDU4ODk4NzY) to test the bot yourself without downloading anything!!!

(Keep in mind the bot is hosted on a free heroku account, so it sleeps 6 hours a day, from 12am to 6am timezone -6)

---

## Before running
Remember adding your own .env before runnning the bot locally, if you are hosting it on heroku, change the env variables on the site too

---
## run command
  `rake deploy:run` or
  `heroku run rake deploy:run`
---
## Commands on slack
---
### Invite the bot to your channel

![invite image](./images/invite.gif)

---
### Youtube
  `youtube + search`

![youtube command](./images/youtube.gif)

---
### Spotify
  `spotify + search`

![youtube command](./images/spotify.gif)

---
### help
  `@Music Buddy help`

![youtube command](./images/help.gif)

---
### Notes
remember to run `dotenv rspec` intead of only `rspec` when testing, since Rspec and the inner commands require ENV variables to work
