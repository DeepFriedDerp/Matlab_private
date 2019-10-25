function [aeroForces] = paramSpace_1_4_2_3_3_2_3(sailStates,airStates)

	CL = (3.831204)*sailStates.alpha + (0.245850)*sailStates.beta + (-2.697124)*sailStates.p + (37.255329)*sailStates.q + (-1.209491)*sailStates.r + (0.010552)*sailStates.de;
	CD = 0.059620;
	CY = (0.050514)*sailStates.alpha + (-0.022537)*sailStates.beta + (-0.335955)*sailStates.p + (0.684400)*sailStates.q + (-0.066850)*sailStates.r + (0.000145)*sailStates.de;

	Cl = (1.269928)*sailStates.alpha + (0.219074)*sailStates.beta + (-1.303639)*sailStates.p + (11.245781)*sailStates.q + (-0.860006)*sailStates.r + (0.000497)*sailStates.de;
	Cm = (-13.318624)*sailStates.alpha + (-0.905378)*sailStates.beta + (8.746150)*sailStates.p + (-140.146637)*sailStates.q + (4.054316)*sailStates.r + (-0.067302)*sailStates.de;
	Cn = (0.133586)*sailStates.alpha + (0.028639)*sailStates.beta + (0.514153)*sailStates.p + (-1.964401)*sailStates.q + (-0.017205)*sailStates.r + (-0.000231)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end