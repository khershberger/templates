#!/usr/local/bin/python3

import argparse

def parse_arguments():
    # Parse any command line arguments
    parser = argparse.ArgumentParser(description='Description Text')

    # Optional argument with optional value
    # Has different defautls for if:
    #  Argument not used:     uses default (0.0)
    #  Argument provided without value:    uses const?  (1.0)
    parser.add_argument('--argname1', type=float, const=1.0, default=0.0, nargs='?',
            help='Help text for argname1')
    parser.add_argument('--argname2', action='store_true',
            help='Sets value in args dict to True')
    parser.add_argument('--argint', type=int,
            help='Argument with integer parameter')
    parser.add_argument('--reset', action='store_true',
            help='Sets value for reset key to True')
    parser.add_argument('positional')
    parser.add_argument('optional', nargs='?', default='default_value')


    # Parse the arguments and store resulting dict in args
    args = parser.parse_args()

    return args

def main():
    args = parse_arguments()

    if args.reset:
        print('Resetting something...')
        reset_sensor()

    if args.argname1:
        print('Value of argname1 is {:g}'.format(args.poll))

    return 0

if __name__ == "__main__":
    main()
