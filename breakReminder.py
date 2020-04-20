"""
A small script to display a notification once an hour to remind me to take a break. 

Depends on:
notify2 0.3.1
apscheduler 3.6.3
"""

import notify2
import datetime
from apscheduler.schedulers.blocking import BlockingScheduler


def main():
    scheduler = BlockingScheduler()

    startTime = datetime.datetime.now().replace(hour=9, minute=0, second=0, microsecond=0)

    scheduler.add_job(displayNotification, "interval", hours=1) 

    print("Press CTRL-C to stop the job.")

    scheduler.start()
   

def displayNotification():
    notify2.init("Break Reminder")

    notification = notify2.Notification("Take a break!", "Take a break for at least 10 minutes.")

    notification.set_timeout(notify2.EXPIRES_NEVER)

    notification.show()


if __name__ == "__main__": 
    main()

