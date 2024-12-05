resource "google_compute_network_endpoint_group" "lb_ext_neg_usc1g_a_l4_sea_bizrate_sandbox_1_tf" {
  name                  = "lb-ext-neg-usc1g-a-l4-sea-bizrate-sandbox-1-tf"
  network               = "projects/cnnx-sandbox-infra/global/networks/default"
  zone                  = "us-central1-a"
  network_endpoint_type = "NON_GCP_PRIVATE_IP_PORT"
}

resource "google_compute_network_endpoint" "lb_ext_neg_ep_usc1g_a_l4_sea_bizrate_sandbox_1_tf" {
  zone = "us-central1-a"
  network_endpoint_group = google_compute_network_endpoint_group.lb_ext_neg_usc1g_a_l4_sea_bizrate_sandbox_1_tf.name
  port = "443" 
  ip_address = "10.103.240.86"
}
#
resource "google_compute_health_check" "lb_ext_hc_usc1g_l4_sea_bizrate_sandbox_1_443_tf" {
  name     = "lb-ext-hc-usc1g-l4-sea-bizrate-sandbox-1-443-tf"
  project   = "${var.gcp_project}"
  timeout_sec         = 5
  check_interval_sec  = 5
  healthy_threshold   = 2
  unhealthy_threshold = 2

  https_health_check {
    port = "443"
  }
}
#
resource "google_compute_backend_service" "lb_ext_be_usc1g_l4_sea_bizrate_sandbox_1_tf" {
  name                  = "lb-ext-be-usc1g-l4-sea-bizrate-sandbox-1-tf"
  project               = "${var.gcp_project}"
  protocol              = "HTTP"
  load_balancing_scheme = "EXTERNAL_MANAGED"
  timeout_sec           = 14430
  health_checks         = [google_compute_health_check.lb_ext_hc_usc1g_l4_sea_bizrate_sandbox_1_443_tf.id]
  backend {
    group           = google_compute_network_endpoint_group.lb_ext_neg_usc1g_a_l4_sea_bizrate_sandbox_1_tf.id
    balancing_mode  = "RATE"
    max_rate 	    = "1000"
  }
}
#
resource "google_compute_url_map" "lb_ext_um_tcp_usc1g_l4_sea_bizrate_sandbox_1_tf" {
  name 	= "lb-ext-um-tcp-usc1g-l4-sea-bizrate-sandbox-1-tf"
  default_service = google_compute_backend_service.lb_ext_be_usc1g_l4_sea_bizrate_sandbox_1_tf.id

  host_rule {
    hosts        = ["bizrate.com"]
    path_matcher = "allpaths"
  }

  path_matcher {
    name            = "allpaths"
    default_service = google_compute_backend_service.lb_ext_be_usc1g_l4_sea_bizrate_sandbox_1_tf.id

    path_rule {
      paths   = ["/*"]
      service = google_compute_backend_service.lb_ext_be_usc1g_l4_sea_bizrate_sandbox_1_tf.id
    }
  }
}

resource "google_compute_target_https_proxy" "lb_ext_tp_tcp_usc1g_l4_sea_bizrate_sandbox_1_tf" {
  name     = "lb-ext-tp-tcp-usc1g-l4-sea-bizrate-sandbox-1-tf"
  project  = "${var.gcp_project}"
  ssl_certificates      = ["projects/cnnx-sandbox-infra/global/sslCertificates/lb-wildcard-bizrate-com"]
  url_map  = google_compute_url_map.lb_ext_um_tcp_usc1g_l4_sea_bizrate_sandbox_1_tf.id
}



resource "google_compute_global_address" "lb_ext_ip_vf_tcp_usc1g_l4_sea_bizrate_sandbox_1_tf" {
  name = "lb-ext-ip-vf-tcp-usc1g-l4-sea-bizrate-sandbox-1-tf"
  }
#
resource "google_compute_global_forwarding_rule" "lb_ext_fr_v4_tcp_usc1g_l4_sea_bizrate_sandbox_1_tf" {
  name                  = "lb-ext-fr-v4-tcp-usc1g-l4-sea-bizrate-sandbox-1-tf"
  project               = "${var.gcp_project}"
  depends_on            = []
  load_balancing_scheme = "EXTERNAL"
  port_range            = "443"
  target                = google_compute_target_https_proxy.lb_ext_tp_tcp_usc1g_l4_sea_bizrate_sandbox_1_tf.id
  ip_address		=  google_compute_global_address.lb_ext_ip_vf_tcp_usc1g_l4_sea_bizrate_sandbox_1_tf.id
}
##

resource "google_compute_security_policy" "lb_ext_ca_tcp_usc1g_l4_sea_bizrate_sandbox_1_tf" {
    name = "lb-ext-ca-tcp-usc1g-l4-sea-bizrate-sandbox-1-tf"

  rule {
    action   = "deny"
    priority = "2147483647"
    match {
      versioned_expr = "SRC_IPS_V1"
      config {
        src_ip_ranges = ["*"]
      }
    }
    description = "default rule"
  }

  rule {
    action   = "throttle"
    priority = "40"
    match {
      expr {
        expression = "has(request.headers['host']) && (request.headers['host'].contains('bizrate')) && (origin.asn == 132203 || origin.asn == 136907 || origin.asn == 45102)"
      }
    }
  rate_limit_options {
      conform_action = "allow"
      exceed_action = "deny(429)"
 
      enforce_on_key = "IP"

  rate_limit_threshold {
      count = "1"
      interval_sec = "60"
   }
  }
 }
  rule {
    action   = "throttle"
    priority = "1000"
    match {
      expr {
        expression = "has(request.headers['host']) && request.headers['host'].contains('bizrate')"
      }
    }
  rate_limit_options {
      conform_action = "allow"
      exceed_action = "deny(429)"

      enforce_on_key = "IP"

  rate_limit_threshold {
      count = "30"
      interval_sec = "60"
   }
  }
 }
  rule {
    description = "Allow unrestricted access from Route53 health check sources"
    action   = "allow"
    priority = "10"
    match {
      expr {
        expression = "has(request.headers['host']) && (request.headers['host'].contains('bizrate'))"
      }     
    }
   }
 }
