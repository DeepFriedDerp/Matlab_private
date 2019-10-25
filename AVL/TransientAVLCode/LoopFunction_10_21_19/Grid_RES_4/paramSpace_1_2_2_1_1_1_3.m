function [aeroForces] = paramSpace_1_2_2_1_1_1_3(sailStates,airStates)

	CL = (5.062510)*sailStates.alpha + (-0.243056)*sailStates.beta + (-3.550963)*sailStates.p + (50.229370)*sailStates.q + (-3.160363)*sailStates.r + (0.012650)*sailStates.de;
	CD = -1.877350;
	CY = (-0.565701)*sailStates.alpha + (-0.023875)*sailStates.beta + (-1.101791)*sailStates.p + (-1.002334)*sailStates.q + (-0.219124)*sailStates.r + (-0.000216)*sailStates.de;

	Cl = (1.149510)*sailStates.alpha + (0.517747)*sailStates.beta + (-1.962527)*sailStates.p + (18.850929)*sailStates.q + (-2.712096)*sailStates.r + (0.001638)*sailStates.de;
	Cm = (-8.429821)*sailStates.alpha + (0.925499)*sailStates.beta + (10.015306)*sailStates.p + (-161.102386)*sailStates.q + (10.510053)*sailStates.r + (-0.070558)*sailStates.de;
	Cn = (1.868425)*sailStates.alpha + (0.116703)*sailStates.beta + (2.187001)*sailStates.p + (-7.561487)*sailStates.q + (-0.026915)*sailStates.r + (0.000058)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end