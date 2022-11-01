aws s3api create-bucket --bucket my-udagram-client --region us-east-1 
aws s3 cp --recursive --acl public-read ./www s3://my-udagram-client/
aws s3 cp --acl public-read --cache-control="max-age=0, no-cache, no-store, must-revalidate" ./www/index.html s3://my-udagram-client/
aws s3 website s3://my-udagram-client/ --index-document index.html
