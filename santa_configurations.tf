resource "zentral_santa_configuration" "default" {

  name           = "Defcon"
  client_mode    = "MONITOR"
  enable_bundles = true
}

resource "zentral_santa_enrollment" "default" {
  configuration_id      = zentral_santa_configuration.default.id
  meta_business_unit_id = zentral_meta_business_unit.default.id
}

resource "zentral_santa_rule" "teamid-iterm2" {
  configuration_id  = zentral_santa_configuration.default.id
  policy            = "BLOCKLIST"
  target_type       = "TEAMID"
  target_identifier = "H7V7XYVQ7D"
  custom_message    = "No Iterm2 apps are allowed!!!"
  description       = "Block Iterm apps, mostly for demo purposes"
}
