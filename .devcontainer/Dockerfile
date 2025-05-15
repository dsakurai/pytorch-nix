FROM debian:stable-slim
# Install any additional packages you need
RUN apt update && \
    apt install -y git curl
    # You'd also want sshd if not auto-installed.

# For VSCode
RUN adduser --disabled-password --gecos "" vscode && adduser vscode sudo && \
    # Not mandatory but conventional
    mkdir -p /workspace && chown vscode:vscode /workspace && \
    # Useful but not mandatory
    apt install -y sudo

USER vscode

WORKDIR /workspace
