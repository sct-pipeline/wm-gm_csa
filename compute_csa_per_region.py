from xlrd import open_workbook

wb = open_workbook("/Users/francois/Documents/Neuropoly/results_csa/csa_mean.xls")

sheet = wb.sheets()[0]

for i in range(1, sheet.nrows):
	print "file :", sheet.cell(i,1).value
	print "csa mean :", sheet.cell(i,6).value
	print "csa stdv :", sheet.cell(i,7).value


# for s in wb.sheets():
#     print 'Sheet:',s.name        
#     for row in range(s.nrows):
#         values = []
#         for col in range(s.ncols):
#             values.append(str(s.cell(row,col).value))
#         print ','.join(values)
