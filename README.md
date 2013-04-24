riak-stuff
==========

Random information and utilities for doing riak stuff

empty_riak_bucket.sh
--------------------

A script to use curl to clean out a riak bucket.  You'll want to change the `BUCKET` and `RIAKHOST` variables to point to the appropriate values for your environment.  

get_key_count.sh
----------------
Pass in the bucket names as command-line parameters and this will spit out how many entries are in the bucket.  Requires curl.
