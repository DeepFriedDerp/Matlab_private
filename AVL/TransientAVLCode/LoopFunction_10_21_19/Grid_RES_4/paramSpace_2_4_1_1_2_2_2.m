function [aeroForces] = paramSpace_2_4_1_1_2_2_2(sailStates,airStates)

	CL = (3.968453)*sailStates.alpha + (0.101187)*sailStates.beta + (-2.546763)*sailStates.p + (34.727554)*sailStates.q + (-0.343970)*sailStates.r + (0.010828)*sailStates.de;
	CD = 0.043690;
	CY = (-0.000000)*sailStates.alpha + (-0.024786)*sailStates.beta + (-0.097324)*sailStates.p + (-0.000000)*sailStates.q + (-0.006379)*sailStates.r + (-0.000000)*sailStates.de;

	Cl = (1.161819)*sailStates.alpha + (0.069799)*sailStates.beta + (-1.149820)*sailStates.p + (9.108969)*sailStates.q + (-0.259351)*sailStates.r + (0.000209)*sailStates.de;
	Cm = (-14.366552)*sailStates.alpha + (-0.455166)*sailStates.beta + (8.685049)*sailStates.p + (-136.150452)*sailStates.q + (1.197089)*sailStates.r + (-0.069002)*sailStates.de;
	Cn = (0.031361)*sailStates.alpha + (0.003536)*sailStates.beta + (0.137155)*sailStates.p + (-0.287307)*sailStates.q + (-0.003342)*sailStates.r + (0.000006)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end