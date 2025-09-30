# Surveys App

A simple fullstack application built with **Ruby on Rails** and styled with **Tailwind CSS**.
Users can browse and manage surveys in a minimal interface.

---

## Table of Contents

- [Prerequisites](#prerequisites)
- [Getting Started](#getting-started)
  - [Environment Setup](#environment-setup)
  - [Clone the Repository](#clone-the-repository)
  - [Run Locally](#run-locally)
- [Access](#access)

## Prerequisites

Make sure you have the following installed before setting up the app:

- Ruby **3.4.1**
- Rails **7.2.2.1**
- Nodejs **22+**
- SQLite

---

## Getting Started

### Environment Setup

```bash
apt update
apt upgrade -y
```

### Install basic packages

```bash
apt install -y curl gnupg unzip git build-essential libsqlite3-dev sqlite3
```

### Install Node.js 22+

```bash
curl -fsSL https://deb.nodesource.com/setup_22.x | bash -
apt install -y nodejs
node -v
```

### Install Bun

```bash
curl -fsSL https://bun.sh/install | bash
export PATH="$HOME/.bun/bin:$PATH"
bun -v
```

### Clean up packages (optional)

```bash
apt autoremove
```

### Install RVM (Ruby Version Manager)

> Note: There are multiple ways to install Ruby on your system. In this guide, we will use RVM (Ruby Version Manager).

```bash
# Import GPG keys
gpg --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 \
                7D2BAF1CF37B13E2069D6956105BD0E739499BDB

# Install RVM
\curl -sSL https://get.rvm.io | bash -s stable

# Reload RVM in the current shell
source ~/.rvm/scripts/rvm

# Verify RVM installation
rvm -v
```

### Install Ruby

```bash
rvm install 3.4.1
rvm use 3.4.1 --default
ruby -v
```

### Install Bundler

```bash
gem install bundler
```

---

## Run Locally

### Clone the Repository

```bash
git clone https://github.com/Dabrovsky/survey.git
cd survey
bundle install
```

### Install JS dependencies

```bash
bun install
```

### Prepare the database

```bash
bundle exec rails db:create
bundle exec rails db:migrate
```

### Start the development server

```bash
bin/dev
```

---

## Access

By default, the application is available at:
👉 [http://localhost:3000/surveys](http://localhost:3000/surveys)
