resource "aws_vpc_peering_connection" "VPC_Frankfurt_A_to_VPC_Frankfurt_B" {
  peer_owner_id = data.aws_caller_identity.current.id
  peer_vpc_id   = aws_vpc.vpc0-frankfurt.id
  vpc_id        = data.aws_vpc.vpc0-frankfurtB.id
  auto_accept   = true

  tags = {
    Name = "VPC Peering VPC_Frankfurt_A to VPC_Frankfurt_B"
  }
}