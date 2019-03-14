Compatibility tester for your domain SSL Cert against older `cacert.pem` CA bundle file.

Sometimes machine with outdated OS or HTTP clients are still using outdated CA bundle. Meanwhile if your web domain SSL certificate are issued by newer CA (Certificate Authority) that is not recognized (not listed) on the CA bundle, those machine will not be able to connect with your web domain via SSL properly.
This repo will help you check your SSL cert against some older version of CA bundle.

This might be useful if you manage an web API SSL cert, and some of the API users are using outdated OS/HTTP clients which you want to check whether it break their API call or not.

# Requirements
- Docker

# Example Usage
- Download / Clone this repo to your local folder, CD to the repo folder via terminal

- Build the docker image:

`docker build -t alpinecurl .`

- To run as docker container & execute curl within container:

`docker run --rm -it alpinecurl <YOUR CURL COMMAND HERE>`

- A) Example to run Curl using OUTDATED (2014) cacert against your domain:
    
`docker run --rm -it alpinecurl curl -v --cacert ./cacert-2014.pem https://account.midtrans.com/login`

- B) Example to run Curl using newer (2019) cacert against your domain:
    
`docker run --rm -it alpinecurl curl -v --cacert ./cacert-2019.pem https://account.midtrans.com/login`

# Expected Result
- Domain cert is **NOT COMPATIBLE** for specific cacert if you run Example A and get something like:

```bash
curl: (60) SSL certificate problem: unable to get local issuer certificate
More details here: https://curl.haxx.se/docs/sslcerts.html

curl failed to verify the legitimacy of the server and therefore could not
establish a secure connection to it. To learn more about this situation and
how to fix it, please visit the web page mentioned above.
```

- Domain cert is is **COMPATIBLE** for specific cacert if you got HTML response

### References
CA bundle retrieved from: 
- https://curl.haxx.se/docs/caextract.html
- https://github.com/bagder/ca-bundle

Docker file adapted from:
- https://github.com/ellerbrock/docker-collection/tree/master/dockerfiles/alpine-curl-ssl