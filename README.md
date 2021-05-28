Pipeline to deploy VMware Appliances
---

Looking for a concourse pipeline to deploy your appliances (.ova) into your vCenter.

Then you are in the right place :)

### Pre-requisities
* You have an s3 solution (minio preferrably) deployed
* Your .ova files are loaded into s3
* You have concourse up and running
* [ytt](https://carvel.dev/ytt/) cli is installed

### Updating params-template.yml
* Update the `params-template.yml` to match your environment
* Supply the s3, bucket, regex information
* Supply the ova's config in yaml format
    You can use `govc` to do that

### Generate pipelines
Once the `params-template.yml` is ready, you can use `ytt` to generate the pipeline that can be used to deploy your appliances. Yes I said **appliances!!**

Run the command to generate the `pipeline.yml`
```
ytt -f "template-pipeline.yml" -f "params-template.yml" \
    > "pipeline.yml"
```

Run the command to generate the `params.yml`
```
  ytt -f "template-params.yml" -f "params-template.yml" \
  > "params.yml"
```

### Stage the pipeline
Now that we have the pipeline and the params, we can use the `fly` command to stage the pipeline

Execute:
```
fly -t <YOUR_TEAM> sp -p deploy-appliances -c pipeline.yml -l params.yml
```

### Execute the pipeline
You know how to do this, so I'll stop here.

Enjoy, and please provide feedback!!

Cheers