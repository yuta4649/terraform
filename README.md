# terraform

## 🚀 Getting Started

### 1. Prerequisites

- **Terraform v1.13.4**
- **AWS CLI configured** (`aws configure`)
- S3 backend bucket already created for remote state  
  (You can manage it under `modules/backend` if needed)

### 2. Initialize Terraform

Run this once per environment:

```bash
set ENV dev
cd environments/$ENV
terraform init
```

### 3. Plan Infrastructure Changes

To review what will be created / updated:

```bash
set ENV dev
cd environments/$ENV
terraform plan
```

### 4. Apply Changes (Deploy)

Apply the configuration to AWS:

```bash
set ENV dev
cd environments/$ENV
terraform apply
```

### 5. Destroy Resources (Cleanup)

To remove all resources for the environment:

```bash
set ENV dev
cd environments/$ENV
terraform destroy
```
