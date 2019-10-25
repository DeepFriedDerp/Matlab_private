function [aeroForces] = paramSpace_1_1_1_1_1_2_2(sailStates,airStates)

	CL = (3.599004)*sailStates.alpha + (-0.100264)*sailStates.beta + (-3.155377)*sailStates.p + (40.598240)*sailStates.q + (-0.992168)*sailStates.r + (0.010943)*sailStates.de;
	CD = 0.101840;
	CY = (-0.066416)*sailStates.alpha + (-0.024875)*sailStates.beta + (-0.208124)*sailStates.p + (-0.059704)*sailStates.q + (-0.036692)*sailStates.r + (-0.000013)*sailStates.de;

	Cl = (1.323407)*sailStates.alpha + (0.073808)*sailStates.beta + (-1.730245)*sailStates.p + (15.162855)*sailStates.q + (-0.721324)*sailStates.r + (0.001285)*sailStates.de;
	Cm = (-12.929382)*sailStates.alpha + (0.395937)*sailStates.beta + (10.541121)*sailStates.p + (-153.914749)*sailStates.q + (3.378092)*sailStates.r + (-0.070132)*sailStates.de;
	Cn = (0.400070)*sailStates.alpha + (0.016199)*sailStates.beta + (0.184701)*sailStates.p + (0.445590)*sailStates.q + (-0.041055)*sailStates.r + (0.000012)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end