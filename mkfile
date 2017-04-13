<config.mk

results/%/qualimap_report.html:	data/%.bam
	DIR=`dirname $target`
	mkdir -p "$DIR"
	qualimap bamqc \
		-bam $prereq \
		-outdir "$DIR"
