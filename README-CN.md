terraform-alicloud-kms
=====================================================================

本 Terraform 模块将用于在阿里云上创建 KMS 。

支持以下类型的资源：

* [KMS-KEY Instance](https://www.terraform.io/docs/providers/alicloud/r/kms_key.html)
* [KMS-Ciphertext Instance](https://www.terraform.io/docs/providers/alicloud/r/kms_ciphertext.html)


## 用法

->**注意** 目前资源只支持修改 `is_enabled` 。

->**注意** 当预删除天数过去时，密钥将被永久删除，并且无法恢复。

```hcl
module "kms"  {
  source   = "terraform-alicloud-modules/kms/alicloud"
  
  #key
  description             = "Hello KMS"
  deletion_window_in_days = "7"
  is_enabled              = true

  #ciphertext
  plaintext = "example"

  #decrypt
  decrypt = true
}
```

## 示例

* [创建KMS 示例](https://github.com/terraform-alicloud-modules/terraform-alicloud-kms/tree/master/examples/complete)

## 注意事项
本Module从版本v1.1.0开始已经移除掉如下的 provider 的显示设置：

```hcl
provider "alicloud" {
  profile                 = var.profile != "" ? var.profile : null
  shared_credentials_file = var.shared_credentials_file != "" ? var.shared_credentials_file : null
  region                  = var.region != "" ? var.region : null
  skip_region_validation  = var.skip_region_validation
  configuration_source    = "terraform-alicloud-modules/kms"
}
```

如果你依然想在Module中使用这个 provider 配置，你可以在调用Module的时候，指定一个特定的版本，比如 1.0.0:

```hcl
module "kms" {
  source  = "terraform-alicloud-modules/kms/alicloud"
  version     = "1.0.0"
  region      = "cn-beijing"
  profile     = "Your-Profile-Name"
  description             = "Hello KMS"
  deletion_window_in_days = "7"
  is_enabled              = true
  // ...
}
```

如果你想对正在使用中的Module升级到 1.1.0 或者更高的版本，那么你可以在模板中显示定义一个系统过Region的provider：
```hcl
provider "alicloud" {
  region  = "cn-beijing"
  profile = "Your-Profile-Name"
}
module "kms" {
  source  = "terraform-alicloud-modules/kms/alicloud"
  description             = "Hello KMS"
  deletion_window_in_days = "7"
  is_enabled              = true
  // ...
}
```
或者，如果你是多Region部署，你可以利用 `alias` 定义多个 provider，并在Module中显示指定这个provider：

```hcl
provider "alicloud" {
  region  = "cn-beijing"
  profile = "Your-Profile-Name"
  alias   = "bj"
}
module "kms" {
  source  = "terraform-alicloud-modules/kms/alicloud"
  providers = {
    alicloud = alicloud.bj
  }
  description             = "Hello KMS"
  deletion_window_in_days = "7"
  is_enabled              = true
  // ...
}
```

定义完provider之后，运行命令 `terraform init` 和 `terraform apply` 来让这个provider生效即可。

更多provider的使用细节，请移步[How to use provider in the module](https://www.terraform.io/docs/language/modules/develop/providers.html#passing-providers-explicitly)

## Terraform 版本

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.12.0 |
| <a name="requirement_alicloud"></a> [alicloud](#requirement\_alicloud) | >= 1.56.0 |

提交问题
------
如果在使用该 Terraform Module 的过程中有任何问题，可以直接创建一个 [Provider Issue](https://github.com/terraform-providers/terraform-provider-alicloud/issues/new)，我们将根据问题描述提供解决方案。

**注意:** 不建议在该 Module 仓库中直接提交 Issue。

作者
-------
Created and maintained by Yi Jincheng(yi785301535@163.com) and He Guimin(@xiaozhu36, heguimin36@163.com)

许可
----
Apache 2 Licensed. See LICENSE for full details.

参考
---------
* [Terraform-Provider-Alicloud Github](https://github.com/terraform-providers/terraform-provider-alicloud)
* [Terraform-Provider-Alicloud Release](https://releases.hashicorp.com/terraform-provider-alicloud/)
* [Terraform-Provider-Alicloud Docs](https://www.terraform.io/docs/providers/alicloud/index.html)
