database -open -shm -into waves.shm waves
probe -create -database waves tb -all -dynamic -depth all
run
