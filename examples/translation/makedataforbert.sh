#!/usr/bin/env bash
lng=$1
echo "src lng $lng"
for sub  in train valid test
do
    sed -r 's/(@@ )|(@@ ?$)//g' ${sub}.${lng} > ${sub}.bert.${lng}.tok
    /kaggle/working/bert-nmt/examples/translation/mosesdecoder/scripts/tokenizer/detokenizer.perl $lng < ${sub}.bert.${lng}.tok > ${sub}.bert.${lng}
    rm ${sub}.bert.${lng}.tok
done
