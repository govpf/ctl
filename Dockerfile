FROM alpine

RUN apk add --no-cache bash make git unzip openssh-client nmap curl && \
    mkdir -p /bootstrap

COPY bashrc /root/.bashrc
COPY setup /usr/local/bin/setup

RUN echo "Installing Terraform" && \
    wget "https://releases.hashicorp.com/terraform/1.1.8/terraform_1.1.8_linux_amd64.zip" -O terraform.zip && \
    unzip terraform.zip && \
    rm -f terraform.zip && \
    mv terraform /usr/local/bin/ && \
    chmod 755 /usr/local/bin/terraform

RUN echo "Installing Kubectl" && \
    wget "https://storage.googleapis.com/kubernetes-release/release/v1.22.10/bin/linux/amd64/kubectl" -O /usr/local/bin/kubectl && \
    chmod 755 /usr/local/bin/kubectl

RUN echo "Installing Minio Client" && \
    wget "https://dl.min.io/client/mc/release/linux-amd64/mc" -O /usr/local/bin/mc && \
    chmod 755 /usr/local/bin/mc

RUN echo "Installing Velero CLI" && \
    wget "https://github.com/vmware-tanzu/velero/releases/download/v1.8.1/velero-v1.8.1-linux-amd64.tar.gz" -O velero.tar.gz && \
    tar -xvzf velero.tar.gz && \
    mv /velero-v1.8.1*/velero /usr/local/bin/velero && \
    chmod 755 /usr/local/bin/velero && \
    rm -fr velero.tar.gz /velero-v1.8.1*

RUN echo "Installing Vault CLI" && \
    wget "https://releases.hashicorp.com/vault/1.10.3/vault_1.10.3_linux_amd64.zip" -O vault.zip && \
    unzip vault.zip && \
    rm -f vault.zip && \
    mv vault /usr/local/bin/ && \
    chmod 755 /usr/local/bin/vault

RUN echo "Installing Boilr CLI" && \
    wget "https://github.com/tmrts/boilr/releases/download/0.3.0/boilr-0.3.0-linux_amd64.tgz" -O boilr.tgz && \
    tar -xvzf boilr.tgz && \
    rm -f boilr.tgz && \
    mv boilr /usr/local/bin/ && \
    chmod 755 /usr/local/bin/boilr

RUN echo "Installing Terrascan CLI" && \
    wget "https://github.com/tenable/terrascan/releases/download/v1.15.1/terrascan_1.15.1_Linux_x86_64.tar.gz" -O terrascan.tar.gz && \
    tar -xvzf terrascan.tar.gz && \
    rm -fr terrascan.tar.gz CHANGELOG.md LICENSE README.md && \
    mv terrascan /usr/local/bin/ && \
    chmod 755 /usr/local/bin/terrascan

WORKDIR /bootstrap

# install terraform
# install ssh-client

