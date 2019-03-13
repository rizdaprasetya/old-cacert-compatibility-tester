Compatibility tester for your domain SSL Cert against older `cacert.pem` CA bundle file.
# Requirements
- Docker

# Example Usage
- Build:

`docker build -t alpinecurl .`

- To run container & execute curl within container:

`docker run --rm -it alpinecurl <YOUR CURL COMMAND HERE>`

- A) Example to run Curl using OLD (2014) cacert against your domain:
    
`docker run --rm -it alpinecurl curl -v --cacert ./cacert-old.pem https://account.midtrans.com/login`

- B) Example to run Curl using newer (2019) cacert against your domain:
    
`docker run --rm -it alpinecurl curl -v --cacert ./cacert-2019.pem https://account.midtrans.com/login`

# Description
- Domain cert is **NOT SAFE** for old cacert if you run Example A and got:

```bash
curl: (60) SSL certificate problem: unable to get local issuer certificate
More details here: https://curl.haxx.se/docs/sslcerts.html

curl failed to verify the legitimacy of the server and therefore could not
establish a secure connection to it. To learn more about this situation and
how to fix it, please visit the web page mentioned above.
```

- Domain cert is is **SAFE** for old cacert if you got HTML response
