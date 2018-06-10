# Figure out the containing dir of this Makefile
OVERLAY_DIR:=$(dir $(abspath $(lastword $(MAKEFILE_LIST))))

# Declare custom installation commands
define custom_install_commands
	@echo "Installing extra files from $(OVERLAY_DIR)"
	$(INSTALL_DATA) $(OVERLAY_DIR)/etc/banner $(1)/etc/banner
	$(INSTALL_DATA) $(OVERLAY_DIR)/etc/inittab $(1)/etc/inittab
	$(INSTALL_DATA) $(OVERLAY_DIR)/etc/rc.local $(1)/etc/rc.local
	$(INSTALL_DATA) $(OVERLAY_DIR)/etc/sysupgrade.conf $(1)/etc/sysupgrade.conf
	$(INSTALL_BIN) $(OVERLAY_DIR)/etc/rc.button/reset $(1)/etc/rc.button/reset
	$(INSTALL_BIN) $(OVERLAY_DIR)/etc/uci-defaults/unglue-setup $(1)/etc/uci-defaults/unglue-setup
	$(INSTALL_BIN) $(OVERLAY_DIR)/bin/unglue-bootstrap $(1)/bin/unglue-bootstrap
	$(INSTALL_BIN) $(OVERLAY_DIR)/bin/unglue-post $(1)/bin/unglue-post
endef

# Append custom commands to install recipe,
# and make sure to include a newline to avoid syntax error
Package/base-files/install += $(newline)$(custom_install_commands)
