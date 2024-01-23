import configparser
import os

def merge_ini_files(output_file, *input_files):
    config = configparser.ConfigParser()

    for input_file in input_files:
        config.read(input_file)

    with open(output_file, 'w') as output:
        config.write(output)


if __name__ == "__main__":
    directory_path = os.path.join(os.path.expanduser('~'), ".config", "polybar")
    num = 1
    print("Options: ")
    for filename in os.listdir(directory_path):
        if os.path.isfile(os.path.join(directory_path, filename)) and "Colors" in filename:
            print(str(num) + '. ' + filename)
            num += 1 
    try:
        file1 = 'Colors'+input("ConfigFile: Colors")
        if not ".ini" in file1:
            file1 = file1 + ".ini"
        file1 = os.path.join(directory_path, file1)
        merge_ini_files(os.path.join(directory_path, 'configMerged.ini'), file1, os.path.join(directory_path, 'config.ini'))
    except:
        pass
