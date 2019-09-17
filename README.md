# kosh_sync
Simple GIT sync utility for [Kosh](https://github.com/cceh/kosh)

Usage:
1. Edit `docker-compose.sync.yml`
2. `docker-compose [...] -f docker-compose.sync.yml [...] up`

Environment variables:
- `KOSH_SYNC_BRANCH`: The git branch to sync
- `KOSH_SYNC_FOLDER`: The in-container folder to sync
- `KOSH_SYNC_ORIGIN`: The URL to the git repository to sync
- `KOSH_SYNC_REPOSE`: The sleep time between syncs
