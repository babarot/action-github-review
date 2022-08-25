action-github-review
====================

[![](https://github.com/b4b4r07/action-github-review/workflows/release/badge.svg)](https://github.com/b4b4r07/action-github-review/releases)

Create GitHub Review

This action depends on https://github.com/b4b4r07/github-review

## Usage

A whole example is here:

```yaml
name: Get changed objects

on:
  push:
    branches:
      - '*'
      - '!master'

jobs:
  show:
    runs-on: ubuntu-latest
    name: Get changed objects
    steps:
    - name: Checkout
      uses: actions/checkout@v1
    - name: Get changed objects
      uses: b4b4r07/action-github-review@master
      with:
        added: 'true'
        deleted: 'false'
        modified: 'true'
      env:
        LOG: 'trace'
      id: objects
    - name: Show the previous result
      run: |
        echo ${{ steps.objects.outputs.changed }}
```

## Customizing

### inputs

The following are optional as `step.with` keys

| Name       | Type   | Description              | Default |
| ---------- | ------ | -------------------------| ------- |
| `owner`    | String | repository owner name   | |
| `repo`     | String | repository name         | |
| `number`   | Number | pull request number     | |
| `event`    | String | event name of review    | |

### outputs

The following outputs can be accessed via `${{ steps.<step-id>.outputs }}` from this action

| Name | Type | Description |
| ---- | ---- | ----------- |
| n/a  | | |

### environment variables

The following are as `step.env` keys

| Name | Description |
| ---- | ----------- |
| `LOG`  | Log with each level (`TRACE`, `DEBUG`, `INFO`, `WARN` and `ERROR`) |

## License

[MIT](https://b4b4r07.mit-license.org/)
