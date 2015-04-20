import re
import os
from datetime import timedelta

# This is to get the time of all Destroy All Software videos and figure out how
# long it would take to watch all of them.

# First 3 lines of file:
# Season 1 (18 episodes)
# TitleCategoryLength
# Statistics Over Git RepositoriesGit14:26

new_file = open('destroy_all_software.txt')
new_content = new_file.read()
timeRegex = re.compile(r'\d\d:\d\d')
all_times = re.findall(r'\d\d:\d\d', new_content)

total_time = timedelta(00)

for t in all_times:
  split_t = t.split(":", 1)
  more_time = timedelta(minutes = int(split_t[0]), seconds = int(split_t[1]))
  total_time = total_time + more_time

hours = float(total_time.seconds / 60 / 60)

print("Result is approximately " + str(hours) + " hours")