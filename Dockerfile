FROM alpine/git:1.0.18

LABEL "com.github.actions.name"="Git Push Mirror"
LABEL "com.github.actions.description"="Push your checkout to a git mirror (git push --mirror)"
LABEL "com.github.actions.icon"="share-2"
LABEL "com.github.actions.color"="purple"

LABEL "repository"="http://github.com/reload/git-push-mirror-action"
LABEL "homepage"="http://github.com/reload/git-push-mirror-action"
LABEL "maintainer"="Reload A/S <info@reload.dk>"

WORKDIR /github/workspace

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
