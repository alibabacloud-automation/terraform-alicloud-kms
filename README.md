Terraform module for creating KMS on Alibaba Cloud.  
terraform-alicloud-kms
--------------------

English | [简体中文](https://github.com/terraform-alicloud-modules/terraform-alicloud-kms/blob/master/README-CN.md)

Terraform module which creates KMS resources on Alibaba Cloud. 

These types of resources are supported:

* [KMS-KEY Instance](https://www.terraform.io/docs/providers/alicloud/r/kms_key.html)
* [KMS-Ciphertext Instance](https://www.terraform.io/docs/providers/alicloud/r/kms_ciphertext.html)

## Terraform versions

This module requires Terraform 0.12 and Terraform Provider AliCloud 1.56.0+.

## Usage

-> **NOTE:** At present, the resource only supports to modify `is_enabled`.

-> **NOTE:** When the pre-deletion days elapses, the key is permanently deleted and cannot be recovered.

```hcl
module "kms"  {
  source   = "terraform-alicloud-modules/kms/alicloud"
  region   = "cn-beijing"                
  profile  = "Your-Profile-Name"
  
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

* This module using AccessKey and SecretKey are from `profile` and `shared_credentials_file`.
If you have not set them yet, please install [aliyun-cli](https://github.com/aliyun/aliyun-cli#installation) and configure it.

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

