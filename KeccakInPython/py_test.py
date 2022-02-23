
def appendBit(M, bit):
        """Append a bit to M

        M: message pair (length in bits, string of hex characters ('9AFC...'))
        bit: 0 or 1
        Example: appendBit([7, '30'],1) returns [8,'B0']
        Example: appendBit([8, '30'],1) returns [9,'3001']
        """
        [my_string_length, my_string]=M
        if my_string_length>(len(my_string)//2*8):
            print("the string is too short to contain the number of bits announced")
            return
        if ((my_string_length%8) == 0):
            my_string = my_string[0:my_string_length//8*2] + "%02X" % bit
            my_string_length = my_string_length + 1
        else:
            nr_bytes_filled = my_string_length//8
            nbr_bits_filled = my_string_length%8
            my_byte = int(my_string[nr_bytes_filled*2:nr_bytes_filled*2+2],16)
            my_byte = my_byte + bit*(2**(nbr_bits_filled))
            my_byte = "%02X" % my_byte
            my_string = my_string[0:nr_bytes_filled*2] + my_byte
            my_string_length = my_string_length + 1
        return [my_string_length, my_string]

def appendDelimitedSuffix( M, suffix):
        """Append a delimited suffix to M

        M: message pair (length in bits, string of hex characters ('9AFC...'))
        suffix: integer coding a string of 0 to 7 bits, from LSB to MSB, delimited by a bit 1 at MSB
        Example: appendDelimitedSuffix([3, '00'], 0x06) returns [5, '10']
        Example: appendDelimitedSuffix([3, '00'], 0x1F) returns [7, '78']
        Example: appendDelimitedSuffix([8, '00'], 0x06) returns [10, '0002']
        Example: appendDelimitedSuffix([8, '00'], 0x1F) returns [12, '000F']
        """
        if (suffix == 0):
            print("the delimited suffix must not be zero")
            exit()
        while(suffix != 1):
            M = appendBit(M, suffix%2)
            suffix = suffix//2
        return M

# print(appendDelimitedSuffix([7, '30'],0x1f))



# myKeccak=Keccak.Keccak()

# print(0x1f)

# print("Keccak with '%s' suffix" % (myKeccak.delimitedSuffixInBinary(0x01) ))



# import Keccak

# #String comparison function (useful later to compare test vector and computation
# def sameString(string1, string2):
#     """Compare 2 strings"""

#     if len(string1)!=len(string2):
#         return False
#     for i in range(len(string1)):
#         if string1[i]!=string2[i]:
#             return False
#     return True

# #Create an instance
# myKeccak=Keccak.Keccak()

# Len = 24
# Msg = '1F877C'
# MD_ref = '627D7BC1491B2AB127282827B8DE2D276B13D7D70FB4C5957FDF20655BC7AC30'
# r   = 1088
# c   = 512
# delimitedSuffix = 0x01
# n   = 256
# verbose = False

# # Perform our own computation
# MD_comp=myKeccak.Keccak((Len,Msg), r, c, delimitedSuffix, n, verbose)

# #Compare the results
# if not sameString(MD_comp,MD_ref):
#     print('ERROR: \n\t length=%d\n\t message=%s\n\t reference=%s\n\t computed=%s' % (Len, Msg, MD_ref, MD_comp))
#     exit()

# print("OK\n")

r=  [[0,    36,     3,    41,    18]    ,
    [1,    44,    10,    45,     2]    ,
    [62,    6,    43,    15,    61]    ,
    [28,   55,    25,    21,    56]    ,
    [27,   20,    39,     8,    14]    ]

for i in range(5):
    # for j in range(5):
        print(r[i])