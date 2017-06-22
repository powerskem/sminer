#!/bin/bash


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

##############################################3

#   STORMMiner="/home/kpchase/STORMMiner"

#   stormdir="/home/kpchase/stormminer/v1.0.1"
#   cd $stormdir

#   if [ -f install.packages.R ] ; then
#       Rscript install.packages.R
#   else
#       echo "install.packages.R not found"
#       exit 1
#   fi

    if [ -f install.STORMMiner.R ] ; then
        rm -r $STORMMiner
        Rscript install.STORMMiner.R
    else
        echo "install.STORMMiner.R not found"
        exit 1
    fi

##############################################3

studydir="/home/kpchase/PunicStudy5"
rm -r $studydir
mkdir $studydir

cp $STORMMiner/samples/naval.mappings.txt $studydir/.

cp $STORMMiner/STORMMiner/test/data/debug.out.1.gz $studydir/.
scala $STORMMiner/scala/create.tmp.metrics.scala $studydir debug.out.1.gz naval.mappings.txt

cp $studydir/tmp.metrics.csv $studydir/final.metrics.csv
#edit final.metrics.csv
scala $STORMMiner/scala/setup.study.scala $studydir final.metrics.csv $STORMMiner/TaskList-template.xml 1 15

$STORMMiner/startSTORMMiner.sh $studydir/TaskList.xml $STORMMiner/TaskInfo.xml

#can't find your paths.dat file: /home/kpchase/PunicStudy5/paths.dat; exiting


