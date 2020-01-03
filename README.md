<dl>
  <div class="headerWrapper" style="display:flex;flex-direction:column;align-items:center;margin:25px 0; text-align:center">
<img src="./images/manback.png" style="margin: 0 auto" height="100px" margin="auto">
<h1>Your friendly neighbor, who knows a little bit too much about music</h1>
</div>
  </dl>


## Before running
Remember adding your own .env before runnning the bot locally, if you are hosting it on heroku, change the env variables on the site too

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
