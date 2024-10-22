Workshop Nextflow
===


## Running with Docker

Use thi command if nextflow is not installed and you want to use the official
docker image

```shell
alias nextflow="docker run --rm -it \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v $(pwd):/$(pwd) -w $(pwd) nextflow/nextflow:24.04.4 nextflow"
```

## Prepare data

Change directory where this project is located, **do not enter** this project's
directory. To generate dummy data, run

```shell
ws-nextflow/generate_data.sh ./data
```

You should see the `data` directory beside the `ws-directory`

```shell
$ ls
drwxr-xr-x@  7 user  user   224B 22 Oct 16:16 data
drwxr-xr-x@  8 user  user   256B 18 Oct 23:45 ws-nextflow
```

### Run the workflow

```shell
nextflow run ws-nextflow --data "data/*.txt" --output results
```

> **Important:** quotes in "data/*.txt" are mandatory.


