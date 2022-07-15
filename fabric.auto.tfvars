fabric = {
  ### Fabric Configuration Policies ###
  fabric_policies = {
    policies = {
      interface = {
        l3_interface_policies = {}
      }
      monitoring = {
        fabric_node_control_policies = {}
      }
    }
  }
  ### Fabric Access Policies ###
  access_policies = {
    domains = {
      fc_domains = {}
      l3_domains = {}
      physical_domains = {
        tf-phy-1 = {
          name        = "tf-phy-1"
          vlan_pool   = "tf-phy-vlan-1"
        }
      }
    }
    interfaces = {
      leaf = {
        policy_groups = {
          leaf_access_bundles = {
            tf-vpc-1-pg = {
              name                    = "tf-vpc-1-pg"
              description             = "VPC Policy Group built by Terraform"
              lag_t                   = "node" # The bundled ports group link aggregation type: port channel vs virtual port channel. Allowed values are "not-aggregated", "node" and "link". Default is "link".
              # aaep_name               = optional(string)
              # link_level_policy_name  = optional(string)
              # lldp_intf_policy_name   = optional(string)
              # cdp_intf_policy_name    = optional(string)
              # mcp_intf_policy_name    = optional(string)
              # l2_intf_policy_name     = optional(string)
              # fc_intf_policy_name     = optional(string)
              # stp_intf_policy_name    = optional(string)
              # port_sec_policy_name    = optional(string)
              # pc_intf_policy_name     = optional(string) # LACP
            }
          }
          leaf_access_ports = {}
          leaf_breakout_ports = {}
        }
        profiles = {
          fex_profiles = {}
          interface_profiles = {
            tf-vpc-1 = {
              name        = "tf-vpc-1" # (Required) Name of Object leaf interface profile.
              description = "Interface profile built from Terraform"
              port_selectors = {
                tf-ps-e1-20 = {
                  name                      = "tf-ps-e1-20" # (Required) Name of Object Access Port Selector.
                  description               = "Port selector for VPC interface built from Terraform"
                  access_port_selector_type = "range" # (Required) The host port selector type. Allowed values are "ALL" and "range". Default is "ALL".
                  policy_group_name         = "tf-vpc-1-pg" # Interface Policy Group Name
                  port_blocks = {
                    tf-e1-20 = {
                      name        = "tf-e1-20" # (Optional) name of Object Access Port Block.
                      description = "E1/20"
                      from_card   = 1 # (Optional) The beginning (from-range) of the card range block for the leaf access port block. Allowed value range is 1-100. Default value is "1".
                      from_port   = 20 # (Optional) The beginning (from-range) of the port range block for the leaf access port block. Allowed value range is 1-127. Default value is "1".
                      to_card     = 1 # (Optional) The end (to-range) of the card range block for the leaf access port block. Allowed value range is 1-100. Default value is "1".
                      to_port     = 20 # (Optional) The end (to-range) of the port range block for the leaf access port block. Allowed value range is 1-127. Default value is "1".
                    }
                  }
                  sub_port_blocks = {}
                }
              }
            }
          }
        }
      }
      spine = {
        policy_groups = {
          spine_ports = {}
        }
        profiles = {
          interface_profiles = {}
        }
      }
    }
    policies = {
      global = {
        aaeps = {
          tf-svr-aaep = {
            description = "AAEP built from Terraform"
            name        = "tf-phys-aaep"
            domain_list = ["tf-phy-1"]
          }
        }
      }
      interface = {
        cdp_policies = {}
        fc_policies = {}
        l2_policies = {}
        link_level_policies = {}
        lldp_policies = {}
        mcp_policies = {}
        pc_policies = {}
        port_security_policies = {}
        stp_policies = {}
      }
      switch = {
        vpc_domains = {}
        vpc_protection_groups = {}
      }
    }
    pools = {
      vlan_pools = {
        tf-phy-vlan-1 = {
          pool_name     = "tf-phy-vlan-1"
          description   = "Test VLAN pool built by Terraform"
          alloc_mode    = "static"
          ranges = {
            static-1 = {
              description   = "Static VLAN Range"
              from          = 600
              to            = 699
            }
          }
        }
      }
      vsan_pools = {}
    }
    switches = {
      leaf = {
        policy_groups = {
          access_switches = {}
        }
        profiles = {
          leaf_profiles = {}
        }
      }
      spine = {
        policy_groups = {
          spine_switches = {}
        }
        profiles = {
          spine_profiles = {}
        }
      }
    }
  }
  ### Fabric Inventory Policies ###
  inventory = {
    pods = {}
  }
}
