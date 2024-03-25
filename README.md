## Guided Meditation

Guides the user through a meditation on start up using `notify-send`. A simple but effective means of doing a morning meditation before starting the day.

To install, execute `meditation_install.sh` to create a `.desktop` file in `~/.config/autostart` to execute `meditation_cron.sh` on startup. 

`meditation_cron.sh` will run `meditation.sh` as well as create a cronjob to run it periodically (default of every four hours) if it doesn't already exist.

Intended for use with [random desktop quote](https://github.com/CrosleyZack/random_desktop_quote)
