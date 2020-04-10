# coding: utf-8
import pyknp
import re

# KNP prepairing
knp = pyknp.KNP(option="-tab -dpnd", jumanpp=False)

def make_np_tagged_text(src_text: str):
    tagged_text = src_text # copy
    result = knp.parse(src_text) # tagging

    for tag in result.tag_list():
        if "NE:" in tag.fstring: # if fstring has NE phrase
            # extract NE phrase
            tagged_ne_phrase = re.search("<NE:(.*):(.*)>", tag.fstring).group(0)
            ne_phrase = re.search("<NE:(.*):(.*)>", tag.fstring).group(2)

            # overwrite to src text
            tagged_text = tagged_text.replace(ne_phrase, tagged_ne_phrase)

    return tagged_text

def main():
    line = "太郎は5月18日の朝9時に花子に会いに行った．"

    print(line)
    print(make_np_tagged_text(line))

if __name__ == "__main__":
    main()
