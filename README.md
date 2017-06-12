# README

## Answers

1. Client sends to redis server packet of 206 bytes of data. This include message, redis key and some redis payload.
  Redis server responds with 4 bytes of data. Over this is TCP, IP and Ethernet protocol (in my case) so the whole
  communication takes a lot more. For instance my TCP packet was 258 bytes and Ethernet frame 272 bytes and there is
  some TCP payload packets (ACK).

2. We have 2MB (2\*1024\*1024) so if I dive it by 30 I get 69905 bytes per day. If I assume that we count only data I get
 69905 / 206 = 339.4 messages per day. If I count the whole communication between client and redis server via TCP, IP and
  Ethernet protocols I get something like 474 bytes so 69905 / 474 = 147.5 messages per day.

3. I think there should be good end-to-end test. Setup: test db + redis test instacne + web application test instance.
Then test code starts a few clients with given bike_ids and check via selenium/capybara if the result on website is proper.

## Startup instructions

You need up and running redis instance at redis://127.0.0.1:6379/0. The web application is in Rails so it need (of course) database (sqlite
in my case) with migration executed.

I use bundler. Running rails web app:

```
cd webapp
bundle exec rails server
```

In client you need to add lib to load_path. Running client:
```
cd client
bundle exec ruby -I lib bin/client <client_id>
```