# Figure out the containing dir of this Makefile
OVERLAY_DIR:=$(dir $(abspath $(lastword $(MAKEFILE_LIST))))

# Declare custom installation commands
define custom_install_commands
	@echo "Installing extra files from $(OVERLAY_DIR)"
	$(INSTALL_DATA) $(OVERLAY_DIR)/etc/dropbear/dropbear_rsa_host_key $(1)/etc/dropbear/dropbear_rsa_host_key
	$(INSTALL_DATA) $(OVERLAY_DIR)/etc/dropbear/authorized_keys $(1)/etc/dropbear/authorized_keys
endef

# Append custom commands to install recipe,
# and make sure to include a newline to avoid syntax error
Package/dropbear/install += $(newline)$(custom_install_commands)
