#!/bin/bash
echo "Making .ini file for $USER"

FILENAME=epsilon_127x50_xuv.ini
MAXITER=1000
TESTITER=200
SNAPSHOT=500
DISPLAY=500
TESTINTERVAL=500

# MAXITER=15000
# TESTITER=1500
# SNAPSHOT=5000
# DISPLAY=5000
# TESTINTERVAL=5000

# Print the help menu and then exit.
help()
{
  cat <<EOF

Usage: bash make_init.sh -<flag>
          -h / --help
          -f / --filename [.ini filename, default=$FILENAME]
          -m / --maxiter [max number of iterations, default=$MAXITER]
          -t / --testiter [number of test iters, default=$TESTITER]
          -s / --snapshot [snapshot every N iters, default=$SNAPSHOT]
          -d / --display [display every N iters, default=$DISPLAY]
          -t / --testinterval [test every N iters, default=$TESTINTERVAL]
EOF
}


while [[ $# > 0 ]]
do
  key="$1"
  shift

  case $key in
    -h|--help)
    HELP="YES"
    ;;
    -f|--filename)
    FILENAME="$1"
    shift
    ;;
    -m|--maxiter)
    MAXITER=$1
    shift
    ;;
    -t|--testiter)
    TESTITER=$1
    shift
    ;;
    -s|--snapshot)
    SNAPSHOT=$1
    shift
    ;;
    -d|--display)
    DISPLAY=$1
    shift
    ;;
    -e|--testinterval)
    TESTINTERVAL=$1
    shift
    ;;
    *)    # Unknown option

    ;;
  esac
done

if [[ $HELP == "YES" ]]; then
  help
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
echo "max_iter = $MAXITER" >> $FILENAME
echo "test_iter = $TESTITER" >> $FILENAME
echo "snapshot = $SNAPSHOT" >> $FILENAME
echo "display = $DISPLAY" >> $FILENAME
echo "test_interval = $TESTINTERVAL" >> $FILENAME

echo "...done."
