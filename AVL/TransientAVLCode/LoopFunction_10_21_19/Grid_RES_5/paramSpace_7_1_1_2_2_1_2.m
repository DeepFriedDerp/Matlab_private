function [aeroForces] = paramSpace_7_1_1_2_2_1_2(sailStates,airStates)

	CL = (4.277245)*sailStates.alpha + (0.000000)*sailStates.beta + (-2.796808)*sailStates.p + (37.074253)*sailStates.q + (-0.850443)*sailStates.r + (0.011249)*sailStates.de;
	CD = -0.155550;
	CY = (0.020985)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.388178)*sailStates.p + (0.438543)*sailStates.q + (-0.013602)*sailStates.r + (0.000095)*sailStates.de;

	Cl = (1.449356)*sailStates.alpha + (0.176338)*sailStates.beta + (-1.389540)*sailStates.p + (11.501821)*sailStates.q + (-0.760512)*sailStates.r + (0.000625)*sailStates.de;
	Cm = (-14.639176)*sailStates.alpha + (-0.000000)*sailStates.beta + (9.445432)*sailStates.p + (-143.320496)*sailStates.q + (2.916013)*sailStates.r + (-0.071014)*sailStates.de;
	Cn = (-0.004917)*sailStates.alpha + (0.006158)*sailStates.beta + (0.796881)*sailStates.p + (-3.660695)*sailStates.q + (0.002731)*sailStates.r + (-0.000176)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end