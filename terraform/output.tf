output "vpc_id" {
  value = aws_vpc.main.id
}

output "frontend_public_ip" {
  value = aws_instance.frontend.public_ip
}

output "frontend_public_url" {
  value = "http://${aws_instance.frontend.public_ip}"
}

output "backend_private_ip" {
  value = aws_instance.backend.private_ip
}