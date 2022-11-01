# Status Badge
[![CircleCI](https://circleci.com/gh/hazzum/Udacity-full-stack-hosting-project.svg?style=svg)](https://circleci.com/gh/hazzum/Udacity-full-stack-hosting-project)

# Hosting a Full-Stack Application

### **Full-stack application hosting project for Udacity's Advanced Web Track.**

---
 Live version of the application is available on http://my-udagram-client.s3-website-us-east-1.amazonaws.com/

## Getting Started

### Here are the steps to reproduce this app's deployment:
#### 1- Create a new AWS user with admin privileges using the IAM service, save the access id and secret key in a secure location (they will be needed later).
#### 2- Create a Postgres AWS RDS database instance and an S3 Bucket for Media Hosting.
- Make sure to allow all connections in RDS connectivity inbound rules by adding a new rule that allows all traffic from 0.0.0.0/0 (all sources) (for testing purposes only).
- Make sure the S3 media hosting bucket is available for public access by adding the following policy to bucket policy, replace bucket_name with the name you chose:
```
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "PublicReadGetObject",
            "Effect": "Allow",
            "Principal": "*",
            "Action": "s3:GetObject",
            "Resource": "arn:aws:s3:::(bucket_name)]/*"
        }
    ]
}
```
- Allow Cross-origin resource sharing for all sources and allow all headers and all methods (for testing purposes only) by using the following JSON configuration:
```
[
    {
        "AllowedHeaders": [
            "*"
        ],
        "AllowedMethods": [
            "GET", "HEAD", "PUT", "POST", "DELETE"
        ],
        "AllowedOrigins": [
            "*"
        ],
        "ExposeHeaders": [],
        "MaxAgeSeconds": 3000
    }
]
```
#### 3- Create a new EB environment that runs node v16 or later and create a new app. Save the environment name and app name.
#### 4- Edit the `config.yml` file under `udagram\udagram-api\.elasticbeanstalk\` and replace the default environment name and app name with the values you just chose.
- You should change the aws region too if you plan on using a different aws region from us-east-1
#### 5- Edit the `apiHost` properties in `\udagram\udagram-frontend\src\environments\environment.prod.ts` and `udagram\udagram-frontend\src\environments\environment.ts` to the EB environment URL (this is inconvenient, but unfortunately there's no way of passing environment variables to S3 static websites).
#### 6- Create a CircleCI account if you haven't already and link it to your GitHub account, then push the contents of the project to a new repository.
#### 7- Manually add all necessary environment variables to the CircleCI project linked to the repository you just created, from the project settings.
Here's an example of how these environments variables are set up, the values are supplied from the previous steps:
```
- POSTGRES_USERNAME=postgres
- POSTGRES_PASSWORD=postgres
- POSTGRES_DB=postgres
- POSTGRES_HOST=database_name.[some_id].[aws_region].rds.amazonaws.com
- AWS_REGION=[aws_region]
- AWS_PROFILE=default
- AWS_BUCKET=[s3_media_bucket_name]
- AWS_HOSTING_BUCKET=[s3_static_hosting_bucket_name]
- URL=http://localhost:8080
- PORT=8080
- JWT_SECRET=[some_secret_string]
- AWS_ACCESS_KEY_ID=[some_secret_string]
- AWS_DEFAULT_REGION=[aws_region]
- AWS_SECRET_ACCESS_KEY=[some_secret_string]
```
#### 8- You can edit the `config.yml` under `.circleci` to modify the pipeline workflow in any way you want.
1. Everytime you push a new commit in master, CircleCI will begin the CI/CD process, deployment will be pending approval after the build and test phases run correctly.
2. Here's a high-level diagram of the implemented pipeline work flow:
!["pipeline work flow"](/screenshots/pipeline_workflow.png "pipeline work flow")
3. CI process involves the following steps:
- - Prepare environment variables supplied from the project.
- - Build & install docker image for node v16.17
- - Install Front-End Dependencies
- - Install API Dependencies
- - Lint Front-End Code
- - Front-End Build
- - API Build
- - Build & install docker image for Chrome & Chrome Driver
- - Front-End Test
4. CD process involves the following steps:
- - Prepare environment variables supplied from the project.
- - Build & install docker image for node v16.17
- - Install AWS CLI & Elastic Beanstalk CLI & configure AWS Access Key ID
- - Build API App
- - Deploy API App to Elastic Beanstalk Instance and pass the environment variables to the EB environment.
- - Build Front-End App
- - Deploy Front-End to S3 bucket.

## Screenshots:
### 1. Successfully running API app on Elastic Beanstalk
!["Elastic Beanstalk"](/screenshots/eb_instance.png "Elastic Beanstalk")
### 2. Successfully running RDS instance
!["RDS"](/screenshots/rds_instance.png "RDS")
### 3. Successfully creating an S3 bucket for media hosting
!["S3 bucket for media hosting"](/screenshots/s3_media_bucket.png "S3 bucket for media hosting")
### 4. Successfully deploying the application
!["Live version"](/screenshots/live_app_running.png "Live version")
### 5. Successful testing on CircleCI
!["testing"](/screenshots/circle_ci_testing.png "testing")
### 6. Successful build on CircleCI
!["build"](/screenshots/circle_ci_build.png "build")
### 7. Successful deployment on CircleCI
!["deployment"](/screenshots/circle_ci_deployment.png "deployment")
### 8. CircleCI supplying environment variables to production
!["environment variables"](/screenshots/circle_ci_env.png "environment variables")
!["environment variables"](/screenshots/circle_ci_env2.png "environment variables")