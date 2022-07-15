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
          leaf_access_bundles = {}
          leaf_access_ports = {}
          leaf_breakout_ports = {}
        }
        profiles = {
          fex_profiles = {}
          interface_profiles = {}
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
        aaeps = {}
        # qos_class = {} Optional
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
          pool_name     = string
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
