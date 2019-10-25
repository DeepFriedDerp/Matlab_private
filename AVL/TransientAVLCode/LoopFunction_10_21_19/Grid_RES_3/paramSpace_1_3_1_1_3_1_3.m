function [aeroForces] = paramSpace_1_3_1_1_3_1_3(sailStates,airStates)

	CL = (7.492126)*sailStates.alpha + (0.742512)*sailStates.beta + (-3.452285)*sailStates.p + (49.609753)*sailStates.q + (-3.868689)*sailStates.r + (0.012350)*sailStates.de;
	CD = -3.120510;
	CY = (-0.262623)*sailStates.alpha + (-0.018576)*sailStates.beta + (-1.613527)*sailStates.p + (2.260752)*sailStates.q + (-0.284723)*sailStates.r + (0.000485)*sailStates.de;

	Cl = (3.160686)*sailStates.alpha + (0.943479)*sailStates.beta + (-1.849497)*sailStates.p + (17.964834)*sailStates.q + (-3.314191)*sailStates.r + (0.001261)*sailStates.de;
	Cm = (-12.167724)*sailStates.alpha + (-2.832457)*sailStates.beta + (9.225912)*sailStates.p + (-156.476898)*sailStates.q + (12.872219)*sailStates.r + (-0.069804)*sailStates.de;
	Cn = (1.792490)*sailStates.alpha + (0.113825)*sailStates.beta + (3.289407)*sailStates.p + (-15.230750)*sailStates.q + (0.053145)*sailStates.r + (-0.000940)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end