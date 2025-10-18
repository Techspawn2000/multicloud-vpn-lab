# 🌐 Multi-Cloud VPN Lab (AWS + Azure via Terraform)

**Author:** Techspawn Global Solutions  
**Trainer:** Daniel Omokha  
**Contact:** +2349027478788 (WhatsApp)  
**Brand Color:** Blue  

---

## 🚀 Overview
This project demonstrates how to securely connect **AWS** and **Microsoft Azure** environments using a **site-to-site VPN** deployed entirely through **Terraform**.  
It’s part of Techspawn Global Solutions’ beginner-to-pro Cloud & Networking training series.

---

## 🧩 Architecture
The setup includes:
- **AWS**:
  - VPC with public and private subnets  
  - EC2 instances (Web/App layer)  
  - RDS Database  
  - Customer Gateway + VPN Connection  
- **Azure**:
  - Resource Group + VNet  
  - Subnets (Web/App/DB)  
  - NSGs for security segmentation  
  - Azure VPN Gateway + Local Network Gateway  
  - Linux VMs (configured with Cloud-Init)

---

## 🛠️ Tools & Technologies
- Terraform (Infrastructure as Code)
- AWS (VPC, EC2, RDS, VPN)
- Azure (VNet, NSG, VPN Gateway)
- VS Code (IDE)
- Git & GitHub (Version Control)

---

## 🧠 Learning Objectives
- Deploy hybrid cloud networking using IaC  
- Configure AWS ↔ Azure IPsec VPN  
- Understand route propagation & gateway relationships  
- Practice modular Terraform project structure  

---

## 📁 Repository Structure
