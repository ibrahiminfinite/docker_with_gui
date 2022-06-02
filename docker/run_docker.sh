# Run docker container

IMAGE_NAME="remytest"
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

# If no command is specified, just open a Bash terminal.
CMD="${1:-bash}"

# DISPLAY Settings

  source $SCRIPT_DIR/setup_xauth.bash
  DISPLAY_ARGS="
    -it --gpus all \
    --env="NVIDIA_DRIVER_CAPABILITIES=all" \
    --env="DISPLAY" \
    --env="QT_X11_NO_MITSHM=1" \
    --env="XAUTHORITY=$XAUTH" \
    --volume="/dev/input:/dev/input" \
    --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
    --volume="$XAUTH:$XAUTH" \
"
# Setup other Docker arguments
NETWORK_ARGS="--ipc=host --net=host"

# Finally, run the command in Docker
docker run --rm $NETWORK_ARGS $DISPLAY_ARGS \
    $IMAGE_NAME $CMD