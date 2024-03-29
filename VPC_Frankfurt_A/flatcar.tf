##module "tempest" {
##  source = "git::https://github.com/poseidon/typhoon//aws/flatcar-linux/kubernetes?ref=v1.28.2"
##
##  # AWS
##  cluster_name = "tempest"
##  dns_zone     = "aws.example.com"
##  dns_zone_id  = "Z3PAABBCFAKEC0"
##
##  # configuration
##  ssh_authorized_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCjMp13OWWtdKSqLJ7VtpeMhMRTKDMMqVAuBbajDlxJ9JNktyUt4/+GuIBLkfleaBhkekc1kVCMA2W8attb7JsRB/yBAPynG55xC2j3FBVKTI1O6dXGAQrQ/IsY2rYT/cJGAUKDcmIKTj7/vXxkLl+U45wpjVuvCCS6v0KbF8zYyhf+S79Kvv4138TAWni0YfpNbpjiTnd4Qx3ajI90Vz0EgNL67rc0+ksRSjtsWJiVAJtgRsT0ta+hhfdxaVDVTzKt4EEeaVDTvxx95j8LbaZ7uMP/7Jgd1BmNsEENQ+P9/MhO/5LvGIl0DGba2kbc0PczbL5U2Y/BqHiu2vVYPUxgC9foJ3oULT72os29kc3+YCza+NSH42QZ2kWaHzfr7K/Lnen0eAv1fij02Wchxb9iCVsCDRiYAtESTUWCFHCZQBnaNSmpfSMEgNemRLROoUhn7ue6X7GUPlDNfUek0+1I35+WNb3jd78NtZq0LNWeXOqJnBvi7RjHsCQOxA3XuSc="
##
##  # optional
##  worker_count = 2
##  worker_type  = "t3.small"
##}gh st