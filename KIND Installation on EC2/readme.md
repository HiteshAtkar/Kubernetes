## Install KIND on AWS EC2 (Ubuntu 22.04)

### 1. Prepare EC2 Instance
- **OS**: Ubuntu 22.04 (Recommended)
- **Instance Type**: t3.medium or bigger

### Security Group Settings
Enable the following **Inbound Rules**:
| Port | Purpose |
|------|---------|
| 22   | SSH — To connect to your EC2 instance |
| 6443 | Kubernetes API Server — For `kubectl` and cluster communication |
| 80   | HTTP — For web services without HTTPS |
| 443  | HTTPS — For secure web services |

---

### 2. Connect to EC2 via SSH
1. Download the **.pem** key from AWS.
2. Open Terminal/CMD and navigate to the directory where the `.pem` key is stored.
3. Set correct permissions:
   ```bash
   chmod 400 my-key.pem
4. **Connect to EC2 Instance**
   - Go to **AWS EC2 Dashboard** → **Select your instance** → **Connect** → **SSH Client**.
   - Copy the **SSH connection command** and paste it into your terminal:
     ```bash
     ssh -i "my-key.pem" ec2-user@<EC2_PUBLIC_IP>
     ```

5. **Create and Edit the Installation Script**
   ```bash
   vim kind.sh

6. **Create and edit the script file**
   ```bash
   vim kind.sh

7. **Save the file in Vim**
   - Press:
     ```
     ESC
     :wq
     ```
     This will save and quit the file editor.

8. **Make the script executable**
   ```bash
   chmod 777 kind.sh

9. **Run the KIND setup script**
   ```bash
   ./kind.sh

9. **Add current user to the Docker group**
   ```bash
   sudo usermod -aG docker $USER && newgrp docker

9. **Create a KIND cluster**
   ```bash
   kind create cluster --name my-ec2-cluster

9. **Verify cluster nodes**
   ```bash
   .kubectl get nodes
