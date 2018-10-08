# wm-gm_csa

This pipeline extract cross-sectional area (CSA) in the WM and GM and compute aggregate metrics.

## Dependencies

[SCT v3.2.4](https://github.com/neuropoly/spinalcordtoolbox/releases/tag/v3.2.4) or above.


## File structure

~~~
data
  -subject1/
  -subject2/
    |- tp1/
    |- tp2/
    |- tp3/
        |- t2s_cerv
          |- t2s_cerv_gm.nii.gz
          |- t2s_cerv_wm.nii.gz
        |- t2s_thor
          |- t2s_thor_gm.nii.gz
          |- t2s_thor_wm.nii.gz
        |- t2s_lumb
          |- t2s_lumb_gm.nii.gz
          |- t2s_lumb_gm.nii.gz
~~~
Note : the names of the subfolders (here tp1, tp2...) and subsubfolders (here t2s_cerv, t2s_thor ...) can be anything. The names of the files can be anything too as long as the GM files and the WM files contain in their name a unique tag which can be used to identify them (thus a different tag for GM and for WM files). 


## How to run

- Download (or `git clone`) this repository.
- Edit [parameters.sh](./parameters.sh) according to your needs, then save the file.
- **Process the data:** Compute the csa for GM and WM segmentations.
~~~
./run_process.sh 1_process_data.sh
~~~

- The outputs are:
  - **[subject name]_csa_mean.xls**: each row corresponds to an IRM volume (an entire nifti file) and the csa value is the mean across every slice of the volume (see the documentation on the *sct_process_segmentation -p csa* command of the spinal cord toolbox for more information about how the csa is computed).


## Contributors

François Paugam

## License

The MIT License (MIT)

Copyright (c) 2018 École Polytechnique, Université de Montréal

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
