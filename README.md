action-github-review
====================

[![](https://github.com/b4b4r07/action-github-review/workflows/release/badge.svg)](https://github.com/b4b4r07/action-github-review/releases)

Create GitHub Review

This action depends on https://github.com/b4b4r07/github-review

## Usage

A whole example is here:

```yaml
name: Hotfix Approve
on:
  pull_request:
    types:
      - labeled

jobs:
  build:
    runs-on: ubuntu-18.04
    steps:
      - name: Checkout
        uses: actions/checkout@v2
        with:
          fetch-depth: 0
      - name: Get pull request number
        id: pr
        run: echo "::set-output name=number::$(echo $GITHUB_REF | sed -e 's/[^0-9]//g')"
      - name: Create a review with approve when adding 'hotfix' label
        uses: b4b4r07/action-github-review@main
        if: github.event.label.name == 'hotfix'
        env:
          GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
        with:
          owner: (b4b4r07)
          repo: (repo-name)
          number: ${{ steps.pr.outputs.number }}
          event: APPROVE
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
