#!/bin/bash

if [ ! -f ".env" ]; then
    cp .env.example .env
fi

if [ ! -f "desafio_backend.sqlite" ]; then
    touch desafio_backend.sqlite
fi

npm install

npm run start:dev