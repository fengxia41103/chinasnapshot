#!/usr/bin/python
# -*- coding: utf-8 -*-

from selenium import webdriver
import unittest,random, string,datetime, pprint,re,time, shelve
from itertools import izip_longest
from unittest import TestCase,TestSuite
from selenium.common.exceptions import TimeoutException
from selenium.webdriver.support.ui import WebDriverWait # available since 2.4.0
from selenium.webdriver.support import expected_conditions as EC # available since 2.26.0
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.common.by import By
from selenium.webdriver.support.select import Select
from selenium.webdriver.common.desired_capabilities import DesiredCapabilities
import urllib2, lxml.html, sys
from itertools import izip_longest

# import models
from models import *

class ParametrizedTestCase(TestCase):
    """ TestCase classes that want to be parametrized should
        inherit from this class.
    """
    def __init__(self, methodName='runTest', param=None):
        super(ParametrizedTestCase, self).__init__(methodName)
        self.param = param

    @staticmethod
    def parametrize(testcase_klass, param=None):
        """ Create a suite containing all tests taken from the given
            subclass, passing them the parameter 'param'.
        """
        testloader = unittest.TestLoader()
        testnames = testloader.getTestCaseNames(testcase_klass)
        suite = unittest.TestSuite()
        for name in testnames:
            suite.addTest(testcase_klass(name, param=param))
        return suite

class MyDriver():
	def __init__(self):
		if BROWSER.lower() == 'ie':
			DesiredCapabilities.INTERNETEXPLORER['ignoreProtectedModeSettings']=True
			self.driver=webdriver.Ie()
		elif BROWSER.lower() == 'chrome':
			self.driver=webdriver.Chrome()
		elif BROWSER.lower() == 'firefox':
			self.driver=webdriver.Firefox()
		elif BROWSER.lower() == 'htmlunit': pass
			#server_url = "http://%s:%s/wd/hub" % (SELENIUM_RC_SERVER_IP, SELENIUM_RC_SERVER_PORT)
			#self.driver= webdriver.Remote(server_url,desired_capabilities=webdriver.DesiredCapabilities.HTMLUNIT.copy())

class MyPrettyPrinter(pprint.PrettyPrinter):
    def format(self, object, context, maxlevels, level):
        if isinstance(object, unicode):
            return (object.encode('utf8'), True, False)
        return pprint.PrettyPrinter.format(self, object, context, maxlevels, level)

class MyUtility():
	def __init__(self):
		pass

	def illegal_characters(self, length=1):
		myrg = random.SystemRandom()
		return ''.join(myrg.choice(string.punctuation) for _ in range(length))

	def legal_characters(self,length=1):
		myrg = random.SystemRandom()
		return ''.join(myrg.choice(string.ascii_letters+string.digits) for _ in range(length))

	def integers(self, length=1, padding=None):
		myrg = random.SystemRandom()
		tmp=str(int(''.join(myrg.choice(string.digits) for _ in range(length))))
		if padding: return tmp.zfill(int(padding))
		else: return tmp

	def floats(self, part_1, part_2):
		if part_2:
			return '%s.%s' % (self.integers(part_1),self.integers(part_2))
		else:
			return '%s' % self.integers(part_1)

	def period_around_today(self, gap=10):
		g = datetime.timedelta(days=gap)
		today=datetime.date(1971,1,1).today()
		start=today-g
		end=today+g
		return (start,end)

	def today_plus(self,plus=1):
		g = datetime.timedelta(days=plus)
		today=datetime.date(1971,1,1).today()
		return (today+g).strftime('%Y-%m-%d')

	def grouper(self, iterable, n, padvalue=None):
    	# grouper('abcdefg', 3, 'x') --> ('a','b','c'), ('d','e','f'), ('g','x','x')
		return list(izip_longest(*[iter(iterable)]*n, fillvalue=padvalue))


