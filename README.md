Terraform module for creating KMS on Alibaba Cloud.  
terraform-alicloud-kms
--------------------

English | [简体中文](https://github.com/terraform-alicloud-modules/terraform-alicloud-kms/blob/master/README-CN.md)

Terraform module which creates KMS resources on Alibaba Cloud. 

These types of resources are supported:

* [KMS-KEY Instance](https://www.terraform.io/docs/providers/alicloud/r/kms_key.html)
* [KMS-Ciphertext Instance](https://www.terraform.io/docs/providers/alicloud/r/kms_ciphertext.html)

## Usage

-> **NOTE:** At present, the resource only supports to modify `is_enabled`.

-> **NOTE:** When the pre-deletion days elapses, the key is permanently deleted and cannot be recovered.

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

## Examples

* [complete](https://github.com/terraform-alicloud-modules/terraform-alicloud-kms/tree/master/examples/complete)

## Notes
From the version v1.1.0, the module has removed the following `provider` setting:

```hcl
provider "alicloud" {
  profile                 = var.profile != "" ? var.profile : null
  shared_credentials_file = var.shared_credentials_file != "" ? var.shared_credentials_file : null
  region                  = var.region != "" ? var.region : null
  skip_region_validation  = var.skip_region_validation
  configuration_source    = "terraform-alicloud-modules/kms"
}
```

If you still want to use the `provider` setting to apply this module, you can specify a supported version, like 1.0.0:

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

If you want to upgrade the module to 1.1.0 or higher in-place, you can define a provider which same region with
previous region:

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
or specify an alias provider with a defined region to the module using `providers`:

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

and then run `terraform init` and `terraform apply` to make the defined provider effect to the existing module state.

More details see [How to use provider in the module](https://www.terraform.io/docs/language/modules/develop/providers.html#passing-providers-explicitly)

Submit Issues
-------------
If you have any problems when using this module, please opening a [provider issue](https://github.com/terraform-providers/terraform-provider-alicloud/issues/new) and let us know.

**Note:** There does not recommend to open an issue on this repo.

Authors
-------
Created and maintained by He Guimin(@xiaozhu36, heguimin36@163.com) and Yi Jincheng(yi785301535@163.com) 

License
----
Apache 2 Licensed. See LICENSE for full details.

Reference
---------
* [Terraform-Provider-Alicloud Github](https://github.com/terraform-providers/terraform-provider-alicloud)
* [Terraform-Provider-Alicloud Release](https://releases.hashicorp.com/terraform-provider-alicloud/)
* [Terraform-Provider-Alicloud Docs](https://www.terraform.io/docs/providers/alicloud/index.html)

