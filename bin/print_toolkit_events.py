#!/usr/bin/python
#
# print_toolkit_events.py
#
# Copyright (C) 2015 Magdalen Berns <m.berns@thismagpie.com>
#
# This library is free software; you can redistribute it and/or
# modify it under the terms of the GNU Lesser General Public
# License as published by the Free Software Foundation; either
# version 2.1 of the License, or (at your option) any later version.
#
# This library is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
# Lesser General Public License for more details.
#
# You should have received a copy of the GNU Lesser General Public
# License along with this library; if not, write to the
# Free Software Foundation, Inc., Franklin Street, Fifth Floor,
# Boston MA  02110-1301 USA.

import pyatspi

def on_key_input(event):
  if event.type == pyatspi.KEY_RELEASED_EVENT:
    return
  if event.event_string=='F4':
    pyatspi.Registry.stop()

def print_changed(event):
  if event.host_application.name == "gtk3-demo" or event.host_application.name == "SwingSet3":
    if event.source.getState().contains(pyatspi.STATE_MANAGES_DESCENDANTS):
      print("contains pyatspi.STATE_MANAGES_DESCENDANTS")

    print("[{0}]  ~ [{1}] ==> [{2}:{3} {4}]").format(event.host_application.name,
                                                     event.source.getRoleName(),
                                                     event.type,
                                                     event.detail1,
                                                     event.detail2)
  else:
    return

pyatspi.Registry.registerEventListener(print_changed,
                                       "object:state-changed",
                                       "window:",
                                       "object:selection-changed",
                                       "object:active-descendant-changed",
                                       "object:property-change")
pyatspi.Registry.registerKeystrokeListener(on_key_input,
                                           kind=(pyatspi.KEY_PRESSED_EVENT,
                                                 pyatspi.KEY_RELEASED_EVENT))
pyatspi.Registry.start()

