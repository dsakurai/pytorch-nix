FROM debian:stable-slim
# Install any additional packages you need
RUN apt update && \
    apt install -y git curl vim sudo \
    # For Nix
    xz-utils && \
    # Clean up apt cache when done
    rm -rf /var/lib/apt/lists/*
    # You'd also want sshd if not auto-installed.

# For VSCode
RUN adduser --disabled-password --gecos "" vscode && adduser vscode sudo && \
    # Not mandatory but conventional
    mkdir -p /workspace && chown vscode:vscode /workspace

USER vscode

ENV PATH="/home/vscode/.nix-profile/bin:$PATH"
