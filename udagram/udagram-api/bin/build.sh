npm install . && npm run clean
tsc
cp .npmrc www/.npmrc
cp package.prod.json www/package.json
cd www 
npx bestzip archive.zip *
cd ..

