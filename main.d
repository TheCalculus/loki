import std.stdio;
import identity;

void handle_connect(char[] action) {
}

void update_config(string what, char[] that) {
}

void update_config(string what, bool that) {
}

void main(char[][] args) {
    if (args.length < 2) {
        writeln("usage: loki <command> <args>");
        return;
    }

    char[] arg;
    for (int i = 1; i < args.length; i++) {
        arg = args[i];

        switch (arg) {
        case "--identity":
            auto action = args[++i];
            handle_identity(action);
            break;

        case "--connect":
            auto dest = args[++i];
            handle_connect(dest);
            break;
        
        case "--public":
            handle_connect(null);
            break;
       
        case "--encrypt":
            auto method = args[++i];
            update_config("CRYPT", method);
            break;
       
        case "--ephemeral":
            update_config("EPHEM", true);
            break;
       
        default:
            writefln("unknown argument \"%s\"", arg);
        }
    }

    return;
}
