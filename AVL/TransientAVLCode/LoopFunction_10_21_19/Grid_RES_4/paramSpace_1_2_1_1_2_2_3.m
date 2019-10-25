function [aeroForces] = paramSpace_1_2_1_1_2_2_3(sailStates,airStates)

	CL = (3.456275)*sailStates.alpha + (-0.094987)*sailStates.beta + (-3.330968)*sailStates.p + (42.620743)*sailStates.q + (-1.343912)*sailStates.r + (0.010950)*sailStates.de;
	CD = 0.114970;
	CY = (-0.046863)*sailStates.alpha + (-0.025749)*sailStates.beta + (-0.348936)*sailStates.p + (0.662188)*sailStates.q + (-0.069479)*sailStates.r + (0.000143)*sailStates.de;

	Cl = (1.332114)*sailStates.alpha + (0.114790)*sailStates.beta + (-1.877753)*sailStates.p + (16.845613)*sailStates.q + (-0.997568)*sailStates.r + (0.001522)*sailStates.de;
	Cm = (-12.256320)*sailStates.alpha + (0.368176)*sailStates.beta + (10.906543)*sailStates.p + (-158.727341)*sailStates.q + (4.540052)*sailStates.r + (-0.070277)*sailStates.de;
	Cn = (0.559136)*sailStates.alpha + (0.027865)*sailStates.beta + (0.419017)*sailStates.p + (-0.831325)*sailStates.q + (-0.040962)*sailStates.r + (-0.000213)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end