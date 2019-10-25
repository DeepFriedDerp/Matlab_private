function [aeroForces] = paramSpace_3_1_3_2_2_3_2(sailStates,airStates)

	CL = (4.531509)*sailStates.alpha + (0.315194)*sailStates.beta + (-2.573334)*sailStates.p + (35.918762)*sailStates.q + (1.344481)*sailStates.r + (0.011100)*sailStates.de;
	CD = -0.479110;
	CY = (0.000000)*sailStates.alpha + (-0.024786)*sailStates.beta + (0.559311)*sailStates.p + (-0.000002)*sailStates.q + (-0.036659)*sailStates.r + (0.000000)*sailStates.de;

	Cl = (1.458089)*sailStates.alpha + (-0.188980)*sailStates.beta + (-1.255960)*sailStates.p + (10.635622)*sailStates.q + (1.186247)*sailStates.r + (0.000468)*sailStates.de;
	Cm = (-13.974816)*sailStates.alpha + (-1.242016)*sailStates.beta + (8.464146)*sailStates.p + (-136.150452)*sailStates.q + (-4.567430)*sailStates.r + (-0.069002)*sailStates.de;
	Cn = (0.089271)*sailStates.alpha + (0.019360)*sailStates.beta + (-1.179505)*sailStates.p + (5.061280)*sailStates.q + (0.004910)*sailStates.r + (0.000094)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end