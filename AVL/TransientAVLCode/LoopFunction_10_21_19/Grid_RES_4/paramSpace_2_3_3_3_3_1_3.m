function [aeroForces] = paramSpace_2_3_3_3_3_1_3(sailStates,airStates)

	CL = (4.380661)*sailStates.alpha + (0.078069)*sailStates.beta + (-2.839042)*sailStates.p + (37.877476)*sailStates.q + (-1.145722)*sailStates.r + (0.011342)*sailStates.de;
	CD = -0.245410;
	CY = (0.021573)*sailStates.alpha + (-0.024795)*sailStates.beta + (-0.467516)*sailStates.p + (0.563441)*sailStates.q + (-0.030623)*sailStates.r + (0.000122)*sailStates.de;

	Cl = (1.489115)*sailStates.alpha + (0.235893)*sailStates.beta + (-1.406629)*sailStates.p + (11.771842)*sailStates.q + (-0.960230)*sailStates.r + (0.000634)*sailStates.de;
	Cm = (-14.464700)*sailStates.alpha + (-0.286735)*sailStates.beta + (9.424965)*sailStates.p + (-144.107040)*sailStates.q + (3.864304)*sailStates.r + (-0.070783)*sailStates.de;
	Cn = (0.033505)*sailStates.alpha + (0.013400)*sailStates.beta + (0.957183)*sailStates.p + (-4.521152)*sailStates.q + (0.005791)*sailStates.r + (-0.000254)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end