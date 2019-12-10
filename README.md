# Push your checkout to a git mirror (git push --mirror)

This action can be used to push your checkout to a git mirror.

We use it to mirror the master branch to a BitBucket repository.

**Notice:** The action will do a `git push --mirror <ARGS>`. This will
delete all remote branches not known to the local (that is the
checkout done by the action) checkout. So potentially dangerous if you
mess up the checkout.

This is the workflow file we use:

```yaml
on:
  push:
    branches:
    - master
name: Push to Bitbucket
jobs:
  push_to_bitbucket:
    name: Push to Bitbucket
    if: "!github.event.deleted"
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@v2-beta
      with:
        fetch-depth: 0 # Zero indicates all history
        ref: master
    - name: Push to mirror
      uses: reload/git-push-mirror-action@master
      with:
        args: https://${{ secrets.BITBUCKET_USER }}:${{ secrets.BITBUCKET_APP_PASSWORD }}@bitbucket.org/foo/bar.git
```
