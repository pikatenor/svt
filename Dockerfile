FROM node:lts-alpine as frontend-builder

RUN mkdir /frontend
WORKDIR /frontend

COPY frontend/package.json frontend/package-lock.json ./
RUN npm ci

COPY frontend/ ./
RUN npm run build


FROM ruby:alpine
RUN gem install bundler

RUN mkdir /app
WORKDIR /app

COPY Gemfile Gemfile.lock ./
RUN bundle install

COPY --from=frontend-builder /frontend ./frontend
COPY . .

ENV RACK_ENV=production
ENV PORT=9292
ENTRYPOINT bundle exec rackup -p $PORT
