terraform-alicloud-kms
=====================================================================

本 Terraform 模块将用于在阿里云上创建 KMS 。

支持以下类型的资源：

* [KMS-KEY Instance](https://www.terraform.io/docs/providers/alicloud/r/kms_key.html)
* [KMS-Ciphertext Instance](https://www.terraform.io/docs/providers/alicloud/r/kms_ciphertext.html)

## Terraform 版本

本模板要求使用版本 Terraform 0.12 和 阿里云 Provider 1.56.0+。

## 用法

->**注意** 目前资源只支持修改 `is_enabled` 。

->**注意** 当预删除天数过去时，密钥将被永久删除，并且无法恢复。

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

## 示例

* [创建KMS 示例](https://github.com/terraform-alicloud-modules/terraform-alicloud-kms/tree/master/examples/complete)

## 注意事项

* 本 Module 使用的 AccessKey 和 SecretKey 可以直接从 `profile` 和 `shared_credentials_file` 中获取。如果未设置，可通过下载安装 [aliyun-cli](https://github.com/aliyun/aliyun-cli#installation) 后进行配置。

提交问题
------
如果在使用该 Terraform Module 的过程中有任何问题，可以直接创建一个 [Provider Issue](https://github.com/terraform-providers/terraform-provider-alicloud/issues/new)，我们将根据问题描述提供解决方案。

**注意:** 不建议在该 Module 仓库中直接提交 Issue。

作者
-------
Created and maintained by Alibaba Cloud Terraform Team(terraform@alibabacloud.com)

许可
----
Apache 2 Licensed. See LICENSE for full details.

参考
---------
* [Terraform-Provider-Alicloud Github](https://github.com/terraform-providers/terraform-provider-alicloud)
* [Terraform-Provider-Alicloud Release](https://releases.hashicorp.com/terraform-provider-alicloud/)
* [Terraform-Provider-Alicloud Docs](https://www.terraform.io/docs/providers/alicloud/index.html)
