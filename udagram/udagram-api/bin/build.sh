npm install . && npm run clean
tsc || true
ls
cd www || true 
ls
cd ..
cp -R .elasticbeanstalk www/.elasticbeanstalk/ || true
cp .npmrc www/.npmrc || true
cp package.json www/package.json || true
cd www || true 
npx bestzip archive.zip * || true
cd ..