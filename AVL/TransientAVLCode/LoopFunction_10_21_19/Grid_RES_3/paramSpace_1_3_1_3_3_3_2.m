function [aeroForces] = paramSpace_1_3_1_3_3_3_2(sailStates,airStates)

	CL = (3.875604)*sailStates.alpha + (0.065940)*sailStates.beta + (-2.427402)*sailStates.p + (33.060448)*sailStates.q + (-0.352967)*sailStates.r + (0.010089)*sailStates.de;
	CD = -0.022270;
	CY = (0.059828)*sailStates.alpha + (-0.023471)*sailStates.beta + (0.009564)*sailStates.p + (0.491627)*sailStates.q + (0.001640)*sailStates.r + (0.000104)*sailStates.de;

	Cl = (1.128439)*sailStates.alpha + (-0.005555)*sailStates.beta + (-1.101833)*sailStates.p + (8.768851)*sailStates.q + (-0.115171)*sailStates.r + (0.000188)*sailStates.de;
	Cm = (-14.223596)*sailStates.alpha + (-0.271104)*sailStates.beta + (8.483705)*sailStates.p + (-133.990982)*sailStates.q + (1.238623)*sailStates.r + (-0.067390)*sailStates.de;
	Cn = (0.133364)*sailStates.alpha + (-0.001728)*sailStates.beta + (-0.217332)*sailStates.p + (1.275819)*sailStates.q + (-0.024488)*sailStates.r + (-0.000103)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end