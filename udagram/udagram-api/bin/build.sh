npm install . && npm run clean && tsc & cp -rf .elasticbeanstalk www/.elasticbeanstalk && cp .npmrc www/.npmrc && cp package.json www/package.json && cd www && npx bestzip archive.zip * && cd ..