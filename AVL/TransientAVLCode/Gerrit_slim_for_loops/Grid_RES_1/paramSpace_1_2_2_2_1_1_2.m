function [aeroForces] = paramSpace_1_2_2_2_1_1_2(sailStates,airStates)

	CL = (7.475277)*sailStates.alpha + (-0.529857)*sailStates.beta + (-2.565659)*sailStates.p + (29.634640)*sailStates.q + (0.320990)*sailStates.r + (0.008910)*sailStates.de;
	CD = -4.503370;
	CY = (1.799326)*sailStates.alpha + (-0.005879)*sailStates.beta + (-0.192608)*sailStates.p + (14.660915)*sailStates.q + (-0.021204)*sailStates.r + (0.003122)*sailStates.de;

	Cl = (-1.699274)*sailStates.alpha + (-0.509137)*sailStates.beta + (-1.355826)*sailStates.p + (11.123240)*sailStates.q + (0.974192)*sailStates.r + (0.000329)*sailStates.de;
	Cm = (-13.153543)*sailStates.alpha + (2.590386)*sailStates.beta + (9.260376)*sailStates.p + (-137.871292)*sailStates.q + (-1.340819)*sailStates.r + (-0.068380)*sailStates.de;
	Cn = (-1.861572)*sailStates.alpha + (-0.072980)*sailStates.beta + (-0.139100)*sailStates.p + (-9.997856)*sailStates.q + (0.124710)*sailStates.r + (-0.004163)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end