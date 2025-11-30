# GitLab

[Install self-managed GitLab](https://about.gitlab.com/install/)

## Ubuntu

Prerequisites

```sh
sudo apt update
sudo apt install -y ca-certificates tzdata perl net-tools
```

Install

```sh
curl https://packages.gitlab.com/install/repositories/gitlab/gitlab-ee/script.deb.sh -o install.sh

sudo bash install.sh
rm -f install.sh
```

Install gitlab

```sh
sudo EXTERNAL_URL="http://git.example.com" apt install -y gitlab-ee
sudo apt-mark hold gitlab-ee
```

Initial root password

```sh
sudo cat /etc/gitlab/initial_root_password
```

Visit gitlab

- URL: [git.example.com](https://git.example.com)
- Username: `root`
- Password: `<initial_root_password>`
