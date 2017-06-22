#!/bin/bash

#   STORMMiner="/home/kpchase/STORMMiner"

#   sudo yum -y update
#   sudo yum -y install git
#   sudo yum -y install xauth
#   sudo yum -y install xpdf
#   sudo yum -y install wget

#   sudo yum -y install lynx
#   sudo yum -y install poppler

#   sudo yum -y install epel-release
#   sudo yum -y install java-1.7.0-openjdk-devel

#   wget http://downloads.lightbend.com/scala/2.11.8/scala-2.11.8.rpm
#   sudo yum -y install scala-2.11.8.rpm

#   sudo yum -y install R

#   if [ -f install.packages.R ] ; then
#       Rscript install.packages.R
#   else
#       echo "install.packages.R not found"
#       exit 1
#   fi

###########################

stormdir="/home/kpchase/stormminer/v1.1.0"
cd $stormdir

if [ -f install.STORMMiner.R ] ; then
    rm -r $STORMMiner
    Rscript install.STORMMiner.R
else
    echo "install.STORMMiner.R not found"
    exit 1
fi

###########################

studydir="/home/kpchase/PunicStudy8"
rm -r $studydir
mkdir $studydir

cp $STORMMiner/data_files/naval.mappings.txt $studydir/.

cp /home/kpchase/debug.out.1.gz $studydir/.
$STORMMiner/bin/createTempMetrics.sh $studydir

cp $studydir/stormminer/tmp.metrics.csv $studydir/stormminer/final.metrics.csv
#edit final.metrics.csv

$STORMMiner/bin/setupStudy.sh $studydir

#Can't find your paths.dat file: /home/kpchase/PunicStudy2/paths.dat

#$STORMMiner/bin/startSTORMMiner.sh $studydir


