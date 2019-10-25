function [aeroForces] = paramSpace_3_2_1_3_1_3_2(sailStates,airStates)

	CL = (4.409625)*sailStates.alpha + (0.069234)*sailStates.beta + (-2.579045)*sailStates.p + (35.752522)*sailStates.q + (1.102972)*sailStates.r + (0.011243)*sailStates.de;
	CD = -0.232330;
	CY = (-0.063700)*sailStates.alpha + (-0.025101)*sailStates.beta + (0.442027)*sailStates.p + (-0.498142)*sailStates.q + (-0.028919)*sailStates.r + (-0.000107)*sailStates.de;

	Cl = (1.439754)*sailStates.alpha + (-0.176707)*sailStates.beta + (-1.226812)*sailStates.p + (10.202274)*sailStates.q + (0.910586)*sailStates.r + (0.000376)*sailStates.de;
	Cm = (-14.633228)*sailStates.alpha + (-0.235666)*sailStates.beta + (8.559443)*sailStates.p + (-136.960373)*sailStates.q + (-3.700704)*sailStates.r + (-0.070040)*sailStates.de;
	Cn = (0.148180)*sailStates.alpha + (0.013502)*sailStates.beta + (-0.925280)*sailStates.p + (4.465664)*sailStates.q + (0.005903)*sailStates.r + (0.000238)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end