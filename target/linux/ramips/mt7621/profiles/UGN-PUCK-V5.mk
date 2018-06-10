define Profile/UGN-PUCK-V5
	NAME:=UGN-PUCK-V5
	PACKAGES:=\
		kmod-sdhci
endef

define Profile/UGN-PUCK-V5/Description
	Package set for Unglue V5 device
endef
$(eval $(call Profile,UGN-PUCK-V5))
