function [aeroForces] = paramSpace_2_3_3_1_3_3_3(sailStates,airStates)

	CL = (5.152737)*sailStates.alpha + (-0.127678)*sailStates.beta + (-3.376497)*sailStates.p + (39.562706)*sailStates.q + (1.335079)*sailStates.r + (0.010970)*sailStates.de;
	CD = -1.702740;
	CY = (0.476608)*sailStates.alpha + (-0.024361)*sailStates.beta + (0.672287)*sailStates.p + (1.915491)*sailStates.q + (0.044131)*sailStates.r + (0.000419)*sailStates.de;

	Cl = (1.296021)*sailStates.alpha + (-0.441493)*sailStates.beta + (-1.885546)*sailStates.p + (15.618198)*sailStates.q + (1.407580)*sailStates.r + (0.001446)*sailStates.de;
	Cm = (-13.388673)*sailStates.alpha + (0.530179)*sailStates.beta + (12.011229)*sailStates.p + (-160.694275)*sailStates.q + (-4.565499)*sailStates.r + (-0.072651)*sailStates.de;
	Cn = (-0.947150)*sailStates.alpha + (-0.026522)*sailStates.beta + (-1.677528)*sailStates.p + (6.610193)*sailStates.q + (-0.009758)*sailStates.r + (-0.000394)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end