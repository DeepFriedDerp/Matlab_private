function [aeroForces] = paramSpace_2_1_1_2_2_2_2(sailStates,airStates)

	CL = (3.968453)*sailStates.alpha + (-0.101187)*sailStates.beta + (-2.546763)*sailStates.p + (34.727554)*sailStates.q + (-0.343970)*sailStates.r + (0.010828)*sailStates.de;
	CD = 0.043690;
	CY = (-0.000000)*sailStates.alpha + (-0.024786)*sailStates.beta + (-0.097324)*sailStates.p + (-0.000000)*sailStates.q + (-0.006379)*sailStates.r + (-0.000000)*sailStates.de;

	Cl = (1.310227)*sailStates.alpha + (0.025020)*sailStates.beta + (-1.247508)*sailStates.p + (10.317527)*sailStates.q + (-0.265881)*sailStates.r + (0.000468)*sailStates.de;
	Cm = (-14.366552)*sailStates.alpha + (0.455166)*sailStates.beta + (8.685049)*sailStates.p + (-136.150452)*sailStates.q + (1.197089)*sailStates.r + (-0.069002)*sailStates.de;
	Cn = (0.053846)*sailStates.alpha + (0.002679)*sailStates.beta + (0.130752)*sailStates.p + (-0.208094)*sailStates.q + (-0.003770)*sailStates.r + (0.000006)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end