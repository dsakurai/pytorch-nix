# FROM debian:stable-slim
FROM nvidia/cuda:11.0.3-base-ubuntu20.04
# Install any additional packages you need

RUN apt update && \
    apt install -y git curl vim sudo && \
    # Clean up apt cache when done
    rm -rf /var/lib/apt/lists/*
    # You'd also want sshd if not auto-installed.

# For Nix
RUN apt update && \
    apt install -y xz-utils && \
    # Clean up apt cache when done
    rm -rf /var/lib/apt/lists/*

# For NVIDIA Container Toolkit

# RUN apt update && apt install -y gpg && \
#     curl -fsSL https://nvidia.github.io/libnvidia-container/gpgkey | gpg --dearmor -o /usr/share/keyrings/nvidia-container-toolkit-keyring.gpg \
#     && curl -s -L https://nvidia.github.io/libnvidia-container/stable/deb/nvidia-container-toolkit.list | \
#     sed 's#deb https://#deb [signed-by=/usr/share/keyrings/nvidia-container-toolkit-keyring.gpg] https://#g' | \
#     tee /etc/apt/sources.list.d/nvidia-container-toolkit.list && \
#     apt-get install -y nvidia-container-toolkit

# For VSCode
RUN adduser --disabled-password --gecos "" vscode && adduser vscode sudo

USER vscode

ENV PATH="/home/vscode/.nix-profile/bin:$PATH"
