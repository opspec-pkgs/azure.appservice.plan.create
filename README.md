# Problem statement
creates an azure appservice plan (if it doesn't already exist)

# Example usage

> note: in examples, VERSION represents a version of the azure.appservice.plan.create pkg

## install

```shell
opctl pkg install github.com/opspec-pkgs/azure.appservice.plan.create#VERSION
```

## run

```
opctl run github.com/opspec-pkgs/azure.appservice.plan.create#VERSION
```

## compose

```yaml
op:
  pkg: { ref: github.com/opspec-pkgs/azure.appservice.plan.create#VERSION }
  inputs: 
    subscriptionId:
    loginId:
    loginSecret:
    name:
    resourceGroup:
    # begin optional args
    isLinux:
    location:
    loginTenantId:
    loginType:
    numberOfWorkers:
    sku:
    # end optional args
```

# Support

join us on [![Slack](https://opspec-slackin.herokuapp.com/badge.svg)](https://opspec-slackin.herokuapp.com/)
or [open an issue](https://github.com/opspec-pkgs/azure.appservice.plan.create/issues)
