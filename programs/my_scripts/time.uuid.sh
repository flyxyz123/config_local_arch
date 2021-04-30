# echo current nanosecond since epoch and alpha-numerically ordered UUID
# https://stackoverflow.com/questions/28681650/generate-alpha-numerically-ordered-uuids-over-time?noredirect=1&lq=1
# https://askubuntu.com/questions/342842/what-does-this-command-mean-awk-f-print-4
echo $(date '+%s.%N').$(uuidgen -t | awk -F- '{OFS="-"; print $3,$2,$1,$4,$5}')
