# image-deleter

There's only one script in the repo, it deletes image (PNG, JPG, JPEG) files that are not currently being used in a git repository.

## Running the script

For convenience, there is an image on [Docker Hub](https://hub.docker.com/r/stevemar/image-deleter), run this command from your git project root:

```bash
docker run -v `pwd`:/source stevemar/image-deleter:latest
```

Or feel free to copy the file and run it locally:

```bash
./rm-images.sh
```

## The output

The script will run `git rm` on the unused images. It's up to you to run `git commit` and `git push`.

## Tips

If you want to re-build this with debug logs, just add this line to the `Dockerfile`:

```Dockerfile
ENV DEBUG=true
```

Re-build it locally and run it.
