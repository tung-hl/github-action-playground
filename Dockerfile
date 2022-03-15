FROM hashicorp/packer:1.7.3

ARG PACKER_PLUGIN_PATH=.packer.d/plugins
ENV PACKER_PLUGIN_PATH=$PACKER_PLUGIN_PATH

# Install Goss Packer Provisioner
RUN wget 'https://github.com/YaleUniversity/packer-provisioner-goss/releases/download/v3.0.3/packer-provisioner-goss-v3.0.3-linux-amd64.tar.gz' -O packer-provisioner-goss.tar.gz && \
    tar -xvf packer-provisioner-goss.tar.gz && \
	mkdir -p /bin/.packer.d/plugins && \
	mv packer-provisioner-goss /bin/.packer.d/plugins && \
	chmod +x /bin/.packer.d/plugins/packer-provisioner-goss

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]