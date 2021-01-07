# image-deleter

There's only one script in the repo. It marks images (PNG, JPG, JPEG) for deletion using `git rm` based on whether or not they are referenced anywhere in the repo. There are multiple ways to run this script.

> Additional documentation is available on my blog: <https://www.stevemar.net/github-actions-rm-images/>

### Run in a container

There is a [containerized version](Dockerfile) of the script available on [Docker Hub](https://hub.docker.com/r/stevemar/image-deleter). run this command from your project root:

```bash
docker run -v `pwd`:/source stevemar/image-deleter:latest
```

### Run as a GitHub Action

The script is also available as a [GitHub Action](action.yml). See this [repo](https://github.com/stevemar/testing-images) as an example. To use it in your repository perform the following:

1. Create a [GitHub Secret](https://developer.github.com/v3/actions/secrets/) with the key name `GH_TOKEN` and it's value be a [GitHub API key](https://github.com/settings/tokens).

2. Create a file in `.github/workflows/` and paste the following code:

   ```yaml

   on:
     push:
       branches:    
         - master

   jobs:
     rm_old_images:
       runs-on: ubuntu-latest
       name: A job to remove images
       steps:
         - name: Checking out our code
           uses: actions/checkout@master
         - name: Remove the images
           uses: stevemar/image-deleter@v1.0.1
         - name: Create Pull Request
           uses: peter-evans/create-pull-request@v3
           with:
             token: ${{ secrets.GH_TOKEN }}
             commit-message: Remove unused images
             title: '[Automated PR] Remove unused images'
             body: |
               Found a few images that can be removed

               [1]: https://github.com/stevemar/image-deleter
         - name: Check outputs
           run: |
             echo "Pull Request Number - ${{ steps.cpr.outputs.pull-request-number }}"
             echo "Pull Request URL - ${{ steps.cpr.outputs.pull-request-url }}"
     ```

### Run locally

Just clone the repo, or copy and paste the code, and run it.

```bash
./rm-images.sh
```

## Tips

If you want to re-build this with debug logs, just add this line to the `Dockerfile`:

```Dockerfile
ENV DEBUG=true
```

Re-build it locally and run it.
