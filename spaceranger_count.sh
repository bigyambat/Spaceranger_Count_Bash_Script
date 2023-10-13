#!/bin/bash

TIFF_Files="/scratch/seqRuns/spatial/HJELM/TIFF_Files/*"

TIFF_Path="/scratch/seqRuns/spatial/HJELM/TIFF_Files"

mapfile -t TIFF_Name < <(basename -a ${TIFF_Files})

FASTQ_Path="/scratch/seqRuns/spatial/HJELM/mkfastq_Lane1/H32LVDRX3/outs/fastq_path/HJELMSPTLTRNCRPT"

FASTQ_Files="${FASTQ_Path}"

FASTQ_Names=()
for file in "${FASTQ_Path}"/*; do
    [[ -e "${file}" ]] && FASTQ_Names+=("${file}")
done

Names=(SampleB SampleC SampleD SampleE)

# For i in the number of elements in FASTQ_Names array
for i in "${!FASTQ_Names[@]}" ;
do
    spaceranger count --id="${Names[$i]}" --transcriptome="/home/bambat/reference_genomes/refdata-gex-mm10-2020-A" --fastqs="${FASTQ_Names[$i]}" --image="${TIFF_Path}/${TIFF_Name[$i]}" --slide="V19L01-051" --area="B1" --r1-length="28"
done
