BEGIN {
	max = -1; maxFile = "-";
	min = 9223372036854775807; minFile = "-";
	sum = 0;
	count = 0;
};
	
{
	if (length($5) > 0) {
		if ($5 > max) {
			max = $5;
			maxFile = $8
		}

		if ($5 < min) {
			min = $5;
			minFile = $8;
		}

		sum += $5;
		count++;
	}
};

END {
	print "max: ", max, "\t", maxFile
	print "min: ", min, "\t", minFile
	print "avg: ", (sum / count)
}
