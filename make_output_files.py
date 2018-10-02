from xlrd import open_workbook
from xlutils.copy import copy
import sys

rb = open_workbook(sys.argv[1])
wb = copy(rb)

rs = rb.sheets()[0]
ws = wb.get_sheet(0)


ws.write(0, 4, "subfolder")
ws.write(0, 5, "subsubfolder")



for i in range(1, rs.nrows):
	file_path = rs.cell(i,1).value
	subfolder = file_path.split("/")[-3]
	subsubfolder = file_path.split("/")[-2]
	ws.write(i, 4, subfolder)
	ws.write(i, 5, subsubfolder)

subject = file_path.split("/")[-4]

output_path = sys.argv[1].replace("csa_mean.xls", subject+"_csa_mean.xls")

wb.save(output_path)

