# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# Customize the firmware. Uncomment all or parts of the following
# to add files to the root filesystem or modify the firmware
# archive.

# config :nerves, :firmware,
#   rootfs_overlay: "rootfs_overlay",
#   fwup_conf: "config/fwup.conf"

# Use bootloader to start the main application. See the bootloader
# docs for separating out critical OTP applications such as those
# involved with firmware updates.
config :bootloader,
  init: [:nerves_runtime],
  app: Mix.Project.config[:app]

config :nerves, :firmware,
  rootfs_overlay: "rootfs_overlay"

config :nerves_firmware_http,
    json_provider: Poison,
    json_opts: []

config :nerves_network, :default,
  wlan0: [
    ssid: "YOUR SSID",
    psk: "YOUR PASSWORD",
    key_mgmt: "WPA-PSK"
  ],
  eth0: [
    ipv4_address_method: :dhcp
  ]

# Import target specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
# Uncomment to use target specific configurations

# import_config "#{Mix.Project.config[:target]}.exs"

import_config "dev.secret.exs"
