import re
import os
from datetime import timedelta

total_time = timedelta(0)

with open('/Users/hazmatzo/github_projects/Learn/destroy_all_software.txt') as new_file:
  pattern = re.compile('^.*(?P<minutes>\d{2}):(?P<seconds>\d{2})$')
  for line in new_file:
    timematch = pattern.match(line)
    if timematch:
      total_time += timedelta(minutes = int(timematch.group('minutes')), seconds = int(timematch.group('seconds')))

hours = float(total_time.total_seconds() / (60*60))

print("Result is approximately %.2f hours" % hours)