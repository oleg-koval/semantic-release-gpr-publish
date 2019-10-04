set -x
set -e

prefix="refs/heads/"

[[ "$GITHUB_REF" =~ ^$prefix(.*)$ ]]
BRANCH=${BASH_REMATCH[1]}

echo "//npm.pkg.github.com/:_authToken=$GITHUB_TOKEN" > /home/runner/work/_temp/.npmrc
npx semantic-release --dry-run --debug -b $BRANCH
