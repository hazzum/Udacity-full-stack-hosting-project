npm install . && npm run clean
tsc || true
cp .npmrc www/.npmrc || true
cp package.prod.json www/package.json || true
cd www || true 
npx bestzip archive.zip * || true
cd ..

