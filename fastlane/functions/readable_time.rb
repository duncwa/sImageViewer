#!/usr/bin/env groovy
#
#   readable_time.rb
#   Tooling
#   Created by Duncan Wallace 08/21/2020
#   Copyright © 2020. Duncwa LLC.  All rights reserved

def to_clock(secs)
 Time.at(secs.to_i).utc.strftime("%H: hrs %M: mins %S secs. ")
end
