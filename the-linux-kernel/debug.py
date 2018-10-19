import sys

outputFile = open("output.txt", "w")

class LogBP(gdb.Breakpoint):
    def stop(self):
        msg, is_field = gdb.lookup_symbol("msg")
        if msg is not None:
            outputFile.write(msg.value(gdb.newest_frame()).string())
        else:
            gdb.write("Error: Symbol msg not found\n")

logBP = LogBP("gdb_log", gdb.BP_BREAKPOINT)

def exit_handler(event):
    gdb.write("Exited. output.txt saved.")
    outputFile.close()

gdb.events.exited.connect(exit_handler)

for bp in gdb.breakpoints():
    gdb.write(bp.location)
    gdb.write("\n")

