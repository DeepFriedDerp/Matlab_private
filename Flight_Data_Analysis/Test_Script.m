filename = './Ground_Station_Data/uniqueGPS.txt'
fileExist = exist(filename)
fileID = fopen(filename,'r')
derp = fgetl(fileID)