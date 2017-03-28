'''
Most lines in the feature-calling output TSV files have 141 tabs (142 fields)
of data - but occasionally lines have 142 tabs due to a final optional error
field, causing database loading to error.

This script is intended to read the .tsv output from the feature extractors

usage: python process_tsv.py <file> <option>

options:
    o - process and output <file> to STDOUT
    s - output structure of <file> to STDOUT
    h - otput the processed header line of <file> to STDOUT
    t - (testing only)

example: python process_tsv.py foo.tsv o > ready_for_postgres.tsv

'''

import sys
import numpy as np


class filereader(object):
    def __init__(self):
        self.filename = sys.argv[1]
        self.option = sys.argv[2]
        self.has_header = True
        self.max_fields = 142  # should cut off terminal error field
        self.num_type = 'DOUBLE PRECISION'
        self.char_type = 'VARCHAR'

        self.num_tabs = self.count_tabs()
        self.fields = self.init_fields(self.num_tabs + 1)
        self.process_file()

        if self.option == 'o':
            # output processed input file to STDOUT
            self.output_file()
        elif self.option == 's':
            # output file structure details to STDOUT
            print "Field structure of all fields in input file:\n"
            print "Number of tabs: {}".format(self.num_tabs) + '\n'
            print "Database-ready list of fields:\n"
            print self.output_structure()
        elif self.option == 'h':
            # output header row only to STDOUT
            print self.output_header()
        elif self.option == 't':
            # for testing - dumps self.fields to STDOUT
            self.showme()
        else:
            # print help message
            print 'usage: python process_tsv.py <file> [o|s|h|t]'

    def init_fields(self, n):
        '''
        takes an argument n=(maximum number of tab-delimited fields in file)
        initializes 2d array of field metadata
          (is_numeric, length, processed_name)
        processed field names are added later
        '''
        field_list = []
        for i in xrange(n):
            field_list.append([True, 100])
        return field_list

    def is_number(self, field):
        '''
        takes a string
        returns True if string can be cast to a number; False if not
        (empty strings count as True in this case)
        '''
        if field == '':
            return True
        else:
            try:
                float(field)
                return True
            except ValueError:
                return False

    def count_tabs(self):
        '''
        takes a filename (including path)
        returns the highest number of tabs found on a line in the file
        '''
        with open(self.filename) as f:
            tablist = []
            for line in f:
                tablist.append(line.count('\t'))
        return max(tablist)

    def init_header(self, header_list):
        '''
        takes a list of field names
        writes corrected field names into the self.fields 2d array
        does not return a value
        '''
        out = []
        for i, header in enumerate(header_list):
            for ch in ['.', '-']:
                header = header.replace(ch, '_')
            self.fields[i].append(header)
        return

    def showme(self):
        '''
        simple debug check: dumps fields array to STDOUT
        '''
        for f in self.fields:
            print f

    def process_file(self):
        '''
        takes a filename (inc. path if needed)
        reads and processes headers if self.has_header = True
        reads every field and determines if it is numeric
        returns nothing, but initializes the self.fields 2d array
        '''
        with open(self.filename) as f:
            for i, line in enumerate(f):
                flds = line.strip().split('\t')
                if self.has_header and i == 0:
                    self.init_header(flds)
                else:
                    for i, field in enumerate(flds):
                        if self.is_number(field) is False:
                            self.fields[i][0] = False

    def output_header(self):
        '''
        takes no arguments - reads from self.fields
        returns a string of tab-delimited field names
        all field names have been processed to remove illegal chars
        '''
        arr = np.array(self.fields)
        head_list = arr[:, 2]
        return '\t'.join(head_list[:self.max_fields])

    def output_file(self):
        '''
        takes no arguments - reads from self.filename
        prints tab-delimited lines to STDOUT
        number of fields to print = self.max_fields
        header line printed if self.has_header = True
        '''
        with open(self.filename) as f:
            for i, line in enumerate(f):
                if i == 0:
                    print self.output_header()
                else:
                    fld_arr = line.strip().split('\t')
                    if fld_arr[141] != 'no json data file':
                        print '\t'.join(fld_arr[:self.max_fields])

    def output_structure(self):
        '''
        takes no arguments - reads from self.fields
        returns details of the table structure needed to store
        this file in PostgreSQL
        use this output to build the CREATE TABLE command
        '''
        struc = []
        for i, flist in enumerate(self.fields):
            if flist[0] is True:
                # numeric
                data_type = self.num_type
            else:
                data_type = '{}({})'.format(self.char_type, flist[1])
            # errors if number of field names in the header is
            # less than number of fields
            struc.append('\t{} {}'.format(flist[2], data_type))
        return ',\n'.join(struc) + '\n'


if __name__ == '__main__':
    filereader()
