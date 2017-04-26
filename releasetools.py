import common
import edify_generator
import os

def RemoveDeviceAssert(info):
  edify = info.script
  for i in xrange(len(edify.script)):
    if "assert" in edify.script[i]:
      edify.script[i] = ''
      return

def RemoveDeviceGetprop(info):
  edify = info.script
  for i in xrange(len(edify.script)):
    if "getprop" in edify.script[i]:
      edify.script[i] = ''
      return

def FullOTA_InstallEnd(info):
    RemoveDeviceAssert(info)
    RemoveDeviceGetprop(info)

def IncrementalOTA_InstallEnd(info):
    RemoveDeviceAssert(info)
    RemoveDeviceGetprop(info)


