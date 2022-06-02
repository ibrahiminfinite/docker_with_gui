# Build docker image


IMAGE_NAME="remytest"
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

rm -rf $SCRIPT_DIR/tmp

pushd $SCRIPT_DIR/..
docker build --build-arg user_id=$(id -u) \
             -f $SCRIPT_DIR/Dockerfile \
             -t $IMAGE_NAME .
popd