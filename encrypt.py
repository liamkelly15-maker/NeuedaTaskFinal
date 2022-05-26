# Neueda Task Python script.
# See PyCharm help at https://www.jetbrains.com/help/pycharm/

import json
from cryptography.fernet import Fernet
from json2xml import json2xml
from json2xml.utils import readfromstring

# Opening JSON file
#f = open("./data/json_file.json", "r")
f = open("$(inputfileloc)/json_file.json", "r")

# returns JSON object as a dictionary
data = json.load(f)
#convert dict to string
data2= json.dumps(data)
data3 = readfromstring(data2)
#convert the string to xml and write to file on namedvolume /outputdata
#with open("./outputdata/json_to_xml.xml", "w") as f:
with open("${outputfileloc}/json_to_xml.xml", "w") as f:
    f.write(json2xml.Json2xml(data3).to_xml())

def write_key():
    """Generates a key and save it into a file on named volume /outputdata"""
    key = Fernet.generate_key()
    #with open("./outputdata/key.key", "wb") as key_file:
    with open("${outputfileloc}/key.key", "wb") as key_file:
        key_file.write(key)

def load_key():
    """Loads the key from the named volume /outputdata named `key.key`"""
    #return open("./outputdata/key.key", "rb").read()
    return open("${outputfileloc}/key.key", "rb").read()

def encrypt(filename, key):
    """Given a filename (str or xml) and key (bytes), it encrypts the file and write it"""
    f = Fernet(key)
    with open(filename, "rb") as file:
        # read all file data
        file_data = file.read()
        # encrypt data
        encrypted_data = f.encrypt(file_data)
        # write the encrypted file
        with open(filename, "wb") as file:
            file.write(encrypted_data)


#generate the key
write_key()
#load the key
key = load_key()
#check the key
#print(key)
# file name
#file = "./outputdata/json_to_xml.xml"
file = "$outputfileloc/json_to_xml.xml"
# encrypt it
encrypt(file, key)


#the json file could now be deleted

#the json file could now be deleted