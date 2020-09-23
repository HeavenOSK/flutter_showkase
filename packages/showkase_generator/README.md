# showkase_generator

## Installation
Add dependencies as following.

```yaml
dependencies:
  showkase:
    git:
      url: git@github.com:HeavenOSK/flutter_showkase.git
      path:
        packages/showkase
dev_dependencies:
  build_runner: 
  showkase_generator:
    git:
      url: git@github.com:HeavenOSK/flutter_showkase.git
      path:
        packages/showkase_generator
```

## Usage
### Generate with `showkase_generator` and another generators.
```shell script
$ flutter pub run build_runner build 
```

### Generator only with `showkase_generator`.
```shell script
$ flutter pub run showkase_generator
```
