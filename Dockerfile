FROM node:lts-alpine as frontend-builder

RUN mkdir /frontend
WORKDIR /frontend

COPY frontend/package.json frontend/package-lock.json ./
RUN npm ci

COPY frontend/ ./
RUN npm run build


FROM ruby:slim
RUN apt-get update && apt-get install -y\
  ca-certificates \
  build-essential \
  dumb-init
RUN gem install bundler

RUN mkdir /app
WORKDIR /app

COPY Gemfile Gemfile.lock ./
RUN bundle install

COPY --from=frontend-builder /frontend/dist ./frontend/dist
COPY . .

ENV RACK_ENV=production
ENV PORT=9292
ENTRYPOINT ["dumb-init", "--"]
CMD bundle exec rackup -p $PORT
