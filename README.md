# whisper post-process

whisper-postprocess is a tool to post-process whisper output file.

- simplify text format
- remove duplicate cues

## Usage

```sh
cat ${whisper_output_file} | ruby main.rb > ${output_file}
```
