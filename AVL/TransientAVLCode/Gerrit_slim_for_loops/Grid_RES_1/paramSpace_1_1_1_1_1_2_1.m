function [aeroForces] = paramSpace_1_1_1_1_1_2_1(sailStates,airStates)

	CL = (8.293010)*sailStates.alpha + (-0.738051)*sailStates.beta + (-2.311428)*sailStates.p + (38.033028)*sailStates.q + (-3.432640)*sailStates.r + (0.011512)*sailStates.de;
	CD = -3.195930;
	CY = (0.574164)*sailStates.alpha + (-0.031298)*sailStates.beta + (-1.581088)*sailStates.p + (2.783909)*sailStates.q + (-0.208351)*sailStates.r + (0.000588)*sailStates.de;

	Cl = (3.595057)*sailStates.alpha + (0.450163)*sailStates.beta + (-1.021697)*sailStates.p + (9.826604)*sailStates.q + (-2.982253)*sailStates.r + (0.000006)*sailStates.de;
	Cm = (-14.799613)*sailStates.alpha + (2.831752)*sailStates.beta + (6.051068)*sailStates.p + (-125.563454)*sailStates.q + (11.499786)*sailStates.r + (-0.067179)*sailStates.de;
	Cn = (-1.283569)*sailStates.alpha + (0.102995)*sailStates.beta + (3.363190)*sailStates.p + (-16.827188)*sailStates.q + (0.067976)*sailStates.r + (-0.001033)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end