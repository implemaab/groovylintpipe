# Run Groovy Lint as part of pipeline
FROM nvuillam/npm-groovy-lint:9

# hadolint ignore=DL3018
RUN apk add --no-cache py3-requests git

# Add Reviewdog
# hadolint ignore=DL4006
RUN wget -O - -q https://raw.githubusercontent.com/reviewdog/reviewdog/fd59714416d6d9a1c0692d872e38e7f8448df4fc/install.sh | sh -s latest

COPY pipe /
COPY LICENSE.txt pipe.yml README.md /
RUN wget -P / https://bitbucket.org/bitbucketpipelines/bitbucket-pipes-toolkit-bash/raw/0.6.0/common.sh

RUN chmod a+x /*.sh

ENTRYPOINT ["/pipe.sh"]
