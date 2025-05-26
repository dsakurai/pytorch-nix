FROM debian:stable-slim
# FROM nvidia/cuda:11.0.3-base-ubuntu20.04
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

# For VSCode
RUN adduser --disabled-password --gecos "" vscode && adduser vscode sudo

USER vscode

ENV PATH="/home/vscode/.nix-profile/bin:$PATH"
