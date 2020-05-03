# image-deleter

There's only one script in the repo, it deletes image (PNG, JPG, JPEG) files that are not currently being used in a git repository.

## Running the script

For convenience, there is an image on [Docker Hub](https://hub.docker.com/r/stevemar/image-deleter), run this command from your git project root:

```bash
docker run -it --rm stevemar/image-deleter
```

Or feel free to copy the file and run it locally:

```bash
./rm-images.sh
```

## The output

The script will run `git rm` on the unused images. It's up to you to run `git commit` and `git push`.
