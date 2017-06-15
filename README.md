# problem statement
creates an azure appservice plan (if it doesn't already exist)

# example usage

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
run:
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
