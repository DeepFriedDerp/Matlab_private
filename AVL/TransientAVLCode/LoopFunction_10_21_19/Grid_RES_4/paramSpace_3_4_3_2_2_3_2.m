function [aeroForces] = paramSpace_3_4_3_2_2_3_2(sailStates,airStates)

	CL = (4.531509)*sailStates.alpha + (-0.315194)*sailStates.beta + (-2.573334)*sailStates.p + (35.918762)*sailStates.q + (1.344481)*sailStates.r + (0.011100)*sailStates.de;
	CD = -0.479110;
	CY = (0.000000)*sailStates.alpha + (-0.024786)*sailStates.beta + (0.559311)*sailStates.p + (-0.000002)*sailStates.q + (-0.036659)*sailStates.r + (0.000000)*sailStates.de;

	Cl = (1.313507)*sailStates.alpha + (-0.364129)*sailStates.beta + (-1.158267)*sailStates.p + (9.427064)*sailStates.q + (1.179801)*sailStates.r + (0.000209)*sailStates.de;
	Cm = (-13.974816)*sailStates.alpha + (1.242016)*sailStates.beta + (8.464146)*sailStates.p + (-136.150452)*sailStates.q + (-4.567430)*sailStates.r + (-0.069002)*sailStates.de;
	Cn = (0.172066)*sailStates.alpha + (0.016893)*sailStates.beta + (-1.185908)*sailStates.p + (5.140493)*sailStates.q + (0.005332)*sailStates.r + (0.000094)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end