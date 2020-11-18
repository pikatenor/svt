sinatra-vue-spa
---

my beloved SPA template in crappy Sinatra and Vue.js (vue-router).

## Prepare

### frontend

    cd frontend
    npm install

or:

    rm -rfv frontend
    vue create frontend


### api

    bundle install --path=.bundle/

## Development

    npm run serve
    #=> run in localhost:8080

    bundle exec rackup
    #=> run in localhost:9292

## Production

docker でドッカーン
