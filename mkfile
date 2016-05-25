<qualimap.mk

QUALIMAP_TARGETS=`{find -L data/ -name '*.bam' \
	| sed -e 's#data/#results/qualimap/#' \
		-e 's#\.bam$#/qualimap_report.html }

qualimap:V:	$QUALIMAP_TARGETS

results/qualimap/%/qualimap_report.html:	data/%.bam
	DIR=`dirname $target`
	mkdir -p $DIR
	qualimap bamqc -bam $prereq -outdir $DIR

clean-qualimap:VE:
	rm -r results/qualimap
