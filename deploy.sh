#!/usr/bin/bash

# build react app
cd frontend
npm run build

# move into Flask project root
cd ..

# clear old static files
rm -rf static
mkdir static

# copy new build output
cp -r frontend/build/* static/

# flatten nested static folder
mv static/static/css static/
mv static/static/js static/
rm -rf static/static