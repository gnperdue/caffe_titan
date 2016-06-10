#!/bin/bash
echo "Making .ini file for $USER"

FILENAME=epsilon_127x50_xuv.ini
if [ $# -gt 0 ]; then
  FILENAME=$1
fi

echo "[path]" > $FILENAME
ROOTDIR=/lustre/atlas/proj-shared/hep105
echo "myself    = $ROOTDIR/$USER/caffe_titan/caffe_workflow/mlmpr_caffe_depend.py" >> $FILENAME
echo "caffe     = $ROOTDIR/steven_caffe2/caffe" >> $FILENAME
echo "snapshots = $ROOTDIR/$USER/caffe_titan/caffe_workflow/xuv/snapshots" >> $FILENAME
echo "logs      = $ROOTDIR/$USER/caffe_titan/caffe_workflow/xuv/logs" >> $FILENAME
echo "solver    = $ROOTDIR/$USER/caffe_titan/xuv/epsilon_127x50_xuv_solver.prototxt" >> $FILENAME
echo "" >> $FILENAME
echo "[caffe]" >> $FILENAME
echo "; optional solver modifications" >> $FILENAME
echo "max_iter = 150000" >> $FILENAME
echo "test_iter = 1500" >> $FILENAME
echo "snapshot = 5000" >> $FILENAME
echo "display = 5000" >> $FILENAME
echo "test_interval = 5000" >> $FILENAME

echo "...done."
