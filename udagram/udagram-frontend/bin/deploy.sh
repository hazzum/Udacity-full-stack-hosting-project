aws s3api create-bucket --bucket ${AWS_HOSTING_BUCKET} --region us-east-1 
aws s3 cp --recursive --acl public-read ./www s3://${AWS_HOSTING_BUCKET}/
aws s3 cp --acl public-read --cache-control="max-age=0, no-cache, no-store, must-revalidate" ./www/index.html s3://${AWS_HOSTING_BUCKET}/
aws s3 website s3://${AWS_HOSTING_BUCKET}/ --index-document index.html
