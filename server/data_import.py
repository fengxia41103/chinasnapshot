#!/usr/bin/python  
# -*- coding: utf-8 -*- 
import sys,time,os,os.path,gc,csv
import lxml.html,codecs
import urllib,urllib2
import re
import simplejson as json

# setup Django
import django
sys.path.append(os.path.join(os.path.dirname(__file__), 'china'))
os.environ.setdefault("DJANGO_SETTINGS_MODULE", "china.settings")
from django.conf import settings

from django.utils import timezone

# import models
from mandarin.models import *

import xlrd, os.path
def import_big_moving():
	pat_sheet = re.compile('(?P<room_name>[^(]+)\((?P<room_index>\d+)')
	name = '/home/fengxia/Downloads/Big moving.xlsx'
	wk = xlrd.open_workbook(name)
	for s in wk.sheet_names():
		tmp = pat_sheet.search(s)

		room, created = MyRoom.objects.get_or_create(tracking = tmp.group('room_index').strip())
		room.name = tmp.group('room_name').strip()
		room.save()

		print 'Reading', s
		in_summary = in_items = False

		sheet = wk.sheet_by_name(s)
		for row in range(sheet.nrows):
			first_col = sheet.cell(row,0).value
			last_col = sheet.cell(row,8).value

			if not first_col: continue # empty
			elif first_col == 'Box': 
				in_summary = True
				in_items = False
			elif first_col == 'Items': 
				in_summary = False
				in_items = True

			if first_col in ['Box', 'Items']: continue

			if in_summary:
				home_room = first_col.split('-')[0].strip()
				r,created = MyRoom.objects.get_or_create(tracking = home_room)

				box = first_col.split('-')[-1].strip()
				b,created = MyBox.objects.get_or_create(tracking = box,room=room)

				status = sheet.cell(row,1).value
				if status and status.lower().strip() == 'y':
					b.status = 'S'
					b.save()

				unpack = sheet.cell(row,2).value
				if unpack: 
					b.unpack_priority = int(unpack)
					b.save()

			elif in_items and first_col:
				# create item
				item = MyItem(name = first_col,status='P',room=room)
				item.save()
				if last_col and '-' in last_col:
					for l in last_col.split('\n'):
						# print l
						home_room = l.split('-')[0].strip()
						r,created = MyRoom.objects.get_or_create(tracking = home_room)

						box = l.split('-')[-1].strip()
						b,created = MyBox.objects.get_or_create(tracking = box,room=r)
						
						# it is boxed
						item.boxes.add(b)
						item.status = 'B'
						item.save()

def main():
	django.setup()

	# import_big_moving()
	for box in MyBox.objects.all():
		if box.full_tracking.replace(' ','') in ['1-18','1-19','5-3','5-1','3-3','3-10','3-9','1-3','1-2','1-4','1-14','1-17','1-11','1-13','1-16','1-10','4-3']:
			box.status='S'
			print box.full_tracking, box.status
		
		elif box.full_tracking.replace(' ','') in ['1-5','4-3','1-1','1-15']:
			box.status='P'
		elif box.status == 'S': continue
		else: box.status = 'E'
		box.save()

if __name__ == '__main__':
	main()
