set -ex
# SET THE FOLLOWING VARIABLES
# docker hub username
USERNAME=hatto
# image name
IMAGE=db-export-cron
docker build -t $USERNAME/$IMAGE:latest .