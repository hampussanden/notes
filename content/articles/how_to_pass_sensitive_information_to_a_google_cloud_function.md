---
title: "How to pass sensitive information to a Google Cloud Function"
author: "Hampus Sandén"
date: 2020-08-20T11:53:49+02:00
description: "How to pass sensitive information to a Google Cloud Function"
type: article
draft: false
---
# Using Secrets in Google Cloud Functions

Google Cloud Functions makes it easy to build serverless Python programs. This post will show you how you can use the Google Secret Manager to safely and securely use secrets in your function.

Hard-coding or using environment variables to store plain-text strings that should be "secret", like API keys, secret tokens for cookies, etc. generally isn't recommended. Any third-party dependency or library you use has access to these same environment variables.

However, it's very convenient to store secrets along side your function. You can still do it, as long as you store these secrets safely and securely.

We'll do this by storing our secret with the Google Secret Manager, and accessing our secrets at the application layer. Doing so will limit access to the secret to just members of your team who have access to the secret (and, of course, the function when it's running on Google Cloud).


```python

```
