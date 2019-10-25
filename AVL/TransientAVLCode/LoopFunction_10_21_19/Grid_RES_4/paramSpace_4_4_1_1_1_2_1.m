function [aeroForces] = paramSpace_4_4_1_1_1_2_1(sailStates,airStates)

	CL = (3.805370)*sailStates.alpha + (-0.185835)*sailStates.beta + (-1.560622)*sailStates.p + (27.951977)*sailStates.q + (1.051520)*sailStates.r + (0.010214)*sailStates.de;
	CD = -0.044800;
	CY = (-0.266301)*sailStates.alpha + (-0.021908)*sailStates.beta + (0.358141)*sailStates.p + (-1.002334)*sailStates.q + (-0.071131)*sailStates.r + (-0.000207)*sailStates.de;

	Cl = (0.645063)*sailStates.alpha + (-0.195743)*sailStates.beta + (-0.377314)*sailStates.p + (2.583792)*sailStates.q + (0.698120)*sailStates.r + (-0.001005)*sailStates.de;
	Cm = (-12.720197)*sailStates.alpha + (0.578494)*sailStates.beta + (4.798884)*sailStates.p + (-107.565659)*sailStates.q + (-3.466116)*sailStates.r + (-0.064308)*sailStates.de;
	Cn = (0.766593)*sailStates.alpha + (0.022265)*sailStates.beta + (-0.761311)*sailStates.p + (4.390670)*sailStates.q + (0.027058)*sailStates.r + (0.000326)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end