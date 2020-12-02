 
---
title: "How to pass sensitive information to a Google Cloud Function"
author: "Hampus Sandén"
date: 2020-08-20T11:53:49+02:00
description: "How to pass sensitive information to a Google Cloud Function"
type: article
draft: true
---


 

In this post we will go trough the process of creating and updating secrets via Google Secret Manager, which allows you store, manage and access text strings that should be considered secret. After we have created our secret we will have a look at how we can use Google Secret Manager to securely use our secret in a Google Cloud Function.

Google Cloud Functions makes it easy to build serverless Python programs and quite often you need to access sensitive information when working with APIs or databases. It is possible to store this information by either hard coding it in your function or storing it in an environment varable that allows plain text strings like database passwords, API keys, or TLS certificates. It is usually not recommended to do this since any third-party dependency or library you use in your function has access to these same environment variables.

Instead we can conveniently store our secret along side our function with the help of Google Secret Manager, and access our secret at the application layer. 
This will limit access to the secret and it will only be available to those users who can access it in Secret Manager and, of course, the Google Cloud Function at runtime.



 

## Setup



 

We will not go trough the process of setting up a project and billing account and i'll assume that any reader already know how to do this. 

If that is not the case i'll leave a link here on how to set it up. 

I've already setup a project with a name (mine is notes-289011).



 

While Google Cloud can be operated remotely from your laptop, in this codelab you will be using Google Cloud Shell, a command line environment running in the Cloud.



 

Now that you've created a project, the next step is to create a secret in it. 

We can do this on the command line with the gcloud tool! 

Also, we'll do it via Cloud Shell, so no credentials ever have to leave the cloud.

First, launch Cloud Shell for your project.

You should see a prompt that looks like this:



 

Once connected to Cloud Shell, you should see that you are already authenticated and that the project is already set to your project ID.



 

```plaintext
Welcome to Cloud Shell! Type "help" to get started.
Your Cloud Platform project in this session is set to notes-289011.
Use “gcloud config set project [PROJECT_ID]” to change to a different project.
hampussanden@cloudshell:~ (notes-289011)$
```



 


```python

```



 

## Enable APIs



 

Before you can begin using the Secret Manager- and Cloud Function APIs, you must enable them. Using Cloud Shell, you can enable the APIs with the following command:

[Endpoints](https://developers.google.com/apis-explorer)



 

```plaintext
gcloud services enable secretmanager.googleapis.com cloudfunctions.googleapis.com
```



 

## Creating and accessing Secrets




<div class="important-note">
    <p>
        
<b>Note!</b> For the sake of keeping all information in this post i will add my secret directly on the command line, but this is discouraged because the text string will appear in your shell history. The correct way to add your secret in a safe way is to upload the secret from a <code>.txt</code> file. You can read more about how to create secrets in the following <a href="https://cloud.google.com/secret-manager/docs/creating-and-accessing-secrets">link</a>.

    </p>
</div>


 

```plaintext
gcloud secrets versions add my-secret --data-file="/path/to/file.txt"
```



 

### Create a secret



 

```plaintext
gcloud secrets create my-secret \
    --replication-policy="automatic"
```



 

### Adding a secret version



 


```python

```



 

The --data-file=- flag allows us to pipe the secret to the gcloud command from the output of the previous command, which just echos the secret (with no newline).



 

```plaintext
echo -n "The answer to the ultimate question of life, the universe, and everything is 42" | \
    gcloud secrets versions add my-secret --data-file=-
```



 

### One-liner



 

```plaintext
echo -n "The answer to the ultimate question of life, the universe, and everything is 42" | \
    gcloud beta secrets create my-secret \
      --data-file=- \
      --replication-policy automatic
```



 

### Accessing our Secret



 


```python

```



 

```plaintext
gcloud beta secrets versions access 1 --secret="my-secret"
The answer to the ultimate question of life, the universe, and everything is 42
```



 

## Using Secrets Manager with a Cloud Function



 

Create a new folder to build our function, creating empty files to write to:



 

```plaintext
mkdir secret-manager-api-demo
cd secret-manager-api-demo
touch main.py
touch requirements.txt
```



 

Open the code editor from the top right side of the Cloud Shell:



 


```python

```



 

Navigate to the main.py file inside the secret-manager-api-demo folder. This is where you'll be putting all your code.



 


```python

```



 

Now we'll write our function. Here's our whole function that we'll deploy, that will live in a file called `main.py`:



 


```python
import os
from google.cloud import secretmanager

client = secretmanager.SecretManagerServiceClient()
project_id = os.environ['GCP_PROJECT']
secret_name = 'my-secret'
secret_version = 'latest'
response = client.access_secret_version(project_id, secret_name, secret_version)
secret_string = response.payload.data.decode('UTF-8')

def secret_hello(request):
    return secret_string
```



 

`projects/*/secrets/*/versions/latest`

This function is determining the resource name for the secret based on the function's environment, accessing the latest version of our secret, and then decoding the response, and finally returning the original string.

Also note how the function is doing this work outside of the Python function itself. This will speed up our function by only accessing the secret once when the Cloud Function is instantiated, and not once for every single request.

We'll also need to tell our function to install the `google-cloud-secret-manager` library, so we can access the secret from Python. In a file called `requirements.txt`, add the line:



 

```plaintext
google-cloud-secret-manager==0.1.1
````



 

At this point, your directory structure should look like this:



 

```plaintext
.
├── main.py
└── requirements.txt
```



 

## Giving our Cloud Function permission to access the secret



 





 

```plaintext
export PROJECT_ID=$(gcloud config get-value core/project)
```



 

```plaintext
gcloud secrets add-iam-policy-binding my_secret_value \
    --role roles/secretmanager.secretAccessor \
    --member serviceAccount:${PROJECT_ID}@appspot.gserviceaccount.com
```



 

## Deploying our Cloud Function



 

The last step is to deploy our function with the `gcloud` tool:



 

```plaintext
$ gcloud functions deploy secret_hello \
    --runtime python37 \
    --trigger-http \
    --allow-unauthenticated
```



 

If everything goes well, you should see something similar as the following output in your terminal:



 

```plaintext
Deploying function (may take a while - up to 2 minutes)...done.

...

entryPoint: secret_hello
httpsTrigger:
  url: https://<REGION>-<PROJECT_ID>.cloudfunctions.net/secret_hello
...
status: ACTIVE
...
```



 

We need to retrieve the cloud function URL to be able to test it and if you don't want to copy/paste it from the last output you can retrieve it from the Cloud Functions metadata (httpsTrigger.url) with the following command:



 

```plaintext
FUNCTION_URL=$(gcloud functions describe secret_hello --format 'value(httpsTrigger.url)')
```



 

Now we can test the function by calling the variable `FUNCTION_URL` with curl in our terminal and see if it returns the expected value:



 

```plaintext
curl $FUNCTION_URL
```



 

You should see the following output in your terminal:



 

```plaintext
The answer to the ultimate question of life, the universe, and everything is 42
```



 

## Sources



 

* ht<span>tps://cloud.google.com/secret-manager/docs/creating-and-accessing-secrets#secretmanager-create-secret-cli
* https://dev.to/googlecloud/using-secrets-in-google-cloud-functions-5aem
* https://codelabs.developers.google.com/codelabs/secret-manager-python/#0
* https://cloud.google.com/sdk/gcloud/reference/functions/deploy
* https://googleapis.dev/python/secretmanager/latest/gapic/v1beta1/api.html



 


```python

```


