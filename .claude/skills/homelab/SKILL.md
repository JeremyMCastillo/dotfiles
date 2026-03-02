---
name: homelab
description: Interact with the Ubuntu homelab server. Use when the user wants to run commands, execute scripts, manage services, copy files to/from, or explore the filesystem on their homelab. Triggered by mentions of "homelab", "linux server", "the server", or remote file operations.
tools: Bash
---

# Homelab Server Access

## Connection Details

| Property | Value |
|----------|-------|
| Hostname | `linux` |
| User     | `jcast` |
| Auth     | RSA key (default SSH key) |
| OS       | Ubuntu |

Base SSH prefix: `ssh jcast@linux`

---

## Usage Patterns

### Execute a command

```bash
ssh jcast@linux '<command>'
```

For multi-line or complex commands, use a heredoc over SSH:

```bash
ssh jcast@linux 'bash -s' << 'EOF'
command1
command2
EOF
```

For long-running commands where you want to keep the session alive:

```bash
ssh -o ServerAliveInterval=60 jcast@linux '<command>'
```

### Copy a file TO the server

```bash
scp <local-path> jcast@linux:<remote-path>
```

Example:
```bash
scp /tmp/script.sh jcast@linux:/home/jcast/scripts/
```

### Copy a file FROM the server

```bash
scp jcast@linux:<remote-path> <local-path>
```

Example:
```bash
scp jcast@linux:/var/log/syslog /tmp/syslog.txt
```

### Sync a directory TO the server (rsync)

```bash
rsync -avz <local-dir>/ jcast@linux:<remote-dir>/
```

### Sync a directory FROM the server (rsync)

```bash
rsync -avz jcast@linux:<remote-dir>/ <local-dir>/
```

Use `--dry-run` first when syncing large amounts of data to preview changes.

---

## Common Tasks

### Check system status
```bash
ssh jcast@linux 'uptime && df -h && free -h'
```

### List running services
```bash
ssh jcast@linux 'systemctl list-units --type=service --state=running'
```

### View recent logs
```bash
ssh jcast@linux 'journalctl -n 100 --no-pager'
```

### Tail a log file
```bash
ssh jcast@linux 'tail -f /var/log/syslog'
```

---

## Guidelines

- Always quote remote commands in single quotes to prevent local shell expansion
- Use `--dry-run` with rsync before large transfers
- Prefer `rsync` over `scp` for directories (resumable, incremental)
- For destructive operations (rm, service restarts), confirm with the user before executing
- If the connection fails, check that the hostname `linux` resolves (may require VPN or local network)

---

## User Request

$ARGUMENTS
