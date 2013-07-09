BEGIN {
	max = -1; maxFile = "-";
	min = 9223372036854775807; minFile = "-";
	sum = 0;
	count = 0;
};
	
{
	if ($5 > max) {
		max = $5;
		maxFile = $9
	}

	if ($5 < min) {
		min = $5;
		minFile = $9;
	}

	sum += $5;
	count++;
};

END {
	print "max: ", max, "\t", maxFile, "\n"
	print "min: ", min, "\t", minFile, "\n"
	print "avg: ", (sum / count)
}
