
  
# Dockerfile for noetic desktop
FROM osrf/ros:noetic-desktop-full
SHELL ["/bin/bash", "-c"]

# Install dependencies
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get upgrade -y 
RUN apt-get install -y \ 
    apt-utils python3-pip python3-tk


# Add a user with the same user_id as the user outside the container
# Requires a docker build argument `user_id`
ARG user_id
ENV USERNAME developer
RUN apt-get -qq update && apt-get -q -y install sudo \
  && rm -rf /var/lib/apt/lists/* \
  && useradd -U --uid ${user_id} -ms /bin/bash ${USERNAME} \
  && echo "$USERNAME:$USERNAME" | chpasswd \
  && adduser $USERNAME sudo \
  && echo "$USERNAME ALL=NOPASSWD: ALL" >> /etc/sudoers.d/${USERNAME}

# Commands below run as the user $USERNAME
USER ${USERNAME}

RUN rosdep update
# Create a colcon workspace
RUN mkdir -p /home/${USERNAME}/test_ws/src

