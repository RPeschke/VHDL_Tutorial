This includes the entire project directory, but you should be able to get the pure source code itself from the src/ subdirectory for a cleaner archiving/repository.

Note also that ToggleCounterShiftReg doesn't quite do what it was intended to do (specifically, the generic parameter included in it doesn't change the rate of the toggling output)... a nice exercise to the student is to fix it and verify that you can use it to generate a ~1 Hz output signal.

