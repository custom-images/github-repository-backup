# GitHub Repository Backup

[![Docker](../../actions/workflows/docker.yml/badge.svg)](../../actions/workflows/docker.yml)

Non-official Docker image for backing up [GitHub](https://github.com) repositories as [git bundles](https://git-scm.com/docs/git-bundle).

## ⚙️ Get Started

You'll need [Docker](https://docker.com) installed.

### Run Container

#### PowerShell

Run the following command in Windows PowerShell.

> **Note**: You'll need to grant the GitHub Personal Access Token (PAT) the following scopes: `read:org, read:user, repo`

```powershell
$ docker run --rm --volume ${PWD}:/mnt/local ghcr.io/custom-images/github-repository-backup --pat=GITHUB_PERSONAL_ACCESS_TOKEN
```

#### CMD

Run the following command in Windows Command Prompt.

> **Note**: You'll need to grant the GitHub Personal Access Token (PAT) the following scopes: `read:org, read:user, repo`

```sh
$ docker run --rm --volume %cd%:/mnt/local ghcr.io/custom-images/github-repository-backup --pat=GITHUB_PERSONAL_ACCESS_TOKEN
```

## 👷‍ Error Found?

Thank you for your message! Please fill out a [bug report](../../issues/new?assignees=&labels=&template=bug_report.md&title=).

## License

This project is licensed under the [European Union Public License 1.2](https://choosealicense.com/licenses/eupl-1.2/).
