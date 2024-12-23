# GitLab

[Install self-managed GitLab](https://about.gitlab.com/install/)

## Ubuntu

Pre-requisites

```bash
sudo apt update
sudo apt install -y ca-certificates tzdata perl net-tools
```

Package repository

```bash
curl https://packages.gitlab.com/install/repositories/gitlab/gitlab-ee/script.deb.sh | sudo bash
```

Install gitlab

```bash
sudo EXTERNAL_URL="http://git.example.com" apt install -y gitlab-ee
sudo apt-mark hold gitlab-ee
```

Initial root password

```bash
sudo cat /etc/gitlab/initial_root_password
```

Visit gitlab

- URL: [git.example.com](https://git.example.com)
- Username: `root`
- Password: `<initial_root_password>`
